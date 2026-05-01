# Research Agent 初始化指南

> 如何使用SEARCH-R方法论创建和管理研究课题

**版本**: v2.3 | **更新**: 2026-04-27

---

## 🎯 设计理念

### 架构定位

```
SEARCH-R (方法论模板仓库)
├─ 提供方法论体系
├─ 提供文档模板
├─ 提供Agent设计规范
└─ 提供工具和技能库
    
    ⚠️  保持纯净，不包含具体研究
    
    ↓ 作为模板
    ↓ 复制使用
    ↓ 创建新项目
    
研究项目 (具体研究仓库)
├─ 使用SEARCH-R方法论
├─ 管理多个研究课题
└─ 产出具体研究成果
```

### 为什么不在模板仓库中创建课题？

```
问题1: 污染模板仓库
├─ SEARCH-R应该是纯净的方法论模板
├─ 混入具体研究会增加维护难度
└─ 不利于分享和复用

问题2: 结构冲突
├─ current-topic.md用于说明模板用途
├─ 创建课题会覆盖这个说明
└─ 误导使用者

问题3: 版本管理混乱
├─ 具体研究不应提交到模板仓库
├─ 会污染git历史
└─ 增加仓库体积

建议:
├─ 快速测试：可以临时在模板仓库创建
├─ 正式研究：务必创建独立项目
└─ 完成测试后：清理研究文件，恢复模板
```

### 创建决策流程

```
用户: "我想研究 [课题描述]"
    ↓
Agent检测当前环境
    ↓
    ├─ 检测到在SEARCH-R模板仓库
    │   ↓
    │   询问：新建独立仓库 or 在模板仓库创建？
    │   ↓
    │   ├─ 选择1：新建独立仓库（默认推荐）
    │   │   → 创建新项目 → 开始研究
    │   │
    │   └─ 选择2：在模板仓库创建（需要确认）
    │       → 显示警告 → 用户确认 → 创建课题 → 开始研究
    │
    └─ 检测到在已存在的研究项目
        ↓
        询问：在当前项目添加课题 or 创建新项目？
        ↓
        ├─ 选择1：在当前项目添加（默认）
        │   → 创建课题配置 → 激活课题 → 开始研究
        │
        └─ 选择2：创建新项目
            → 创建新项目 → 开始研究
```

### 两种使用场景

```
用户: "我想研究 [课题描述]"
    ↓
Agent询问: "新建独立仓库 or 在当前仓库创建？"
    ↓
    ├─ 选择1: 新建独立仓库（推荐）
    │   ↓
    │   创建新项目 → 复制SEARCH-R模板 → 创建第一个课题 → 开始研究
    │
    └─ 选择2: 在当前仓库创建（不推荐）
        ↓
        显示警告 → 确认继续 → 在research-topics/创建课题 → 开始研究

场景A: 创建新的研究项目（推荐）
场景B: 在现有项目中添加课题
场景C: 在SEARCH-R仓库中创建课题（不推荐）
```

---

## 🚀 场景A：创建新的研究项目

### 对话式创建流程

**用户**：我想研究Agent的记忆系统设计

**Research Agent**：
```
好的！我需要先确认你的选择：

📋 请选择创建方式：

1. **新建独立仓库**（推荐）
   - 创建独立的研究项目目录
   - 完整复制SEARCH-R模板
   - 项目独立管理，互不干扰
   - 适合长期研究

2. **在当前SEARCH-R仓库中创建课题**（不推荐）
   - 直接在模板仓库中创建课题
   - 会污染模板仓库结构
   - 不利于维护和分享
   - 仅适合快速测试

请选择：[1/2] (默认：1)
```

**用户**：1（或直接回车）

**Research Agent**：
```
✅ 好的，将创建新的研究项目。

📋 请提供以下基本信息：

1. **项目名称** (用于目录名，建议用英文):
   示例: agent-memory-system-research
   
2. **项目路径** (项目创建在哪里):
   示例: /Users/sonnet/opencode/
   或直接回车使用默认路径

3. **研究背景** (简短描述，1-2句话即可):
   为什么要研究这个课题？
   
4. **核心问题** (最重要的问题，1-3个):
   你想通过研究解决什么问题？

💡 提示：先提供基本信息即可开始，后续可以逐步完善
```

**用户**：
```
1. agent-memory-research
2. /Users/sonnet/opencode/
3. Agent需要有效的记忆系统来支持长期对话和知识积累
4. 记忆应该分为哪些类型？如何实现记忆的压缩和遗忘？
```

**Research Agent**：
```
✅ 收到信息，正在创建研究项目...

[执行以下操作]

1. 创建项目目录结构
2. 复制SEARCH-R方法论模板
3. 创建opencode.json配置
4. 创建第一个研究课题配置
5. 激活研究课题

✅ 项目创建完成！

📁 项目位置: /Users/sonnet/opencode/agent-memory-research
📄 课题配置: agents/research/research-topics/agent-memory-system.md
🎯 当前状态: 已激活

📊 研究课题概览：
- 研究背景: Agent需要有效的记忆系统...
- 核心问题: 记忆分类、记忆压缩、记忆遗忘
- 当前阶段: Survey (观察调研)
- 下一步: 开始第一次调研

是否现在开始研究？
```

### 在SEARCH-R仓库中创建课题（不推荐）

**用户**：2（选择在当前仓库创建）

**Research Agent**：
```
⚠️  警告：在SEARCH-R模板仓库中创建课题有以下问题：

1. **污染模板仓库**
   - SEARCH-R是方法论模板，应保持纯净
   - 混入具体研究会增加维护难度
   - 不利于分享和复用

2. **结构冲突**
   - 模板仓库的current-topic.md指向null
   - 会与模板说明冲突

3. **版本管理困难**
   - 具体研究不应该提交到模板仓库
   - 会污染git历史

💡 建议：创建独立的研究项目仓库

是否继续在当前仓库创建？[y/N]
```

