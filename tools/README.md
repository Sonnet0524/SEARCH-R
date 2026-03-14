# Tools - 底层工具库

## 概述

本目录包含Research Agent可用的底层工具，遵循Skills v2.0标准。

---

## 工具列表

### 百度系列（3个）

| 工具 | 用途 | 状态 |
|------|------|:----:|
| [baidu-search](baidu-search/SKILL.md) | 百度AI搜索（全球下载量第一） | ✅ 已测试 |
| [baidu-scholar-search](baidu-scholar-search/SKILL.md) | 百度学术文献检索 | ✅ 已测试 |
| [baidu-baike-data](baidu-baike-data/SKILL.md) | 百度百科 词条查询 | ✅ 已测试 |

### PaddleOCR系列（3个）

| 工具 | 用途 | 状态 |
|------|------|:----:|
| [paddleocr-doc-parsing](paddleocr-doc-parsing/SKILL.md) | 高级文档解析（表格、公式、图表） | ⚠️ 待测试 |
| [paddleocr-text-recognition](paddleocr-text-recognition/SKILL.md) | 图像/PDF文字识别 | ⚠️ 待测试 |
| [paddleocr-async](paddleocr-async/SKILL.md) | PaddleOCR异步API调用 | ✅ 已测试 |

### 通用工具（2个）

| 工具 | 用途 | 状态 |
|------|------|:----:|
| [file-reading](file-reading/SKILL.md) | 读取PDF/Word/Excel等 | 🚧 建设中 |
| [document-output](document-output/SKILL.md) | 生成格式化文档 | 🚧 建设中 |

**状态说明**：
- ✅ 已测试 - 功能正常，可直接使用
- ⚠️ 待测试 - 需要API配置或进一步测试
- 🚧 建设中 - 脚本待实现，功能受限

---

## 环境配置

所有工具共用统一的环境变量配置，参见项目根目录的 `.env` 文件。

```bash
# 百度API统一Key
BAIDU_API_KEY=bce-v3/ALTAK-...

# PaddleOCR Token
PADDLEOCR_ACCESS_TOKEN=de89a11f...

# PaddleOCR 同步API（用户专属URL，需从任务页面获取）
PADDLEOCR_OCR_API_URL=https://your-instance.aistudio-app.com/ocr
PADDLEOCR_DOC_PARSING_API_URL=https://your-instance.aistudio-app.com/layout-parsing
```

**⚠️ 重要提示**：
- 百度系列工具只需 `BAIDU_API_KEY`
- PaddleOCR同步API需要**专属URL**，需从 https://aistudio.baidu.com/paddleocr/task 获取
- 详细配置指南参见 [API_KEYS_SETUP.md](../API_KEYS_SETUP.md)

---

## 使用方式

```python
# 方式1：直接调用脚本
python3 tools/baidu-search/scripts/search.py '{"query":"关键词"}'

# 方式2：被Skills调用
# skills/literature-review 会调用 tools/baidu-scholar-search
```

---

## 工具开发规范

### 1. 目录结构

```
tool-name/
├── SKILL.md          # 工具说明
├── scripts/          # 可执行脚本
│   ├── search.py
│   └── ...
└── references/       # 参考文档
```

### 2. SKILL.md格式

```markdown
---
name: tool-name
description: 工具描述
metadata: { "openclaw": { "requires": { "env":["API_KEY"] } } }
---

# Tool Name

## Usage
...

## Parameters
...
```

### 3. 脚本规范

- 接收命令行参数或JSON输入
- 返回JSON格式输出
- 从环境变量读取敏感信息
- 提供错误处理和帮助信息

---

**维护者**: SEARCH-R Framework  
**更新时间**: 2026-03-14  
**版本**: v2.1
