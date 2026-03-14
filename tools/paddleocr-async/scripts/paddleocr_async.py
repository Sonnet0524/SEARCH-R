#!/usr/bin/env python3
"""
PaddleOCR 异步API调用脚本
支持文本识别和文档解析
"""

import os
import sys
import json
import time
import argparse
import requests
from pathlib import Path

# 配置
ASYNC_API_URL = os.getenv("PADDLEOCR_ASYNC_API_URL", "https://paddleocr.aistudio-app.com/api/v2/ocr/jobs")
TOKEN = os.getenv("PADDLEOCR_ACCESS_TOKEN", "")

def submit_job(file_path=None, file_url=None, model="PP-OCRv5"):
    """提交OCR任务"""
    if not TOKEN:
        return {"ok": False, "error": "PADDLEOCR_ACCESS_TOKEN not configured"}
    
    headers = {
        "Authorization": f"bearer {TOKEN}",
    }
    
    if file_url:
        # URL模式
        headers["Content-Type"] = "application/json"
        payload = {
            "fileUrl": file_url,
            "model": model,
        }
        response = requests.post(ASYNC_API_URL, json=payload, headers=headers)
    elif file_path:
        # 本地文件模式
        if not os.path.exists(file_path):
            return {"ok": False, "error": f"File not found: {file_path}"}
        
        data = {"model": model}
        with open(file_path, "rb") as f:
            files = {"file": f}
            response = requests.post(ASYNC_API_URL, headers=headers, data=data, files=files)
    else:
        return {"ok": False, "error": "file_path or file_url required"}
    
    if response.status_code != 200:
        return {"ok": False, "error": f"API error ({response.status_code}): {response.text}"}
    
    result = response.json()
    if result.get("code", 0) != 0:
        return {"ok": False, "error": result.get("msg", "Unknown error")}
    
    return {"ok": True, "job_id": result["data"]["jobId"]}


def get_job_result(job_id, wait=True, poll_interval=3):
    """获取任务结果"""
    if not TOKEN:
        return {"ok": False, "error": "PADDLEOCR_ACCESS_TOKEN not configured"}
    
    headers = {"Authorization": f"bearer {TOKEN}"}
    url = f"{ASYNC_API_URL}/{job_id}"
    
    while True:
        response = requests.get(url, headers=headers)
        if response.status_code != 200:
            return {"ok": False, "error": f"API error ({response.status_code}): {response.text}"}
        
        result = response.json()
        if result.get("code", 0) != 0:
            return {"ok": False, "error": result.get("msg", "Unknown error")}
        
        data = result["data"]
        state = data["state"]
        
        if state == "done":
            # 获取结果JSON
            json_url = data.get("resultUrl", {}).get("jsonUrl")
            if not json_url:
                return {"ok": False, "error": "No result URL in response"}
            
            json_response = requests.get(json_url)
            if json_response.status_code != 200:
                return {"ok": False, "error": f"Failed to fetch result: {json_response.status_code}"}
            
            return {
                "ok": True,
                "result": json_response.json(),
                "progress": data.get("extractProgress", {}),
            }
        elif state == "failed":
            return {"ok": False, "error": data.get("errorMsg", "Job failed")}
        elif not wait:
            return {"ok": True, "state": state, "progress": data.get("extractProgress", {})}
        else:
            # 继续等待
            progress = data.get("extractProgress", {})
            total = progress.get("totalPages", "?")
            extracted = progress.get("extractedPages", "?")
            print(f"处理中... ({extracted}/{total}页)", file=sys.stderr)
            time.sleep(poll_interval)


def extract_text(result_data):
    """从结果中提取文本"""
    result = result_data.get("result", {})
    
    # PP-OCRv5 使用 ocrResults
    if "ocrResults" in result:
        texts = []
        for res in result["ocrResults"]:
            rec_texts = res.get("prunedResult", {}).get("rec_texts", [])
            texts.extend(rec_texts)
        return "\n".join(texts)
    
    # PaddleOCR-VL 使用 layoutParsingResults
    if "layoutParsingResults" in result:
        texts = []
        for res in result["layoutParsingResults"]:
            md_text = res.get("markdown", {}).get("text", "")
            texts.append(md_text)
        return "\n\n".join(texts)
    
    return ""


def main():
    parser = argparse.ArgumentParser(description="PaddleOCR 异步API调用")
    parser.add_argument("--file-path", help="本地文件路径")
    parser.add_argument("--file-url", help="文件URL")
    parser.add_argument("--model", default="PP-OCRv5", 
                       choices=["PP-OCRv5", "PaddleOCR-VL-1.5", "PaddleOCR-VL", "PP-StructureV3"],
                       help="模型选择")
    parser.add_argument("--job-id", help="获取指定任务的结果")
    parser.add_argument("--no-wait", action="store_true", help="不等待结果，仅返回状态")
    parser.add_argument("--output", "-o", help="输出文件路径")
    parser.add_argument("--pretty", action="store_true", help="格式化输出")
    
    args = parser.parse_args()
    
    if args.job_id:
        # 获取已有任务结果
        result = get_job_result(args.job_id, wait=not args.no_wait)
    elif args.file_path or args.file_url:
        # 提交新任务
        print(f"提交任务: {args.file_path or args.file_url}", file=sys.stderr)
        submit_result = submit_job(
            file_path=args.file_path,
            file_url=args.file_url,
            model=args.model
        )
        
        if not submit_result["ok"]:
            print(f"错误: {submit_result['error']}", file=sys.stderr)
            sys.exit(1)
        
        job_id = submit_result["job_id"]
        print(f"任务ID: {job_id}", file=sys.stderr)
        
        if args.no_wait:
            print(json.dumps({"ok": True, "job_id": job_id}, indent=2))
            sys.exit(0)
        
        # 等待结果
        result = get_job_result(job_id)
    else:
        parser.print_help()
        sys.exit(1)
    
    if not result["ok"]:
        print(f"错误: {result['error']}", file=sys.stderr)
        sys.exit(1)
    
    # 输出结果
    if args.pretty:
        output = {
            "ok": True,
            "text": extract_text(result.get("result", {})),
            "progress": result.get("progress", {}),
            "result": result.get("result", {}),
        }
        output_json = json.dumps(output, indent=2, ensure_ascii=False)
    else:
        output_json = json.dumps(result, indent=2, ensure_ascii=False)
    
    if args.output:
        Path(args.output).write_text(output_json, encoding="utf-8")
        print(f"结果已保存到: {args.output}", file=sys.stderr)
    else:
        print(output_json)


if __name__ == "__main__":
    main()
