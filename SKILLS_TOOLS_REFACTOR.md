# Skills和Tools重构说明

## 重构概述

根据search-r-methodology-research的最新研究成果，我们重新设计了Skills和Tools的架构，实现了清晰的关注点分离。

---

## 架构变化

### 之前的架构

```
SEARCH-R/
├── agents/research/
│   └── skills/                # 所有技能混在一起
│       ├── literature-review/
│       ├── observation/
│       ├── theory-building/
│       ├── quality-gate/
│       ├── web-search/        # tool类型
│       ├── file-reading/      # tool类型
│       └── document-output/   # tool类型
└── tools/
    └── init-research.sh
```

**问题**：
- skills和tools混在一起
- 不利于维护和扩展
- 缺少底层工具支持

### 现在的架构

```
SEARCH-R/
├── skills/                    # 业务能力（4个）
│   ├── README.md
│   ├── literature-review/     # 文献检索能力
│   ├── observation/           # 观察记录能力
│   ├── theory-building/       # 理论构建能力
│   └── quality-gate/          # 质量门控能力
│
└── tools/                     # 底层工具（9个）
    ├── README.md
    ├── baidu-search/          # 百度搜索
    ├── baidu-scholar-search/  # 百度学术
    ├── baidu-baike-data/      # 百度百科
    ├── web-search/            # 网络搜索
    ├── paddleocr-doc-parsing/     # 文档解析
    ├── paddleocr-text-recognition/ # 文字识别
    ├── paddleocr-async/       # 异步OCR
    ├── file-reading/          # 文件阅读
    ├── document-output/       # 文档输出
    └── init-research.sh       # 初始化脚本
```

---

## 核心概念

### Skills（业务能力）

**定义**：给LLM看的指令文档，提供方法论指导

**特点**：
- 关注"怎么做"（方法论）
- 按需加载
- 可调用Tools

**列表**：
1. **literature-review** - 文献检索与分析
2. **observation** - 系统化观察记录
3. **theory-building** - 理论构建与验证
4. **quality-gate** - 质量评估与介入决策

### Tools（底层工具）

**定义**：实际执行的代码，提供底层能力

**特点**：
- 关注"执行"（代码实现）
- 可被Skills调用
- 执行外部API或文件操作

**列表**：

#### 百度系列（3个）
1. **baidu-search** - 百度AI搜索（全球下载量第一）
2. **baidu-scholar-search** - 百度学术文献检索
3. **baidu-baike-data** - 百度百科 词条查询

#### PaddleOCR系列（3个）
4. **paddleocr-doc-parsing** - 高级文档解析（表格、公式、图表）
5. **paddleocr-text-recognition** - 图像/PDF文字识别
6. **paddleocr-async** - PaddleOCR异步API调用

#### 通用工具（3个）
7. **web-search** - 网络搜索获取实时信息
8. **file-reading** - 读取PDF/Word/Excel等
9. **document-output** - 生成格式化文档

---

## 协作关系

```
Skills (业务能力)
    ↓ 指导方法论
    ↓ 可调用
Tools (底层工具)
    ↓ 执行代码
外部API / 文件系统
```

### 协作示例

```
用户: "检索关于Agent协作的学术论文"
    ↓
Research Agent
    ↓ 加载
literature-review (Skill)
    ↓ 方法论指导
    ↓ 调用
baidu-scholar-search (Tool)
    ↓ 执行
百度学术API
    ↓ 返回
论文列表
```

---

## 环境配置

### 统一环境变量

所有百度工具共用一个API Key：

```bash
# 百度统一API Key（适用于所有百度工具）
BAIDU_API_KEY=bce-v3/ALTAK-...

# PaddleOCR Token
PADDLEOCR_ACCESS_TOKEN=de89a11f...
```

### 配置文件

```bash
# .env文件
BAIDU_API_KEY=your_baidu_api_key
PADDLEOCR_ACCESS_TOKEN=your_paddleocr_token
```

---

## 使用方法

### 使用Skills

Skills会自动加载，按照SKILL.md中的方法论执行：

```
用户: "我想检索关于Agent记忆系统的文献"
Agent: [自动加载literature-review skill]
       [按方法论执行]
       [调用baidu-scholar-search工具]
       [返回结果]
```

### 使用Tools

Tools通常由Skills调用，也可以直接使用：

```python
# 直接调用百度学术搜索
from tools.baidu_scholar_search.scripts.search import search

result = search(
    keyword="机器学习",
    page=0,
    enable_abstract=True
)
```

---

## 项目初始化时的复制规则

### 创建新项目时

```bash
# 脚本会自动复制
skills/  →  新项目/skills/         # 完整复制
tools/   →  新项目/tools/          # 完整复制
```

### opencode.json配置

```json
{
  "agent": {
    "research-agent": {
      "skills": [
        "literature-review",
        "observation",
        "quality-gate",
        "theory-building"
      ]
    }
  }
}
```

**注意**：opencode.json只配置Skills，不配置Tools。

---

## 优势

### 1. 清晰的职责分离

- **Skills**: 方法论指导
- **Tools**: 代码实现

### 2. 易于扩展

- 新增业务能力：添加到skills/
- 新增底层工具：添加到tools/

### 3. 便于维护

- Skills专注于方法论优化
- Tools专注于代码实现

### 4. 强大的工具集

- 百度系列：搜索、学术、百科
- PaddleOCR系列：文档处理
- 通用工具：文件操作

---

## 迁移指南

### 如果你有旧项目

1. **更新AGENTS.md**
   - 移除tools类型的skill引用
   - 添加Tools说明

2. **更新opencode.json**
   - 只保留ability类型的skills

3. **更新目录结构**
   - 创建tools/目录
   - 移动工具文件

4. **更新环境变量**
   - 配置BAIDU_API_KEY
   - 配置PADDLEOCR_ACCESS_TOKEN

---

## 参考文档

- [Skills库索引](skills/README.md)
- [Tools库索引](tools/README.md)
- [工具设计说明](tools/DESIGN_OVERVIEW.md)
- [工具测试报告](tools/TOOLS_TEST_REPORT.md)
- [百度技能研究](/Users/sonnet/opencode/search-r-methodology-research/skills/BAIDU_SKILLS_RESEARCH.md)

---

**重构日期**: 2026-03-14  
**维护者**: SEARCH-R Framework  
**版本**: v2.0
