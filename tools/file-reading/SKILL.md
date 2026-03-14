---
name: file-reading
description: 读取和解析各类文件内容。当用户要求"读取"、"解析"、"查看"PDF、Word、Excel、Markdown等文件时触发。
trigger: on_demand
tags: 文件处理, PDF, Word, Excel, 解析
status: draft
implementation: pending
---

# File Reading Skill

> **状态**: 🚧 设计中 - 脚本待实现

读取和解析各类文件，提取结构化内容。

## Execution Flow

1. 识别文件类型（扩展名）
2. 选择对应的解析器
3. 提取文本和结构信息
4. 返回格式化内容

## Supported Formats

| 格式 | 扩展名 | 支持内容 |
|------|--------|---------|
| PDF | .pdf | 文本、表格、图片描述 |
| Word | .docx, .doc | 文本、表格、样式 |
| Excel | .xlsx, .xls, .et | 单元格数据、公式 |
| Markdown | .md | 文本、代码块、表格 |
| Text | .txt, .csv | 纯文本内容 |

## Tool Call

> ⚠️ **待实现**: 以下接口为设计规范，脚本尚未编写

```python
# TODO: 待实现 scripts/reader.py
from skills.file_reading.scripts.reader import read_file

# 读取文件
result = read_file(
    path="/path/to/file.pdf",
    options={"extract_tables": True}
)

# 处理结果
if result["success"]:
    print(f"格式: {result['format']}")
    print(f"内容: {result['content'][:500]}...")
```

## Output Structure

### 成功输出
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
  },
  "tables": [...]  // 如果提取表格
}
```

### 错误输出
```json
{
  "success": false,
  "error": "文件不存在或格式不支持"
}
```

## Usage Patterns

### Pattern 1: PDF阅读
```
User: "读取这个PDF文件的内容"

→ read_file(path="report.pdf", options={"extract_tables": True})
→ 返回文本内容和表格数据
```

### Pattern 2: Excel数据分析
```
User: "查看这个Excel文件的结构"

→ read_file(path="data.xlsx")
→ 返回工作表名称、行列数、数据预览
```

### Pattern 3: Word文档提取
```
User: "提取这个Word文档的文本"

→ read_file(path="document.docx")
→ 返回纯文本内容
```

## Options

| 选项 | 说明 | 默认值 |
|------|------|--------|
| extract_tables | 提取表格 | false |
| extract_images | 提取图片信息 | false |
| encoding | 文本编码 | utf-8 |
| sheet_name | Excel工作表名 | 第一个 |

## Limitations

- PDF扫描件需要OCR支持
- 加密文件需要密码
- 超大文件可能需要分块处理

## References

- `references/format-specs.md` - 各格式规范
- `scripts/reader.py` - 读取器实现
