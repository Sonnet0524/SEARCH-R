---
name: paddleocr-async
description: PaddleOCR异步API调用。当用户要求"异步OCR"、"大文件识别"、"批量文档处理"时触发。支持PP-OCRv5、PaddleOCR-VL-1.5、PP-StructureV3模型。
---

# PaddleOCR 异步API Skill

## 概述

使用PaddleOCR官方异步API进行文本识别和文档解析。

## ✅ 已配置

- **Token**: 已配置并测试通过
- **API**: 异步API可用
- **支持模型**: PP-OCRv5, PaddleOCR-VL-1.5, PaddleOCR-VL, PP-StructureV3

## 🚀 快速使用

### 文本识别（PP-OCRv5）

```bash
# 从URL识别
python skills/paddleocr-async/scripts/paddleocr_async.py \
  --file-url "https://example.com/image.jpg" \
  --model PP-OCRv5 \
  --pretty

# 从本地文件识别
python skills/paddleocr-async/scripts/paddleocr_async.py \
  --file-path "./document.pdf" \
  --model PP-OCRv5 \
  --pretty
```

### 文档解析（PaddleOCR-VL-1.5）

```bash
# 解析PDF文档
python skills/paddleocr-async/scripts/paddleocr_async.py \
  --file-path "./paper.pdf" \
  --model PaddleOCR-VL-1.5 \
  --output result.json
```

## 📋 支持的模型

| 模型 | 用途 | 特点 |
|------|------|------|
| **PP-OCRv5** | 文本识别 | 支持5种文字类型，快速 |
| **PaddleOCR-VL-1.5** | 文档解析 | 最新版，支持表格、公式、图表 |
| **PaddleOCR-VL** | 文档解析 | 复杂文档解析 |
| **PP-StructureV3** | 文档解析 | 保持文档版式 |

## 📝 参数说明

| 参数 | 说明 | 示例 |
|------|------|------|
| `--file-path` | 本地文件路径 | `--file-path ./doc.pdf` |
| `--file-url` | 文件URL | `--file-url https://...` |
| `--model` | 模型选择 | `--model PP-OCRv5` |
| `--job-id` | 获取已有任务 | `--job-id ocrjob-xxx` |
| `--no-wait` | 不等待结果 | `--no-wait` |
| `--output` | 输出文件 | `--output result.json` |
| `--pretty` | 格式化输出 | `--pretty` |

## 📊 文件限制

| 类型 | 限制 |
|------|------|
| PDF页数 | 最多1000页 |
| 文件大小（URL） | 最大200MB |
| 文件大小（本地上传） | 最大50MB |

## ⚙️ 环境变量

```bash
# 必需
PADDLEOCR_ACCESS_TOKEN=<your_token>

# 可选
PADDLEOCR_ASYNC_API_URL=https://paddleocr.aistudio-app.com/api/v2/ocr/jobs
```

## 📚 相关链接

- [获取Token](https://aistudio.baidu.com/account/accessToken)
- [API文档](https://ai.baidu.com/ai-doc/AISTUDIO/Kmfl2ycs0)
- [PaddleOCR官网](https://aistudio.baidu.com/paddleocr)

## 🆓 免费额度

PaddleOCR API **限时免费**！