**用户**：N（或直接回车，取消操作）

**Research Agent**：
```
好的，让我们创建独立的研究项目。

📋 请提供项目信息：
1. 项目名称: 
2. 项目路径:
...
```

**用户**：y（坚持在模板仓库创建）

**Research Agent**：
```
⚠️  确认在SEARCH-R模板仓库中创建课题

这将：
- 在 agents/research/research-topics/ 下创建课题配置
- 修改 agents/research/current-topic.md 指向新课题
- 创建 research/ 目录存放研究产出

⚠️  重要提醒：
- 请勿将研究内容提交到SEARCH-R仓库的git！
- 使用 .gitignore 排除研究文件
- 完成后请手动恢复 current-topic.md

📋 请提供课题信息：

1. **课题名称**:
   示例: Agent记忆系统设计
   
2. **研究背景** (1-2句话):
   为什么要研究这个课题？
   
3. **核心问题** (1-3个):
   你想解决什么问题？

💡 提示：建议仅用于快速测试，正式研究请创建独立项目
```

**自动化操作**：
```bash
# 在SEARCH-R仓库中创建课题
# 1. 创建课题配置
cp agents/research/research-topics/topic-minimal-template.md \
   agents/research/research-topics/agent-memory-system.md

# 2. 修改current-topic.md（会覆盖模板说明！）
# 3. 创建research目录（如果不存在）
mkdir -p research/{observations,retrievals,theory,reflections}

# 注意：不会复制skills等目录，直接使用模板仓库的资源
```

---

### 自动化步骤

Research Agent会自动完成：

