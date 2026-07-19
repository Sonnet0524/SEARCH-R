---
name: file-reading
description: 读取和解析Excel、Word等文件内容。当用户要求"读取"、"解析"、"查看"Excel(.xlsx/.xls/.et)或Word(.docx)文件时触发。
trigger: on_demand
tags: 文件处理, Excel, Word, 解析
status: ready
---

# File Reading Tool

读取和解析 Excel、Word 文件，提取结构化内容。

## 支持的格式

| 格式 | 扩展名 | 说明 |
|------|--------|------|
| Excel 2007+ | .xlsx, .xlsm | 单元格数据、公式 |
| Excel 97-2003 | .xls | 单元格数据 |
| WPS 表格 | .et | 单元格数据 |
| Word | .docx | 文本、表格、样式 |

## 依赖安装

```bash
pip install -r tools/file-reading/scripts/requirements.txt
```

依赖包：
- `openpyxl>=3.1.0` - 读取 .xlsx/.xlsm
- `python-docx>=0.8.11` - 读取 .docx
- `xlrd>=2.0.0` - 读取 .xls
- `pywin32>=300` - 读取 .et (仅 Windows)

## 使用方法

### 方式一：直接导入模块

```python
import sys
sys.path.insert(0, 'tools/file-reading/scripts')

from read_excel import read_excel, read_excel_as_markdown
from read_docx import read_docx, read_docx_as_markdown

# 读取 Excel
result = read_excel('data.xlsx')
print(result['file_info'])
print(result['sheets'][0]['data'])

# 读取为 Markdown
md = read_excel_as_markdown('data.xlsx')
print(md)

# 读取 Word
doc = read_docx('document.docx')
print(doc['title'])
print(doc['content'])
```

### 方式二：作为包导入

```python
import sys
sys.path.insert(0, 'tools/file-reading/scripts')

from scripts import read_excel, read_excel_as_markdown
from scripts import read_docx, read_docx_as_markdown
```

## 返回数据结构

### Excel 返回结构

```python
{
    "file_info": {
        "file_path": "文件路径",
        "total_sheets": 工作表总数,
        "read_sheets": 实际读取数量,
        "format": ".xlsx"
    },
    "sheets": [
        {
            "name": "工作表名称",
            "rows": 行数,
            "columns": 列数,
            "data": [[单元格数据...], ...]
        }
    ]
}
```

### Word 返回结构

```python
{
    "file_info": {
        "file_path": "文件路径",
        "paragraphs_count": 段落数,
        "tables_count": 表格数
    },
    "title": "文档标题",
    "content": [
        {"type": "heading", "level": 1, "text": "标题文本"},
        {"type": "paragraph", "text": "段落文本"},
        {"type": "list", "text": "列表项"}
    ],
    "tables": [
        {"rows": 3, "columns": 2, "data": [[...], [...]]}
    ]
}
```

## 使用模式

### 模式 1：读取 Excel 数据文件

```python
from read_excel import read_excel

# 读取研究数据
data = read_excel('research_data.xlsx')

# 获取第一个工作表
sheet = data['sheets'][0]
print(f"工作表: {sheet['name']}, 行数: {sheet['rows']}")

# 获取表头
headers = sheet['data'][0]
print(f"列名: {headers}")

# 获取数据行
for row in sheet['data'][1:5]:  # 前5行数据
    print(row)
```

### 模式 2：读取 Word 调研文档

```python
from read_docx import read_docx

# 读取调研报告
doc = read_docx('survey_report.docx')

# 提取标题结构
headings = [item for item in doc['content'] if item['type'] == 'heading']
for h in headings:
    print(f"{'  ' * (h['level']-1)}{h['text']}")

# 提取正文
paragraphs = [item['text'] for item in doc['content'] if item['type'] == 'paragraph']
full_text = '\n'.join(paragraphs)
```

### 模式 3：转换为 Markdown

```python
from read_excel import read_excel_as_markdown
from read_docx import read_docx_as_markdown

# Excel 转 Markdown 表格
md_table = read_excel_as_markdown('data.xlsx')

# Word 转 Markdown
doc_md = read_docx_as_markdown('report.docx')
```

## 参数说明

### read_excel / read_excel_as_markdown

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `file_path` | str | 是 | 文件路径 |
| `sheet_names` | list | 否 | 指定工作表名称，默认全部 |
| `max_rows` | int | 否 | 最大读取行数，默认无限制 |

### read_docx / read_docx_as_markdown

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `file_path` | str | 是 | 文件路径 |

## 限制说明

| 限制 | 说明 |
|------|------|
| PDF | 不支持，请使用 paddleocr-text-recognition 或 paddleocr-doc-parsing |
| .et 格式 | 需要 Windows 环境和 pywin32 |
| 加密文件 | 需要密码 |
| 超大文件 | 使用 `max_rows` 参数限制读取行数 |

## 相关工具

- **paddleocr-text-recognition**: 图像/PDF 文字识别
- **paddleocr-doc-parsing**: 高级文档解析（表格、公式）

## 版本信息

- **基于**: shared-tools v1.1.0
- **状态**: ready
- **更新时间**: 2026-04-27

---

**维护者**: SEARCH-R Framework