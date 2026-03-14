# Tools 清单

## 统计
- **总数**: 8个工具
- **已测试**: 4个
- **待测试**: 2个
- **建设中**: 2个

---

## 百度系列（3个）

| 工具 | 描述 | 状态 |
|------|------|:----:|
| **baidu-search** | 百度AI搜索，全球下载量第一 | ✅ 已测试 |
| **baidu-scholar-search** | 百度学术文献检索 | ✅ 已测试 |
| **baidu-baike-data** | 百度百科 词条查询 | ✅ 已测试 |

### 功能对比

| 工具 | 数据源 | 用途 | 触发条件 |
|------|--------|------|---------|
| baidu-search | 全网网页 | 实时信息搜索 | "百度搜索"、"全网搜索" |
| baidu-scholar-search | 学术数据库 | 论文检索 | "学术搜索"、"论文搜索" |
| baidu-baike-data | 百度百科 | 概念定义查询 | "百科查询"、"词条解释" |

---

## PaddleOCR系列（3个）

| 工具 | 描述 | 状态 |
|------|------|:----:|
| **paddleocr-async** | PaddleOCR异步API调用 | ✅ 已测试 |
| **paddleocr-doc-parsing** | 高级文档解析（表格、公式、图表） | ⚠️ 待测试 |
| **paddleocr-text-recognition** | 图像/PDF文字识别 | ⚠️ 待测试 |

### 功能对比

| 工具 | 功能 | 适用场景 | 文件限制 |
|------|------|---------|---------|
| paddleocr-async | 文本识别+文档解析 | 大文件处理 | PDF最多1000页 |
| paddleocr-doc-parsing | 文档结构解析 | 复杂文档 | 需要专属URL配置 |
| paddleocr-text-recognition | 文字识别 | 图像OCR | 需要专属URL配置 |

**⚠️ 重要提示**：
- paddleocr-doc-parsing 和 paddleocr-text-recognition 需要**专属URL**
- 需要从百度AI Studio任务页面获取：https://aistudio.baidu.com/paddleocr/task
- 详细获取步骤参见：[API_KEYS_SETUP.md](../API_KEYS_SETUP.md#3-paddleocr_ocr_api_url)

---

## 通用工具（2个）

| 工具 | 描述 | 状态 |
|------|------|:----:|
| **file-reading** | 读取PDF/Word/Excel等 | 🚧 建设中 |
| **document-output** | 生成格式化文档 | 🚧 建设中 |

---

## 详细清单

### 1. baidu-search ✅
- **名称**: baidu-search
- **描述**: Search the web using Baidu AI Search Engine (BDSE)
- **路径**: tools/baidu-search/
- **脚本**: search.py
- **环境变量**: BAIDU_API_KEY
- **API**: https://qianfan.baidubce.com/v2/ai_search/web_search

### 2. baidu-scholar-search ✅
- **名称**: baidu-scholar-search-skill
- **描述**: Search Chinese and English academic literature
- **路径**: tools/baidu-scholar-search/
- **脚本**: search.py, search.sh
- **环境变量**: BAIDU_API_KEY
- **API**: https://qianfan.baidubce.com/v2/tools/baidu_scholar/search

### 3. baidu-baike-data ✅
- **名称**: baidu-baike-data
- **描述**: Query encyclopedia entries from Baidu Baike
- **路径**: tools/baidu-baike-data/
- **脚本**: baike.py
- **环境变量**: BAIDU_API_KEY
- **API**: https://appbuilder.baidu.com/v2/baike

### 4. paddleocr-async ✅
- **名称**: paddleocr-async
- **描述**: PaddleOCR异步API调用
- **路径**: tools/paddleocr-async/
- **脚本**: paddleocr_async.py
- **环境变量**: PADDLEOCR_ACCESS_TOKEN
- **API**: https://paddleocr.aistudio-app.com/api/v2/ocr/jobs

### 5. paddleocr-doc-parsing ⚠️
- **名称**: paddleocr-doc-parsing
- **描述**: 高级文档解析
- **路径**: tools/paddleocr-doc-parsing/
- **脚本**: vl_caller.py, lib.py, split_pdf.py等
- **环境变量**: PADDLEOCR_DOC_PARSING_API_URL, PADDLEOCR_ACCESS_TOKEN
- **注意**: 需要专属URL

### 6. paddleocr-text-recognition ⚠️
- **名称**: paddleocr-text-recognition
- **描述**: 文本识别
- **路径**: tools/paddleocr-text-recognition/
- **脚本**: ocr_caller.py, lib.py等
- **环境变量**: PADDLEOCR_OCR_API_URL, PADDLEOCR_ACCESS_TOKEN
- **注意**: 需要专属URL

### 7. file-reading 🚧
- **名称**: file-reading
- **描述**: 读取和解析各类文件内容
- **路径**: tools/file-reading/
- **脚本**: 无（待实现）
- **支持格式**: PDF, Word, Excel, Markdown

### 8. document-output 🚧
- **名称**: document-output
- **描述**: 生成格式化的文档输出
- **路径**: tools/document-output/
- **脚本**: 无（待实现）
- **支持格式**: Markdown, HTML, PDF

---

## 环境变量汇总

```bash
# 百度统一API Key（适用于所有百度工具）
BAIDU_API_KEY=bce-v3/ALTAK-...

# PaddleOCR Token（与BAIDU_API_KEY相同）
PADDLEOCR_ACCESS_TOKEN=de89a11f...

# PaddleOCR 专属URL（需从任务页面获取）
# 获取地址: https://aistudio.baidu.com/paddleocr/task
PADDLEOCR_OCR_API_URL=https://your-instance.aistudio-app.com/ocr
PADDLEOCR_DOC_PARSING_API_URL=https://your-instance.aistudio-app.com/layout-parsing

# PaddleOCR 异步API（公共URL，无需修改）
PADDLEOCR_ASYNC_API_URL=https://paddleocr.aistudio-app.com/api/v2/ocr/jobs
```

---

## 测试状态

| 工具 | 测试状态 | 测试日期 | 备注 |
|------|---------|---------|------|
| baidu-search | ✅ 通过 | 2026-03-13 | 功能正常 |
| baidu-scholar-search | ✅ 通过 | 2026-03-13 | 已修复code字段问题 |
| baidu-baike-data | ✅ 通过 | 2026-03-13 | 功能正常 |
| paddleocr-async | ✅ 通过 | 2026-03-13 | 功能正常 |
| paddleocr-doc-parsing | ⚠️ 待测试 | - | 需配置专属URL |
| paddleocr-text-recognition | ⚠️ 待测试 | - | 需配置专属URL |
| file-reading | 🚧 建设中 | - | 脚本待实现 |
| document-output | 🚧 建设中 | - | 脚本待实现 |

**状态说明**：
- ✅ 已测试 - 功能正常，可直接使用
- ⚠️ 待测试 - 需要API配置，功能待验证
- 🚧 建设中 - 脚本待实现，功能受限

---

**更新时间**: 2026-03-14  
**维护者**: SEARCH-R Framework