```bash
# 1. 创建项目目录
mkdir -p /Users/sonnet/opencode/agent-memory-research

# 2. 复制SEARCH-R模板文件
# - methodology/                    # 方法论体系
# - templates/                      # 文档模板
# - agents/research/                # Agent配置目录
#   ├── AGENTS.md                   # Agent核心定义
#   ├── init.md                     # 初始化指南
#   ├── ESSENTIALS.md               # 核心要点速查
#   ├── current-topic.md            # 当前课题
#   ├── session-log.md              # 会话日志
#   ├── research-topics/            # 课题配置目录
#   │   ├── topic-template.md       # 完整模板
#   │   ├── topic-minimal-template.md # 最小化模板
#   │   └── README.md               # 说明文档
#   └── skills/                     # 技能库（完整复制）
#       ├── README.md               # 技能库索引
#       ├── literature-review/      # 文献检索
#       ├── observation/            # 观察能力
#       ├── quality-gate/           # 质量门控
#       ├── theory-building/        # 理论构建
#       ├── web-search/             # 网络搜索
#       ├── file-reading/           # 文件阅读
#       └── document-output/        # 文档输出
# - tools/                          # 工具集

# 3. 创建opencode.json配置（完整版）
# 这是Opencode框架识别项目的入口文件，必须包含完整的Agent、Skill、Tool注册信息
cat > opencode.json << 'OPENCODE_EOF'
{
  "$schema": "https://opencode.dev/schema/v1/opencode.json",
  "project": {
    "name": "${PROJECT_NAME}",
    "displayName": "${PROJECT_DISPLAY_NAME}",
    "description": "${PROJECT_DESCRIPTION}",
    "version": "1.0.0",
    "methodology": "SEARCH-R Framework v2.0",
    "createdAt": "$(date +%Y-%m-%d)",
    "repository": { "type": "git", "url": "./" }
  },
  "agents": [
    {
      "id": "research",
      "name": "Research Agent",
      "description": "使用SEARCH-R方法论进行系统性研究的研究型Agent",
      "mode": "primary",
      "entryPoint": "agents/research/AGENTS.md",
      "version": "2.0",
      "skills": [
        "literature-review",
        "observation",
        "quality-gate",
        "theory-building"
      ],
      "defaultSkill": "literature-review",
      "metadata": {
        "role": "研究员",
        "focus": ["为什么", "是什么", "怎么做"],
        "level": "L0 - 研究方法论框架层"
      }
    }
  ],
  "skills": [
    {
      "id": "literature-review",
      "name": "文献检索",
      "description": "系统化检索和分析文献。当用户要求'检索文献'、'调研现有研究'、'文献综述'、'了解研究现状'时触发。",
      "type": "agent",
      "agentId": "research",
      "entryPoint": "agents/research/skills/literature-review/SKILL.md",
      "tags": ["文献检索", "研究", "综述", "知识图谱"],
      "trigger": "on_demand",
      "relatedTools": ["baidu-scholar-search", "baidu-search", "baidu-baike-data"]
    },
    {
      "id": "observation",
      "name": "观察记录",
      "description": "系统化观察和记录。当用户要求'观察'、'记录现象'、'发现模式'时触发。",
      "type": "agent",
      "agentId": "research",
      "entryPoint": "agents/research/skills/observation/SKILL.md",
      "tags": ["观察", "记录", "模式发现", "现象分析"],
      "trigger": "on_demand"
    },
    {
      "id": "quality-gate",
      "name": "质量门控",
      "description": "评估研究质量。当需要判断研究结论的确定性、可接受性时触发。",
      "type": "agent",
      "agentId": "research",
      "entryPoint": "agents/research/skills/quality-gate/SKILL.md",
      "tags": ["质量评估", "研究评审", "确定性评估"],
      "trigger": "auto"
    },
    {
      "id": "theory-building",
      "name": "理论构建",
      "description": "构建和验证理论框架。当用户要求'建立理论'、'构建框架'、'提出模型'时触发。",
      "type": "agent",
      "agentId": "research",
      "entryPoint": "agents/research/skills/theory-building/SKILL.md",
      "tags": ["理论构建", "框架设计", "模型验证"],
      "trigger": "on_demand"
    }
  ],
  "tools": [
    {
      "id": "baidu-search",
      "name": "百度搜索",
      "description": "百度AI搜索引擎（BDSE）。用于实时信息、文档或研究主题的搜索。",
      "category": "search",
      "entryPoint": "tools/baidu-search/SKILL.md",
      "script": "tools/baidu-search/scripts/search.py",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["BAIDU_API_KEY", "BAIDU_AISEARCH_TOKEN"],
        "primaryEnv": "BAIDU_AISEARCH_TOKEN"
      },
      "parameters": {
        "query": {"type": "string", "required": true},
        "count": {"type": "integer", "required": false, "default": 10, "range": "1-50"},
        "freshness": {"type": "string", "required": false}
      }
    },
    {
      "id": "baidu-scholar-search",
      "name": "百度学术",
      "description": "百度学术文献检索。用于学术论文、期刊、会议论文的检索。",
      "category": "search",
      "entryPoint": "tools/baidu-scholar-search/SKILL.md",
      "script": "tools/baidu-scholar-search/scripts/search.py",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["BAIDU_API_KEY", "BAIDU_AISEARCH_TOKEN"],
        "primaryEnv": "BAIDU_AISEARCH_TOKEN"
      },
      "parameters": {
        "query": {"type": "string", "required": true},
        "count": {"type": "integer", "required": false, "default": 10, "range": "1-50"},
        "freshness": {"type": "string", "required": false}
      }
    },
    {
      "id": "baidu-baike-data",
      "name": "百度百科",
      "description": "百度百科词条查询。用于概念定义、术语解释、知识查询。",
      "category": "data",
      "entryPoint": "tools/baidu-baike-data/SKILL.md",
      "script": "tools/baidu-baike-data/scripts/baike.py",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["BAIDU_API_KEY", "BAIDU_AISEARCH_TOKEN"],
        "primaryEnv": "BAIDU_AISEARCH_TOKEN"
      },
      "parameters": {
        "query": {"type": "string", "required": true}
      }
    },
    {
      "id": "paddleocr-doc-parsing",
      "name": "文档解析",
      "description": "高级文档解析（表格、公式、图表）。用于复杂PDF、扫描件的深度解析。",
      "category": "ocr",
      "entryPoint": "tools/paddleocr-doc-parsing/SKILL.md",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["PADDLEOCR_OCR_API_URL"]
      },
      "note": "需要配置PaddleOCR专属API URL"
    },
    {
      "id": "paddleocr-text-recognition",
      "name": "文字识别",
      "description": "图像/PDF文字识别（OCR）。用于提取图片或PDF中的文字内容。",
      "category": "ocr",
      "entryPoint": "tools/paddleocr-text-recognition/SKILL.md",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["PADDLEOCR_OCR_API_URL"]
      },
      "note": "需要配置PaddleOCR专属API URL"
    },
    {
      "id": "paddleocr-async",
      "name": "异步OCR",
      "description": "PaddleOCR异步API调用。用于大文件、批量文档的异步识别处理。",
      "category": "ocr",
      "entryPoint": "tools/paddleocr-async/SKILL.md",
      "script": "tools/paddleocr-async/scripts/paddleocr_async.py",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["PADDLEOCR_OCR_API_URL"]
      }
    },
    {
      "id": "file-reading",
      "name": "文件阅读",
      "description": "读取Excel(.xlsx/.xls/.et)和Word(.docx)文件内容。",
      "category": "io",
      "entryPoint": "tools/file-reading/SKILL.md",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": []
      },
      "note": "依赖 openpyxl, python-docx, xlrd, pywin32，运行 pip install -r tools/file-reading/scripts/requirements.txt 安装"
    },
    {
      "id": "document-output",
      "name": "文档输出",
      "description": "生成格式化文档（报告、论文等）。建设中。",
      "category": "io",
      "entryPoint": "tools/document-output/SKILL.md",
      "status": "wip",
      "note": "功能受限，建设中"
    }
  ],
  "workflows": [
    {
      "id": "search-r-cycle",
      "name": "SEARCH-R研究循环",
      "description": "完整的研究方法论循环：Survey -> Explore -> Analyze -> Review -> Confirm -> Harvest -> Reflect",
      "steps": [
        {"id": "S", "name": "Survey", "description": "观察调研：从实践中发现问题"},
        {"id": "E", "name": "Explore", "description": "探索检索：检索相关知识"},
        {"id": "A", "name": "Analyze", "description": "分析思考：深度理论构建"},
        {"id": "R1", "name": "Review", "description": "评审探讨：Human参与探讨"},
        {"id": "C", "name": "Confirm", "description": "确认验证：实践中验证"},
        {"id": "H", "name": "Harvest", "description": "收获产出：沉淀研究成果"},
        {"id": "R2", "name": "Reflect", "description": "反思迭代：持续优化方法"}
      ],
      "entryPoint": "methodology/search-r-cycle.md"
    }
  ],
  "directories": {
    "agents": "agents/",
    "skills": "agents/research/skills/",
    "tools": "tools/",
    "methodology": "methodology/",
    "templates": "templates/",
    "research": {
      "observations": "research/observations/",
      "retrievals": "research/retrievals/",
      "theory": "research/theory/",
      "reflections": "research/reflections/"
    },
    "references": "references/",
    "examples": "examples/"
  },
  "config": {
    "defaultAgent": "research",
    "researchDepth": {
      "target": "Level 0-2",
      "levels": {
        "L0": "第一性原理（为什么）",
        "L1": "设计原则（是什么）",
        "L2": "实现思路（怎么做）",
        "L3": "具体实现（细节）"
      }
    },
    "humanInvolvement": {
      "mode": "最小化参与",
      "triggers": ["研究方向决策", "理论验证决策", "重大反思决策"]
    },
    "documentation": {
      "required": true,
      "templates": {
        "observation": "templates/observation-template.md",
        "retrieval": "templates/retrieval-survey-template.md",
        "theory": "templates/theory-template.md",
        "reflection": "templates/reflection-template.md"
      }
    }
  },
  "currentTopic": {
    "id": "${TOPIC_ID}",
    "name": "${TOPIC_NAME}",
    "status": "active",
    "entryPoint": "agents/research/research-topics/${TOPIC_ID}.md",
    "sessionLog": "agents/research/session-log.md"
  }
}
OPENCODE_EOF
# 说明：此文件为Opencode框架的项目入口文件，包含完整的Agent、Skill、Tool注册表
# 所有路径均相对于项目根目录，确保框架能正确加载所有组件

# 4. 创建研究课题配置 (使用最小化模板)
# 详见下一节

# 5. 激活研究课题
# 更新 current-topic.md
```

