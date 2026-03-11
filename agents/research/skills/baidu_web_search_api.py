#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
百度搜索API调用脚本（正确版本）

基于百度千帆平台百度搜索（BaiduSearch）API
文档：https://cloud.baidu.com/doc/AppBuilder/s/klv6eyrj9

功能：
1. 调用百度搜索API进行实时信息检索
2. 支持网页、视频、图片、阿拉丁搜索
3. 支持站点过滤、时效过滤
4. 自动记录搜索日志

使用方法：
    python baidu_web_search_api.py --query "搜索关键词"
    python baidu_web_search_api.py --query "搜索关键词" --top_k 10
    python baidu_web_search_api.py --query "搜索关键词" --site "www.weather.com.cn"
"""

import os
import sys
import json
import time
import argparse
import requests
from datetime import datetime
from pathlib import Path
from typing import Dict, Any, Optional, List


class BaiduWebSearch:
    """百度搜索客户端"""
    
    def __init__(self, api_key: Optional[str] = None):
        """
        初始化搜索客户端
        
        Args:
            api_key: 百度千帆API Key，如果为None则从环境变量或配置文件读取
        """
        self.api_key = api_key or self._load_api_key()
        self.base_url = "https://qianfan.baidubce.com/v2/ai_search/web_search"
        self.timeout = 15
        
        # 搜索日志目录
        self.log_dir = Path(__file__).parent.parent / "search-logs"
        self.log_dir.mkdir(parents=True, exist_ok=True)
        
        # 今日日期
        self.today = datetime.now().strftime("%Y-%m-%d")
        
    def _load_api_key(self) -> str:
        """从环境变量或配置文件加载API Key"""
        # 方式1：从环境变量读取
        api_key = os.getenv("BAIDU_AISEARCH_TOKEN")
        if api_key:
            return api_key
        
        # 方式2：从.env.local文件读取
        env_files = [
            Path(__file__).parent.parent.parent / ".env.local",
            Path(__file__).parent.parent / ".env.local",
            Path("D:/opencode/github/.env.local")
        ]
        
        for env_file in env_files:
            if env_file.exists():
                with open(env_file, 'r', encoding='utf-8') as f:
                    for line in f:
                        if line.startswith("BAIDU_AISEARCH_TOKEN="):
                            return line.strip().split('=', 1)[1]
        
        raise ValueError(
            "未找到BAIDU_AISEARCH_TOKEN，请通过以下方式配置：\n"
            "1. 设置环境变量：export BAIDU_AISEARCH_TOKEN='your_api_key'\n"
            "2. 在项目根目录创建.env.local文件并添加：BAIDU_AISEARCH_TOKEN=your_api_key\n"
            "3. 在D:/opencode/github/.env.local文件中配置"
        )
    
    def search(
        self,
        query: str,
        top_k: int = 20,
        resource_types: Optional[List[str]] = None,
        site_filter: Optional[List[str]] = None,
        recency_filter: Optional[str] = None,
        block_websites: Optional[List[str]] = None,
        edition: str = "standard"
    ) -> Dict[str, Any]:
        """
        执行百度搜索
        
        Args:
            query: 搜索查询关键词
            top_k: 返回结果数量，默认20
            resource_types: 资源类型列表，如["web", "video", "image"]
            site_filter: 指定站点列表，如["www.weather.com.cn"]
            recency_filter: 时效过滤，如"week", "month", "year"
            block_websites: 屏蔽站点列表
            edition: 搜索版本，"standard"或"lite"
            
        Returns:
            搜索结果字典
        """
        # 构建请求参数
        payload = {
            "messages": [
                {
                    "content": query,
                    "role": "user"
                }
            ],
            "search_source": "baidu_search_v2",
            "edition": edition
        }
        
        # 设置资源类型
        if resource_types is None:
            resource_types = ["web"]
        
        resource_type_filter = []
        for res_type in resource_types:
            if res_type == "web":
                resource_type_filter.append({"type": "web", "top_k": min(top_k, 50)})
            elif res_type == "video":
                resource_type_filter.append({"type": "video", "top_k": min(top_k, 10)})
            elif res_type == "image":
                resource_type_filter.append({"type": "image", "top_k": min(top_k, 30)})
            elif res_type == "aladdin":
                resource_type_filter.append({"type": "aladdin", "top_k": min(top_k, 5)})
        
        payload["resource_type_filter"] = resource_type_filter
        
        # 设置站点过滤
        if site_filter:
            payload["search_filter"] = {
                "match": {
                    "site": site_filter[:20]  # 最多20个站点
                }
            }
        
        # 设置时效过滤
        if recency_filter:
            payload["search_recency_filter"] = recency_filter
        
        # 设置屏蔽站点
        if block_websites:
            payload["block_websites"] = block_websites
        
        # 执行搜索
        start_time = time.time()
        try:
            headers = {
                "Authorization": f"Bearer {self.api_key}",
                "Content-Type": "application/json"
            }
            
            response = requests.post(
                self.base_url,
                headers=headers,
                json=payload,
                timeout=self.timeout
            )
            end_time = time.time()
            response_time_ms = int((end_time - start_time) * 1000)
            
            # 检查响应状态
            if response.status_code == 200:
                result = response.json()
                
                # 记录搜索日志
                self._log_search(query, result, response_time_ms)
                
                return {
                    "success": True,
                    "request_id": result.get("request_id"),
                    "references": result.get("references", []),
                    "response_time_ms": response_time_ms,
                    "result_count": len(result.get("references", []))
                }
            else:
                error_result = response.json()
                return {
                    "success": False,
                    "error": error_result.get("message", "Unknown error"),
                    "error_code": error_result.get("code"),
                    "response_time_ms": response_time_ms
                }
                
        except requests.exceptions.Timeout:
            return {
                "success": False,
                "error": "请求超时",
                "response_time_ms": self.timeout * 1000
            }
        except Exception as e:
            return {
                "success": False,
                "error": str(e),
                "response_time_ms": int((time.time() - start_time) * 1000)
            }
    
    def _log_search(self, query: str, result: Dict[str, Any], response_time_ms: int):
        """记录搜索日志"""
        log_entry = {
            "timestamp": datetime.now().isoformat(),
            "query": query,
            "response_time_ms": response_time_ms,
            "request_id": result.get("request_id"),
            "result_count": len(result.get("references", []))
        }
        
        log_file = self.log_dir / f"{self.today}.jsonl"
        with open(log_file, 'a', encoding='utf-8') as f:
            f.write(json.dumps(log_entry, ensure_ascii=False) + '\n')


def main():
    parser = argparse.ArgumentParser(description="百度搜索API调用工具")
    parser.add_argument("--query", required=True, help="搜索查询关键词")
    parser.add_argument("--top_k", type=int, default=20, help="返回结果数量，默认20")
    parser.add_argument("--resource_types", nargs='+', default=["web"], 
                       help="资源类型：web, video, image, aladdin")
    parser.add_argument("--site", nargs='+', help="指定站点列表")
    parser.add_argument("--recency", choices=["week", "month", "semiyear", "year"],
                       help="时效过滤")
    parser.add_argument("--edition", choices=["standard", "lite"], default="standard",
                       help="搜索版本")
    
    args = parser.parse_args()
    
    # 创建搜索客户端
    client = BaiduWebSearch()
    
    # 执行搜索
    result = client.search(
        query=args.query,
        top_k=args.top_k,
        resource_types=args.resource_types,
        site_filter=args.site,
        recency_filter=args.recency,
        edition=args.edition
    )
    
    # 输出结果
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
