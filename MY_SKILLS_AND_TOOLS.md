# 我的技能和工具列表

**版本**: v2.1  
**更新时间**: 2026-03-14

---

## 📋 总览

| 类别 | 数量 | 说明 |
|------|:----:|------|
| **Skills（业务能力）** | 4个 | 研究方法论指导 |
| **Tools（底层工具）** | 8个 | 实际执行能力 |
| **总计** | **12个** | |

---

## 🔧 Skills（业务能力）

### 1. literature-review（文献检索）

**用途**: 系统化检索、分析和整理文献

**触发条件**: 
- "检索文献"
- "调研现有研究"
- "文献综述"
- "了解研究现状"

**能力**:
- ✅ 关键词检索和扩展
- ✅ 文献质量评估
- ✅ 观点提取和对比
- ✅ 知识图谱构建

**输出格式**: 研究综述文档

**相关工具**:
- baidu-scholar-search（推荐）
- baidu-search
- baidu-baike-data
- file-reading（建设中）

---

### 2. observation（观察记录）

**用途**: 系统化观察实践，记录发现，提取模式

**触发条件**:
- "观察"
- "记录发现"
- "提取模式"
- "注意"

**能力**:
- ✅ 结构化记录观察
- ✅ 从数据中提取模式
- ✅ 发现异常和边界情况
- ✅ 形成初步假设

**输出格式**: 观察笔记文档

**相关工具**:
- file-reading（建设中）
- paddleocr-async
- document-output（建设中）

---

### 3. theory-building（理论构建）

**用途**: 构建理论框架，提出假设，验证理论有效性

**触发条件**:
- "构建理论"
- "建立模型"
- "提出假设"
- "理论分析"

**能力**:
- ✅ 概念定义和关系建模
- ✅ 命题推导和论证
- ✅ 理论框架构建
- ✅ 一致性检验

**输出格式**: 理论框架文档

**相关工具**:
- baidu-scholar-search
- baidu-baike-data
- document-output（建设中）

---

### 4. quality-gate（质量门控）

**用途**: 评估研究质量，判断确定性，决定Human介入时机

**触发条件**:
- 研究结论需验证时
- 评估研究质量时
- 决定是否需要Human确认时

**能力**:
- ✅ 研究确定性评估（高/中/低）
- ✅ 结论可接受性评估（高/中/低）
- ✅ 认知混淆识别
- ✅ Human介入决策

**输出格式**: 质量评估报告

**相关工具**:
- baidu-scholar-search
- document-output（建设中）

---

## 🛠️ Tools（底层工具）

### 百度系列（3个）

#### 1. baidu-search

**状态**: ✅ 已测试

**用途**: 百度AI搜索（全球下载量第一）

**触发条件**:
- "百度搜索"
- "全网搜索"

**功能**:
- 网络实时搜索
- 时效性过滤
- 结果数量控制（1-50条）

**环境要求**:
```bash
BAIDU_API_KEY=bce-v3/ALTAK-...
```

**使用示例**:
```python
from tools.baidu_search.scripts.search import search

result = search(
    query="人工智能",
    count=10
)
```

---

#### 2. baidu-scholar-search

**状态**: ✅ 已测试

**用途**: 百度学术文献检索

**触发条件**:
- "学术搜索"
- "论文搜索"

**功能**:
- 学术文献搜索（中英文）
- 支持期刊、会议、学位论文
- 可选返回摘要
- 分页支持

**环境要求**:
```bash
BAIDU_API_KEY=bce-v3/ALTAK-...
```

**使用示例**:
```python
from tools.baidu_scholar_search.scripts.search import search

result = search(
    keyword="机器学习",
    page=0,
    enable_abstract=True
)
```

---

#### 3. baidu-baike-data

**状态**: ✅ 已测试

**用途**: 百度百科 词条查询

**触发条件**:
- "百科查询"
- "词条解释"

**功能**:
- 查询百科词条
- 支持同名词条列表
- 支持词条ID查询
- 返回结构化数据

**环境要求**:
```bash
BAIDU_API_KEY=bce-v3/ALTAK-...
```

**使用示例**:
```python
from tools.baidu_baike_data.scripts.baike import query

result = query(
    search_type="lemmaTitle",
    search_key="人工智能"
)
```

---

### PaddleOCR系列（3个）

#### 4. paddleocr-async

**状态**: ✅ 已测试

**用途**: PaddleOCR异步API调用

**触发条件**:
- "异步OCR"
- "大文件识别"

**功能**:
- 文本识别+文档解析
- 大文件处理
- PDF最多1000页

**环境要求**:
```bash
PADDLEOCR_ACCESS_TOKEN=de89a11f...
# 或使用 BAIDU_API_KEY（相同）
```

**使用示例**:
```python
from tools.paddleocr_async.scripts.paddleocr_async import process_file

result = process_file(
    file_path="document.pdf",
    task_type="ocr"
)
```

---

#### 5. paddleocr-text-recognition

**状态**: ⚠️ 待测试（需配置专属URL）

**用途**: 图像/PDF文字识别

**触发条件**:
- "识别文字"
- "OCR"
- "提取文字"

**功能**:
- 图像OCR识别
- PDF文字提取
- 快速响应