**重要说明**：
- **skills目录**：完整复制到 `agents/research/skills/`，包含所有技能文件
- **tools目录**：完整复制到 `tools/`，包含所有工具定义和脚本
- **opencode.json**（必须创建，无论是否OpenCode环境）：
  - 这是项目的**入口配置文件**，包含完整的Agent、Skill、Tool注册表
  - 包含 `agents`, `skills`, `tools`, `workflows`, `directories`, `config`, `currentTopic` 七大模块
  - 所有路径均相对于项目根目录
  - 框架通过此文件识别和加载项目组件
- **环境检测**：不再区分是否OpenCode环境，统一创建完整的 `opencode.json`

---

## 📝 研究课题配置模板

### 最小化模板（推荐用于快速启动）

```markdown
---
topic: [课题名称]
created: YYYY-MM-DD
status: active
priority: high
---

# [课题名称]

## 📋 研究背景

[为什么要研究？背景是什么？]

## 🎯 核心问题

1. [问题1]
2. [问题2]
3. [问题3]

## 📊 当前进展

### 当前阶段
- 阶段：Survey (观察调研)
- 完成度：0%
- 下一步：[下一步行动]

### 已完成
- [YYYY-MM-DD] 创建研究课题

## 📝 研究记录

### [YYYY-MM-DD] 创建课题
- 研究内容：初始化研究课题
- 下一步：开始Survey阶段
```

### 完整模板

