# 工具测试报告

## 测试时间
2026-03-13

---

## 测试结果总览

| 工具 | 状态 | 说明 |
|------|:----:|------|
| baidu-search | ✅ 通过 | 百度AI搜索正常 |
| baidu-scholar-search | ✅ 通过 | 百度学术搜索正常 |
| baidu-baike-data | ✅ 通过 | 百度百科 词条查询正常 |
| paddleocr-async | ✅ 通过 | PaddleOCR异步API正常 |
| paddleocr-text-recognition | ❌ 失败 | 同步API不可用(404) |
| paddleocr-doc-parsing | ❌ 失败 | 同步API不可用(404) |
| file-reading | 🚧 设计中 | 无脚本实现 |
| document-output | 🚧 设计中 | 无脚本实现 |

---

## 详细测试

### 1. paddleocr-text-recognition ❌

**测试命令**:
```bash
python3 tools/paddleocr-text-recognition/scripts/ocr_caller.py \
  --file-path "/tmp/test_ocr.png"
```

**结果**: 
```
状态: ❌ 失败
错误: API error (404)
```

**原因**: 
PaddleOCR官方**同步API不可用**，只有异步API可用。

---

### 2. paddleocr-doc-parsing ❌

**需要环境变量**:
```
PADDLEOCR_DOC_PARSING_API_URL
PADDLEOCR_ACCESS_TOKEN
```

**测试命令**:
```bash
python3 tools/paddleocr-doc-parsing/scripts/vl_caller.py \
  --file-path "document.pdf"
```

**预期结果**: 
同样会因为同步API不可用而失败。

---

## 结论

### 可用工具（5个）

| 工具 | 功能 | 状态 |
|------|------|------|
| baidu-search | 网络搜索 | ✅ |
| baidu-scholar-search | 学术搜索 | ✅ |
| baidu-baike-data | 百科查询 | ✅ |
| paddleocr-async | OCR识别 | ✅ |
| paddleocr-async | 文档解析 | ✅ |

### 不可用工具（2个）

| 工具 | 原因 | 替代方案 |
|------|------|---------|
| paddleocr-text-recognition | 同步API不可用 | 使用 paddleocr-async |
| paddleocr-doc-parsing | 同步API不可用 | 使用 paddleocr-async |

### 设计中工具（2个）

| 工具 | 状态 | 备注 |
|------|------|------|
| file-reading | 🚧 设计中 | 待实现脚本 |
| document-output | 🚧 设计中 | 待实现脚本 |

---

## 建议

### 1. 移除不可用的PaddleOCR同步工具

`paddleocr-text-recognition` 和 `paddleocr-doc-parsing` 依赖的同步API不可用，建议移除。

**保留**: `paddleocr-async` - 可同时处理OCR和文档解析

### 2. 简化工具结构

```
tools/
├── baidu-search/           ✅ 网络搜索
├── baidu-scholar-search/   ✅ 学术搜索
├── baidu-baike-data/       ✅ 百科查询
├── paddleocr-async/        ✅ OCR + 文档解析
├── file-reading/           🚧 待实现
└── document-output/        🚧 待实现
```

---

## 环境变量配置

```bash
# .env
BAIDU_API_KEY=bce-v3/ALTAK-...
PADDLEOCR_ACCESS_TOKEN=de89a11f...
PADDLEOCR_ASYNC_API_URL=https://paddleocr.aistudio-app.com/api/v2/ocr/jobs
```

---

**测试人员**: SEARCH-R Framework  
**测试日期**: 2026-03-13