**环境要求**:
```bash
PADDLEOCR_ACCESS_TOKEN=de89a11f...
PADDLEOCR_OCR_API_URL=https://your-instance.aistudio-app.com/ocr
```

**⚠️ 重要**: 需要从 https://aistudio.baidu.com/paddleocr/task 获取专属URL

**使用示例**:
```python
from tools.paddleocr_text_recognition.scripts.ocr_caller import recognize

result = recognize(
    file_path="image.png"
)
```

---

#### 6. paddleocr-doc-parsing

**状态**: ⚠️ 待测试（需配置专属URL）

**用途**: 高级文档解析（表格、公式、图表）

**触发条件**:
- "解析文档"
- "提取表格/公式"

**功能**:
- 文档结构解析
- 表格提取
- 公式识别
- 图表提取

**环境要求**:
```bash
PADDLEOCR_ACCESS_TOKEN=de89a11f...
PADDLEOCR_DOC_PARSING_API_URL=https://your-instance.aistudio-app.com/layout-parsing
```

**⚠️ 重要**: 需要从 https://aistudio.baidu.com/paddleocr/task 获取专属URL

**使用示例**:
```python
from tools.paddleocr_doc_parsing.scripts.vl_caller import parse

result = parse(
    file_path="document.pdf",
    file_type=0  # 0=PDF, 1=图像
)
```

---

### 通用工具（2个）

#### 7. file-reading

**状态**: 🚧 建设中

**用途**: 读取PDF/Word/Excel等

**触发条件**:
- "读取"
- "解析"文件

**计划功能**:
- 读取PDF文档
- 读取Word文档
- 读取Excel表格
- 读取Markdown文件

**当前替代方案**:
- 使用paddleocr-async处理PDF
- 使用paddleocr-text-recognition处理图像
- 手动读取文件内容

---

#### 8. document-output

**状态**: 🚧 建设中

**用途**: 生成格式化文档

**触发条件**:
- "生成报告"
- "输出文档"

**计划功能**:
- 生成研究报告
- 生成观察笔记
- 生成文献摘要
- 生成分析报告

**当前替代方案**:
- 使用模板手动编写文档
- 参考templates/目录中的模板

---

## 🔑 环境配置要求

### 必需配置

```bash
# 百度统一API Key（适用于所有百度工具）
BAIDU_API_KEY=bce-v3/ALTAK-...

# PaddleOCR Token（与BAIDU_API_KEY相同）
PADDLEOCR_ACCESS_TOKEN=bce-v3/ALTAK-...
```

### 可选配置（PaddleOCR同步API）

```bash
# OCR同步API专属URL（需从任务页面获取）
PADDLEOCR_OCR_API_URL=https://your-instance.aistudio-app.com/ocr
PADDLEOCR_DOC_PARSING_API_URL=https://your-instance.aistudio-app.com/layout-parsing
```

**获取专属URL**: https://aistudio.baidu.com/paddleocr/task

---

## 📊 工具状态矩阵

| 工具 | 状态 | API配置 | 脚本实现 |
|------|:----:|:-------:|:--------:|
| baidu-search | ✅ | BAIDU_API_KEY | ✅ |
| baidu-scholar-search | ✅ | BAIDU_API_KEY | ✅ |
| baidu-baike-data | ✅ | BAIDU_API_KEY | ✅ |
| paddleocr-async | ✅ | PADDLEOCR_ACCESS_TOKEN | ✅ |
| paddleocr-text-recognition | ⚠️ | 需专属URL | ✅ |
| paddleocr-doc-parsing | ⚠️ | 需专属URL | ✅ |
| file-reading | 🚧 | - | ❌ |
| document-output | 🚧 | - | ❌ |

---

## 🎯 使用建议

### 文献检索场景

```
用户: "检索Agent协作的学术论文"

推荐流程:
1. 使用 literature-review (Skill)
2. 调用 baidu-scholar-search (Tool)
3. 输出文献综述文档
```

### 观察分析场景

```
用户: "观察这个系统的运行模式"

推荐流程:
1. 使用 observation (Skill)
2. 如需处理文件：
   - 小文件 → paddleocr-text-recognition
   - 大文件 → paddleocr-async
3. 输出观察笔记
```

### 理论构建场景

```
用户: "构建一个质量评估的理论框架"

推荐流程:
1. 使用 theory-building (Skill)
2. 调用 baidu-scholar-search 查理论文献
3. 调用 baidu-baike-data 查概念定义
4. 输出理论框架文档
```

---

## 🔗 快速参考

### Skills文档
- [literature-review](skills/literature-review/SKILL.md)
- [observation](skills/observation/SKILL.md)
- [theory-building](skills/theory-building/SKILL.md)
- [quality-gate](skills/quality-gate/SKILL.md)

### Tools文档
- [百度系列](tools/baidu-search/SKILL.md)
- [PaddleOCR系列](tools/paddleocr-async/SKILL.md)
- [通用工具](tools/file-reading/SKILL.md)

### 配置指南
- [API Keys配置](API_KEYS_SETUP.md)
- [配置模板](.env.example)

---

**维护者**: Research Agent  
**更新时间**: 2026-03-14