当研究逐步深入时，可以扩展为完整模板。详见：
- [topic-template.md](research-topics/topic-template.md) - 包含所有字段
- [课题配置详解](#课题配置字段说明)

### 何时使用哪个模板？

```
启动阶段 → 最小化模板
├─ 只填写核心信息
├─ 快速开始研究
└─ 后续逐步完善

深入研究 → 完整模板
├─ 补充研究范围
├─ 添加研究计划
├─ 记录风险管理
└─ 设置里程碑
```

---

## 🔄 场景B：在现有项目中添加课题

> **前提**：此场景适用于**已创建的研究项目**，不是在SEARCH-R模板仓库中操作

### 场景识别

Research Agent会自动识别当前环境：

```
检测当前目录：
├─ 有opencode.json且在研究项目目录 → "在当前项目中添加课题"
├─ 在SEARCH-R模板仓库 → "创建新项目"（默认）或警告后在模板仓库创建
└─ 其他位置 → "创建新项目"
```

### 对话式添加流程

**用户**：我想在当前项目中研究Agent的元认知能力

**Research Agent**：
```
好的！我将在当前项目中创建新的研究课题。

📋 当前项目信息：
- 项目：agent-memory-research
- 当前课题：Agent记忆系统设计 (active)

📋 新课题基本信息：

1. **课题名称**: Agent元认知能力研究
   (建议用中文名称，便于理解)

2. **研究背景** (1-2句话):
   为什么要研究这个课题？

3. **核心问题** (1-3个):
   你想解决什么问题？

4. **优先级**: high/medium/low
   (相对于当前课题的优先级)
```

**用户**：
```
2. Agent需要知道自己什么时候不知道，这是质量门控的基础
3. 元认知如何定义？如何评估Agent的元认知水平？
4. medium
```

**Research Agent**：
```
✅ 创建新研究课题...

[创建课题配置文件]
[更新项目课题列表]

✅ 课题创建完成！

📁 课题配置: research-topics/agent-metacognition.md
📊 当前状态: paused (优先级medium)
🎯 当前课题: 仍为"Agent记忆系统设计"

💡 提示：
- 新课题状态为paused，不会干扰当前研究
- 可以随时切换："切换到Agent元认知能力研究"
- 建议完成当前课题的重要节点后再切换

是否需要切换到新课题？
```

---

## 📊 课题配置字段说明

### 必填字段（最小化模板）

| 字段 | 说明 | 示例 |
|------|------|------|
| `topic` | 课题名称 | Agent记忆系统设计 |
| `created` | 创建日期 | 2026-03-13 |
| `status` | 当前状态 | active/paused/completed |
| `priority` | 优先级 | high/medium/low |
| **研究背景** | 为什么研究 | Agent需要有效的记忆系统... |
| **核心问题** | 1-3个关键问题 | 记忆如何分类？如何压缩？ |

### 可选字段（完整模板）

| 字段 | 何时添加 | 说明 |
|------|----------|------|
| **研究目标** | Survey阶段后 | 明确期望产出和成功标准 |
| **研究范围** | 探索阶段时 | 定义包含和不包含的内容 |
| **研究资料** | 检索过程中 | 记录相关文档和参考资料 |
| **研究计划** | 规划阶段时 | 分阶段的任务和产出 |
| **风险挑战** | 发现风险时 | 识别的风险和缓解措施 |
| **里程碑** | 明确节点后 | 关键节点和时间点 |

### 字段填充策略

```
创建时 → 必填字段
├─ 快速启动
└─ 基本方向明确

Survey阶段 → 补充背景
├─ 深化背景理解
└─ 明确研究动机

Explore阶段 → 补充资料
├─ 记录检索结果
└─ 整理参考资料

Analyze阶段 → 补充计划
├─ 制定研究计划
└─ 设置里程碑

持续更新 → 记录进展
├─ 更新当前进展
└─ 记录研究日志
```

---

## 🔄 课题状态管理

### 状态定义

```
active   - 正在进行的研究
paused   - 暂停的研究
completed - 已完成的研究
```

### 状态转换规则

```
创建课题 → paused (初始状态)
paused → active (激活课题)
active → paused (暂停课题)
active → completed (完成课题)
```

### 多课题管理

```
建议策略：
├─ 同时active的课题不超过2个
├─ 高优先级课题优先处理
├─ 定期回顾paused的课题
└─ 完成的课题及时归档

课题切换：
1. 保存当前课题进展
2. 更新当前课题状态为paused
3. 更新新课题状态为active
4. 更新current-topic.md
5. 读取新课题配置继续研究
```

---

## 🛠️ 自动化工具

### init-research.sh 脚本

提供自动化创建工具（推荐）：

```bash
# 基本用法（自动检测环境）
./tools/init-research.sh \
  --name "agent-memory-research" \
  --path "/Users/sonnet/opencode/" \
  --topic "Agent记忆系统设计"

# 明确指定OpenCode环境
./tools/init-research.sh \
  --name "agent-memory-research" \
  --environment opencode

# 完整参数
./tools/init-research.sh my-project \
  --description "我的研究项目" \
  --environment opencode \
  --git
```

### 脚本功能

```
✓ 创建项目目录结构
✓ 复制SEARCH-R方法论模板
✓ 复制完整skills技能库
✓ 复制完整tools工具集
✓ 创建完整opencode.json项目入口配置
✓ 创建研究课题配置文件
✓ 初始化Git仓库（可选）
✓ 生成项目README
```

### 环境检测逻辑

```
脚本启动
  ↓
检查当前目录是否有opencode.json
  ├─ 有 → 已有项目，提示更新或覆盖
  └─ 无 → 新项目
          └─ 创建完整的opencode.json配置

注意：无论是否检测到OpenCode环境，都会创建完整的opencode.json
```

---

## 📁 目录结构

### SEARCH-R模板仓库

```
SEARCH-R/                     # 模板仓库根目录
├── methodology/              # 方法论体系
├── templates/                # 文档模板
├── skills/                   # 技能库（在根目录）
│   ├── README.md
│   ├── literature-review/
│   ├── observation/
│   ├── quality-gate/
│   ├── theory-building/
│   └── web-search/
├── agents/research/          # Agent设计
│   ├── AGENTS.md             # Agent核心定义
│   ├── init.md               # 本文件
│   ├── ESSENTIALS.md         # 核心要点速查
│   ├── current-topic.md      # 当前课题（null）
│   ├── research-topics/      # 课题模板
│   │   ├── topic-template.md
│   │   └── README.md
│   └── examples/             # 示例文档
└── tools/                    # 工具集
    └── init-research.sh      # 项目初始化脚本
```

**注意**：
- SEARCH-R是方法论模板仓库，skills在根目录
- 创建新项目时，脚本会将 `skills/` 复制到新项目的 `agents/research/skills/`
- 这样新项目的Agent配置更加自包含

### 研究项目仓库

```
research-project/
├── opencode.json          # 项目入口配置（必须）
├── README.md              # 项目说明
├── .gitignore             # Git忽略配置
├── methodology/           # 方法论体系
│   ├── search-r-cycle.md
│   ├── research-depth.md
│   └── human-role.md
├── agents/research/
│   ├── AGENTS.md          # Agent定义
│   ├── init.md            # 初始化指南
│   ├── current-topic.md   # 当前课题
│   ├── session-log.md     # 会话日志
│   ├── research-topics/   # 课题库
│   │   ├── topic-1.md
│   │   ├── topic-2.md
│   │   ├── topic-template.md
│   │   ├── topic-minimal-template.md
│   │   └── README.md
│   └── skills/            # 技能库（从模板复制到此）
│       ├── README.md
│       ├── literature-review/
│       ├── observation/
│       ├── quality-gate/
│       ├── theory-building/
│       └── web-search/
├── research/              # 研究目录
│   ├── observations/      # 观察笔记
│   ├── retrievals/        # 检索报告
│   ├── theory/            # 理论文档
│   └── reflections/       # 反思笔记
├── templates/             # 文档模板
├── references/            # 参考资料
├── tools/                 # 工具集（完整复制，含所有工具定义和脚本）
│   ├── baidu-search/
│   ├── baidu-scholar-search/
│   ├── baidu-baike-data/
│   ├── paddleocr-doc-parsing/
│   ├── paddleocr-text-recognition/
│   ├── paddleocr-async/
│   ├── file-reading/
│   ├── document-output/
│   └── init-research.sh
└── examples/              # 示例文档
```

### 研究项目仓库（完整结构）

```
research-project/
├── opencode.json          # 项目入口配置（必须，包含Agent/Skill/Tool注册表）
├── README.md              # 项目说明
├── .gitignore             # Git忽略配置
├── methodology/           # 方法论体系
│   ├── search-r-cycle.md
│   ├── research-depth.md
│   └── human-role.md
├── agents/research/
│   ├── AGENTS.md          # Agent定义
│   ├── init.md            # 初始化指南
│   ├── current-topic.md   # 当前课题
│   ├── session-log.md     # 会话日志
│   ├── research-topics/   # 课题库
│   │   ├── topic-1.md
│   │   ├── topic-2.md
│   │   ├── topic-template.md
│   │   ├── topic-minimal-template.md
│   │   └── README.md
│   └── skills/            # 技能库（完整复制）
│       ├── README.md
│       ├── literature-review/
│       ├── observation/
│       ├── quality-gate/
│       ├── theory-building/
│       ├── web-search/
│       ├── file-reading/
│       └── document-output/
├── research/              # 研究目录
│   ├── observations/      # 观察笔记
│   ├── retrievals/        # 检索报告
│   ├── theory/            # 理论文档
│   └── reflections/       # 反思笔记
├── templates/             # 文档模板
├── references/            # 参考资料
├── tools/                 # 工具集
└── examples/              # 示例文档
```

---

## ✅ 关键文件清单

init新项目时必须复制的文件：

### 必需文件（所有环境）

| 类别 | 文件路径 | 说明 |
|------|----------|------|
| **方法论** | `methodology/` | 完整复制方法论体系 |
| **模板** | `templates/` | 完整复制文档模板 |
| **Agent核心** | `agents/research/AGENTS.md` | Agent核心定义 |
| **初始化指南** | `agents/research/init.md` | 本文档 |
| **核心要点** | `agents/research/ESSENTIALS.md` | 快速参考 |
| **当前课题** | `agents/research/current-topic.md` | 当前激活课题 |
| **会话日志** | `agents/research/session-log.md` | 会话记录 |
| **课题模板** | `agents/research/research-topics/` | 完整复制模板目录 |
| **技能库** | `skills/` → `agents/research/skills/` | **从根目录复制到agents下** |
| **工具集** | `tools/` | 工具脚本 |

### 条件文件（根据环境）

| 文件 | 条件 | 说明 |
|------|------|------|
| `.gitignore` | 初始化Git时 | Git忽略规则 |

### 复制完整性检查

```bash
# 检查skills目录是否完整
ls -la agents/research/skills/
# 应该看到：
# - README.md
# - literature-review/
# - observation/
# - quality-gate/
# - theory-building/
# - web-search/
# - document-output/
# - file-reading/

# 检查tools目录是否完整
ls -la tools/
# 应该看到：
# - baidu-search/
# - baidu-scholar-search/
# - baidu-baike-data/
# - paddleocr-doc-parsing/
# - paddleocr-text-recognition/
# - paddleocr-async/
# - file-reading/
# - document-output/
# - init-research.sh

# 检查opencode.json（必须存在）
cat opencode.json
# 必须包含以下顶级字段：
# - project (项目元信息)
# - agents (Agent注册表)
# - skills (Skill注册表)
# - tools (Tool注册表)
# - workflows (工作流定义)
# - directories (目录结构映射)
# - config (项目配置)
# - currentTopic (当前激活课题)
```

### 目录复制映射

```
SEARCH-R模板仓库                →    新研究项目
─────────────────────────────────────────────────
skills/                         →    agents/research/skills/
agents/research/AGENTS.md       →    agents/research/AGENTS.md
agents/research/init.md         →    agents/research/init.md
agents/research/research-topics/→    agents/research/research-topics/
methodology/                    →    methodology/
templates/                      →    templates/
tools/                          →    tools/（完整复制所有工具定义和脚本）
（自动生成）                    →    opencode.json（完整项目入口配置）
```

### opencode.json 字段说明

`opencode.json` 是项目的**入口配置文件**，Opencode 框架通过此文件识别和加载所有组件。

#### 必须包含的顶级字段

| 字段 | 类型 | 说明 |
|------|------|------|
| `project` | object | 项目元信息（名称、版本、描述、方法论） |
| `agents` | array | Agent注册表，定义项目中所有Agent |
| `skills` | array | Skill注册表，定义所有可用技能 |
| `tools` | array | Tool注册表，定义所有可用工具 |
| `workflows` | array | 工作流定义（如SEARCH-R循环） |
| `directories` | object | 目录结构映射 |
| `config` | object | 项目配置（深度标准、Human参与规则等） |
| `currentTopic` | object | 当前激活的课题信息 |

#### 字段详细说明

**project**
- `name`: 项目英文标识名（用于目录名）
- `displayName`: 项目中文显示名
- `description`: 项目描述
- `version`: 项目版本
- `methodology`: 使用的方法论（如"SEARCH-R Framework v2.0"）
- `createdAt`: 创建日期

**agents[].skills**
- 列出该Agent可用的所有skill id
- 必须与 `skills` 数组中的 `id` 对应

**skills[].trigger**
- `on_demand`: 按需触发（用户明确请求时）
- `auto`: 自动触发（特定条件下自动调用）

**tools[].status**
- `ready`: 功能正常，可直接使用
- `wip`: 建设中，功能受限
- `deprecated`: 已废弃

**tools[].requires**
- `bins`: 需要的可执行文件
- `env`: 需要的环境变量
- `primaryEnv`: 主环境变量名

**config.researchDepth.levels**
- `L0`: 第一性原理（为什么）
- `L1`: 设计原则（是什么）
- `L2`: 实现思路（怎么做）
- `L3`: 具体实现（细节）

#### 生成注意事项

1. **路径均相对于项目根目录**：确保所有 `entryPoint` 和 `script` 路径正确
2. **skill id 必须唯一**：在整个项目中不可重复
3. **agent.skills 必须与 skills.id 对应**：否则框架无法加载
4. **tools 必须包含完整信息**：包括 requires 和 parameters
5. **currentTopic 在创建时初始化**：创建新项目后更新为第一个课题

---

## 🔑 API Keys配置

### 配置概述

SEARCH-R框架使用多个外部API服务，需要配置相应的API Keys才能使用所有功能。

**详细配置指南**：参见 [API_KEYS_SETUP.md](../../API_KEYS_SETUP.md)

### 快速配置

#### 1. 创建配置文件

```bash
# 复制模板文件
cp .env.example .env

# 编辑配置文件
nano .env
```

#### 2. 必需的API Keys

| API Key | 用途 | 获取地址 |
|---------|------|----------|
| **BAIDU_API_KEY** | 百度搜索、学术、百科 | [获取](https://aistudio.baidu.com/account/accessToken) |
| **PADDLEOCR_ACCESS_TOKEN** | PaddleOCR服务 | 与BAIDU_API_KEY相同 |

#### 3. 可选的API Keys

| API Key | 用途 | 说明 |
|---------|------|------|
| **PADDLEOCR_OCR_API_URL** | OCR同步API | 快速响应，需专属URL |
| **PADDLEOCR_DOC_PARSING_API_URL** | 文档解析API | 高级解析，需专属URL |

### 工具可用性矩阵

| 工具 | 无配置 | 仅BAIDU_API_KEY | 完整配置 |
|------|:------:|:---------------:|:--------:|
| baidu-search | ❌ | ✅ | ✅ |
| baidu-scholar-search | ❌ | ✅ | ✅ |
| baidu-baike-data | ❌ | ✅ | ✅ |
| paddleocr-async | ❌ | ✅ | ✅ |
| paddleocr-text-recognition | ❌ | ❌ | ✅ |
| paddleocr-doc-parsing | ❌ | ❌ | ✅ |
| file-reading | ⚠️ | ⚠️ | ✅ |
| **说明** | 需pip安装依赖 | 同上 | 安装依赖后可用 |
| document-output | ✅ | ✅ | ✅ |

### 未配置时的提示

当用户尝试使用未配置的工具时，Agent会：

```
⚠️ 工具未配置

该功能需要配置 API Key 才能使用。

配置步骤：
1. 访问 [获取地址]
2. 获取 Access Token
3. 配置环境变量或添加到 .env 文件

是否需要帮助配置？
```

### 验证配置

```bash
# 方法1：检查环境变量
env | grep -E "BAIDU_API_KEY|PADDLEOCR"

# 方法2：检查.env文件
cat .env | grep -E "BAIDU_API_KEY|PADDLEOCR"

# 方法3：运行验证脚本（如果可用）
./scripts/check_api_keys.sh
```

### 安全建议

1. **不要提交敏感信息**
   - `.env` 文件已在 `.gitignore` 中
   - 确保 API Keys 不会被提交到 git

2. **定期更新Token**
   - 建议每3-6个月更新一次
   - 防止 Token 泄露

3. **限制权限**
   - 只申请必需的 API 权限
   - 不要共享 Token

---

## ⚠️ 常见错误

### 错误1：skills目录位置错误

**问题**：skills复制到了错误的位置

**后果**：AGENTS.md中的 `skills/` 引用找不到文件

**解决**：
```bash
# 错误：复制到根目录
cp -r skills/ ../new-project/skills/

# 正确：复制到agents/research/skills/
cp -r skills/ ../new-project/agents/research/skills/
# 这样AGENTS.md中的 "skills/README.md" 才能正确解析
```

### 错误2：opencode.json路径错误

**问题**：prompt路径指向错误

**后果**：Agent无法加载AGENTS.md

**解决**：
```json
// 错误
"prompt": "{file:./AGENTS.md}"

// 正确
"prompt": "{file:./agents/research/AGENTS.md}"
```

### 错误3：opencode.json 缺失或不完整

**问题**：未创建 opencode.json 或内容不完整

**后果**：
- Opencode 框架无法识别项目
- Agent、Skills、Tools 无法被正确加载
- 研究项目无法正常工作

**解决**：
```bash
# 必须创建完整的 opencode.json，包含以下顶级字段：
# project, agents, skills, tools, workflows, directories, config, currentTopic

# 使用 init-research.sh 脚本会自动生成完整配置
./tools/init-research.sh my-project

# 或手动复制模板并修改
# 参考本文档"自动化步骤"中的完整模板
```

### 错误4：tools 目录未完整复制

**问题**：创建项目时未复制 tools/ 目录或复制不完整

**后果**：
- opencode.json 中注册的 tools 找不到对应的 SKILL.md 或脚本
- 工具调用失败

**解决**：
```bash
# 确保完整复制 tools/ 目录
# 应该包含：
# - baidu-search/
# - baidu-scholar-search/
# - baidu-baike-data/
# - paddleocr-doc-parsing/
# - paddleocr-text-recognition/
# - paddleocr-async/
# - file-reading/
# - document-output/
# - init-research.sh
```

### 错误4：在模板仓库创建课题后提交到git

**问题**：在SEARCH-R模板仓库创建研究课题并提交到git

**后果**：污染模板仓库，增加维护难度

**解决**：
```bash
# 方案1：清理研究文件（推荐）
git checkout agents/research/current-topic.md  # 恢复模板说明
rm agents/research/research-topics/your-topic.md
rm -rf research/  # 删除研究目录
git add .
git commit -m "chore: 清理测试研究课题"

# 方案2：添加到.gitignore（临时方案）
echo "research/" >> .gitignore
echo "agents/research/research-topics/your-topic.md" >> .gitignore
# 但这仍然不是最佳实践

# 最佳方案：创建独立项目
./tools/init-research.sh your-project-name
cd ../your-project-name
# 在独立项目中研究
```

---

## 🎓 最佳实践

### 创建研究项目

1. **优先选择独立仓库** - 不要在SEARCH-R模板仓库中创建课题
2. **从对话开始** - 让Agent引导你创建
3. **最小化启动** - 只填写必填信息即可开始
4. **后续完善** - 在研究过程中逐步补充细节

### 模板仓库使用

1. **保持纯净** - SEARCH-R是方法论模板，不应包含具体研究
2. **仅用于测试** - 如需快速测试，可以临时创建课题，但要及时清理
3. **恢复模板** - 测试完成后恢复current-topic.md到初始状态
4. **不提交研究** - 如果在模板仓库创建课题，务必在.gitignore中排除

### 管理多个课题

1. **限制active数量** - 同时进行不超过2个
2. **明确优先级** - 帮助决策研究顺序
3. **定期回顾** - 每周回顾paused课题
4. **及时归档** - 完成课题移至completed

### 课题文档维护

1. **及时更新进展** - 每次会话后更新
2. **记录关键决策** - 在研究记录中留痕
3. **整理研究资料** - 在研究资料中归档
4. **同步状态变更** - 切换课题时更新状态

---

## 📖 使用示例

### 示例1：创建研究项目（推荐流程）

```
Human: "我想研究代码自动生成的质量保证方法"

Agent: "好的！请选择创建方式：
1. 新建独立仓库（推荐）
2. 在当前SEARCH-R仓库中创建（不推荐）

请选择：[1/2] (默认：1)"

Human: "1"

Agent: "好的，将创建新的研究项目。
请提供：
1. 项目名称: code-generation-qa-research
2. 项目路径: [使用默认]
3. 研究背景: 代码生成工具的输出质量参差不齐，需要系统化的质量保证方法
4. 核心问题: 如何评估生成代码的质量？如何自动化质量检查？

创建中... ✅ 完成！是否开始研究？"

Human: "开始研究"

Agent: "进入Survey阶段..."
```

### 示例2：在项目中添加课题

```
Human: "我想研究代码生成的测试覆盖"

Agent: "📋 当前项目信息：
- 项目：code-generation-qa-research
- 当前课题：代码生成质量保证 (active)

将创建新课题，请提供：
1. 课题名称: 代码生成测试覆盖研究
2. 研究背景: 测试覆盖是代码质量的重要指标
3. 核心问题: 如何为生成的代码自动创建测试？
4. 优先级: medium

创建中... ✅ 完成！是否切换到新课题？"
```

Agent: "好的！当前项目有1个课题，我将创建新课题。
课题名称: 代码生成测试覆盖研究
研究背景: 测试覆盖是代码质量的重要指标
核心问题: 如何为生成的代码自动创建测试？测试覆盖率达到多少合适？
优先级: medium

创建中... ✅ 完成！是否切换到新课题？"

Human: "先完成当前课题"

Agent: "好的，新课题已创建但保持paused状态。
当前课题: 代码生成质量保证 (active)
可随时切换到: 代码生成测试覆盖 (paused)"
```

### 示例3：切换研究课题

```
Human: "切换到代码生成测试覆盖研究"

Agent: "切换课题中...
1. 保存当前课题进展
   - 已完成: 质量评估框架设计
   - 下一步: 实现评估工具
   
2. 激活新课题
   - 课题: 代码生成测试覆盖研究
   - 状态: active
   - 当前进展: Survey阶段
   
3. 更新current-topic.md

✅ 切换完成！
当前课题: 代码生成测试覆盖研究
下一步: 开始调研测试覆盖最佳实践"
```

---

## 🔧 故障排除

### 常见问题

**Q: 课题配置文件太复杂，不知道怎么填？**
A: 使用最小化模板，只填写核心信息即可开始。后续在研究过程中逐步完善。

**Q: 可以同时研究多个课题吗？**
A: 建议同时active的课题不超过2个，避免分散注意力。可以暂停低优先级课题。

**Q: 如何判断课题是否完成？**
A: 参考课题的"成功标准"和"期望产出"。当核心问题得到解答，期望产出已完成，即可标记为completed。

**Q: 暂停的课题会遗忘吗？**
A: 不会。课题配置会保留所有进展和下一步行动。建议每周回顾paused课题，适时恢复研究。

**Q: 如何复用其他课题的成果？**
A: 在课题配置的"相关课题"部分，可以引用其他课题的成果。详见topic-template.md。

---

## 🔗 相关文档

### 核心文档
- [Agent身份和能力](AGENTS.md) - Research Agent核心定义
- [课题模板](research-topics/topic-template.md) - 完整的课题配置模板

### 方法论文档
- [SEARCH-R方法论](../../methodology/search-r-cycle.md) - 完整的7阶段研究循环
- [研究深度定义](../../methodology/research-depth.md) - Level 0-3深度标准
- [Human角色定义](../../methodology/human-role.md) - Human双重角色和参与最小化

### 工具和资源
- [项目初始化脚本](../../tools/init-research.sh) - 自动化创建工具
- [快速开始指南](../../QUICKSTART.md) - 详细的使用教程
- [研究实例](../../research-instances/README.md) - 使用SEARCH-R的研究案例

---

## 📝 版本历史

- **v2.3** (2026-04-27) - 完善opencode.json生成规范
  - 强制创建完整的opencode.json（不再区分环境）
  - 添加完整的Agent/Skill/Tool注册表结构
  - 添加workflows、directories、config、currentTopic字段
  - 更新tools目录为完整复制（含所有工具定义和脚本）
  - 添加opencode.json字段详细说明文档
  - 更新完整性检查清单，验证opencode.json必填字段
  - 更新常见错误：添加tools未复制、opencode.json不完整等
  - 更新init-research.sh功能说明和环境检测逻辑

- **v2.2** (2026-03-13) - 添加创建方式询问
  - 引导时询问新建仓库或在模板仓库创建
  - 明确说明不在模板仓库创建的原因
  - 添加警告和确认流程
  - 更新最佳实践和使用示例

- **v2.1** (2026-03-13) - 完善init流程
  - 明确skills目录完整复制要求
  - 添加OpenCode环境自动检测
  - 条件创建opencode.json配置
  - 添加关键文件清单
  - 添加常见错误和解决方案
  - 更新工具脚本支持环境参数

- **v2.0** (2026-03-13) - 重构优化
  - 明确两种使用场景
  - 提供最小化模板
  - 强调对话式创建
  - 简化流程和步骤
  - 添加使用示例和故障排除

- **v1.1** (2026-03-07) - 多课题管理支持
  - 分离研究主体和研究课题
  - 添加课题切换机制

- **v1.0** (2026-03-07) - 初始版本

---

**维护者**: SEARCH-R Framework  
**更新时间**: 2026-04-27  
**文档类型**: 初始化指南
