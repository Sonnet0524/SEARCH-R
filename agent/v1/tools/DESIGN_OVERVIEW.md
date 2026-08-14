# 通用工具设计说明

## 概述

本文档说明file-reading和document-output两个通用工具的设计。

---

## 1. file-reading（文件读取）

### 状态
🚧 **设计中** - 脚本待实现

### 设计目标
读取和解析**本地文件**

### 支持格式

| 格式 | 扩展名 | 支持内容 |
|------|--------|---------|
| PDF | .pdf | 文本、表格、图片描述 |
| Word | .docx, .doc | 文本、表格、样式 |
| Excel | .xlsx, .xls, .et | 单元格数据、公式 |
| Markdown | .md | 文本、代码块、表格 |
| Text | .txt, .csv | 纯文本内容 |

### 设计接口

```python
# TODO: 待实现 scripts/reader.py
from tools.file_reading.scripts.reader import read_file

result = read_file(
    path="/path/to/file.pdf",
    options={"extract_tables": True}
)
```

### 输出结构

```json
{
  "success": true,
  "format": "pdf",
  "path": "/path/to/file.pdf",
  "content": "文件内容...",
  "metadata": {
    "pages": 10,
    "author": "作者",
    "created": "2026-03-10"
  }
}
```

### 与PaddleOCR协作

```
file-reading
    ↓
是扫描件PDF？
    ↓ 是
paddleocr-text-recognition
    ↓
OCR识别结果
```

---

## 2. document-output（文档输出）

### 状态
🚧 **设计中** - 脚本待实现

### 设计目标
生成**格式美观**的结构化文档

### 文档类型

| 类型 | 结构 | 用途 |
|------|------|------|
| **report** | 标题+摘要+章节+参考文献 | 研究报告 |
| **note** | 标题+背景+内容+发现 | 观察笔记 |
| **summary** | 标题+来源+要点+评价 | 文献摘要 |
| **analysis** | 标题+数据+分析+结论 | 分析报告 |

### 设计接口

```python
# TODO: 待实现 scripts/generator.py
from tools.document_output.scripts.generator import generate_document

result = generate_document(
    doc_type="report",
    title="研究报告标题",
    content={
        "abstract": "摘要内容",
        "sections": [...],
        "references": [...]
    },
    format="markdown"
)
```

### 输出示例

```markdown
# 报告标题

> **作者**: Research Agent  
> **日期**: 2026-03-11  
> **类型**: 研究报告

## 摘要

摘要内容...

## 一、章节标题

### 1.1 子章节

内容...

## 参考文献

1. 参考文献1
2. 参考文献2

---

**生成时间**: 2026-03-11 10:30:00
```

---

## 实现优先级

| 工具 | 优先级 | 原因 |
|------|--------|------|
| file-reading | 高 | 研究中常需读取PDF/Excel |
| document-output | 中 | 可用模板替代 |

---

## 实现建议

### file-reading

可复用现有库：
- PDF: `PyPDF2`, `pdfplumber`
- Word: `python-docx`
- Excel: `openpyxl`, `pandas`

### document-output

可使用Jinja2模板引擎

---

**文档更新**: 2026-03-13  
**维护者**: SEARCH-R Framework
