<div align="center">

# 🔬 SEARCH-R Framework

**AI Agent 研究方法论框架**

*A Methodology Framework for AI Agent Research*

[![Version](https://img.shields.io/badge/version-1.1-blue.svg)](https://github.com/Sonnet0524/SEARCH-R)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-active-success.svg)]()

**L0 - Research Data Source Layer**

</div>

---

## 📖 目录

- [概述](#概述)
- [核心方法论](#核心方法论)
- [核心理论](#核心理论)
- [快速开始](#快速开始)
- [目录结构](#目录结构)
- [研究成果](#研究成果)
- [应用场景](#应用场景)
- [设计哲学](#设计哲学)

---

## 概述

### 这是什么？

SEARCH-R Framework 是一个**系统化的 AI Agent 研究方法论框架**，提供从第一性原理到实现思路的完整研究路径。

### 层级定位

```
┌─────────────────────────────────────────┐
│  L0: SEARCH-R ← 你在这里                │
│  研究方法论和数据源层                    │
├─────────────────────────────────────────┤
│  L1: agent-team-research                │
│  研究支撑层                             │
├─────────────────────────────────────────┤
│  L2: AgentTeam-Template                 │
│  项目模板层                             │
├─────────────────────────────────────────┤
│  L3: Projects                           │
│  具体项目                               │
└─────────────────────────────────────────┘
```

### 核心价值

| 价值 | 描述 |
|------|------|
| 🔍 **系统化方法论** | 完整的SEARCH-R研究循环 |
| 🤖 **Research Agent** | 如何设计研究型Agent |
| 📝 **文档模板** | 观察笔记、检索报告、理论文档 |
| 🎯 **多层深度** | 从第一性原理到实现思路 |
| 🧠 **核心理论** | Agent架构、质量门控、Skills分离 |

---

## 核心方法论

### SEARCH-R 循环

```
  ┌───────────────────────────────────────┐
  │                                       │
  │   S ─ Survey（观察调研）              │
  │   │   从实践中发现问题                 │
  │   ↓                                   │
  │   E ─ Explore（探索检索）             │
  │   │   检索相关知识                    │
  │   ↓                                   │
  │   A ─ Analyze（分析思考）             │
  │   │   深度理论构建                    │
  │   ↓                                   │
  │   R ─ Review（评审探讨）              │
  │   │   Human参与探讨                   │
  │   ↓                                   │
  │   C ─ Confirm（确认验证）             │
  │   │   实践中验证                      │
  │   ↓                                   │
  │   H ─ Harvest（收获产出）             │
  │   │   沉淀研究成果                    │
  │   ↓                                   │
  │   R ─ Reflect（反思迭代）             │
  │       持续优化方法                    │
  │                                       │
  └───────────────────────────────────────┘
                    ↓
              回到S继续循环
```

### 研究深度层次

```
┌──────────────────────────────────────────────────────────┐
│  Level 0: 第一性原理层                                   │
│  问题：XXX的本质是什么？为什么要XXX？                     │
│  方法：追问"为什么"直到无法再追问                        │
├──────────────────────────────────────────────────────────┤
│  Level 1: 理论框架层                                     │
│  问题：XXX如何建模？决策模型是什么？                      │
│  方法：构建模型、形式化表达、逻辑推演                     │
├──────────────────────────────────────────────────────────┤
│  Level 2: 设计原则层                                     │
│  问题：应该遵循什么原则？原则如何权衡？                   │
│  方法：从理论推导原则                                     │
├──────────────────────────────────────────────────────────┤
│  Level 3: 实现思路层                                     │
│  问题：如何设计？有哪些方案？                            │
│  方法：从原则推导思路                                     │
├──────────────────────────────────────────────────────────┤
│  Level 4: 实施建议层 ❌                                  │
│  问题：代码怎么写？配置放哪里？                          │
│  方法：这不是Research Agent的职责范围                     │
└──────────────────────────────────────────────────────────┘
```

---

## 核心理论

### 1. Agent 系统架构

```
Agent System = Identity Layer + Capability System + Memory System + Access System

┌─────────────────────────────────────────────────────────┐
│                    Agent System                         │
├─────────────────────────────────────────────────────────┤
│  Identity Layer                                         │
│  ├─ File: AGENTS.md                                    │
│  ├─ Content: Role + Core Capabilities                   │
│  └─ Nature: Long-term, Stable                          │
├─────────────────────────────────────────────────────────┤
│  Capability System                                      │
│  ├─ Core Capabilities (Inseparable)                    │
│  └─ General Capabilities (Skills, Reusable)            │
├─────────────────────────────────────────────────────────┤
│  Memory System                                          │
│  ├─ Identity Memory (AGENTS.md)                        │
│  ├─ State Memory (CATCH_UP.md)                         │
│  ├─ Experience Memory (experiences/)                   │
│  └─ Session Memory (session-log.md)                    │
├─────────────────────────────────────────────────────────┤
│  Access System                                          │
│  ├─ Memory Index (memory-index.yaml)                   │
│  ├─ Retrieval Mechanism                                │
│  └─ Compression Mechanism                              │
└─────────────────────────────────────────────────────────┘
```

### 2. 质量门控分层

```
Quality Gate = Metacognitive Awareness + Evaluation Rules + Evaluation Tools

┌─────────────────────────────────────────────────────────┐
│  Layer 1: Metacognitive Awareness (Inseparable)        │
│  ─────────────────────────────────────────────────────  │
│  "I know when I don't know"                            │
│  ├─ Defined in AGENTS.md                               │
│  └─ Core attribute of Agent                            │
├─────────────────────────────────────────────────────────┤
│  Layer 2: Evaluation Rules (Can be Skills)             │
│  ─────────────────────────────────────────────────────  │
│  ├─ Determinism evaluation (HIGH/MEDIUM/LOW)           │
│  ├─ Acceptability evaluation                           │
│  └─ Confusion detection                                │
├─────────────────────────────────────────────────────────┤
│  Layer 3: Evaluation Tools (Can be Skills)             │
│  ─────────────────────────────────────────────────────  │
│  ├─ Quality gate schemas                               │
│  └─ Evaluation workflows                               │
└─────────────────────────────────────────────────────────┘
```

### 3. Agent vs Subagent

```
┌──────────────────────────────────────────────────────────┐
│                   Distinction Standard                    │
│              Decision Autonomy (NOT documentation)       │
└──────────────────────────────────────────────────────────┘
                           │
           ┌───────────────┴───────────────┐
           │                               │
           ▼                               ▼
┌─────────────────────┐       ┌─────────────────────┐
│   Agent             │       │   Subagent          │
│   (Has autonomy)    │       │   (No autonomy)     │
├─────────────────────┤       ├─────────────────────┤
│ ✅ Autonomous       │       │ ❌ Task-bound       │
│ ✅ Independent      │       │ ❌ Decision-limited │
│ ✅ Responsible      │       │ ❌ Execute assigned │
├─────────────────────┤       ├─────────────────────┤
│ Example:            │       │ Example:            │
│ • PM Agent          │       │ • AI Team           │
│ • Research Agent    │       │ • Core Team         │
└─────────────────────┘       └─────────────────────┘
```

### 4. Skills 分离原则

```
┌──────────────────────────────────────────────────────────┐
│                  What should be Skills?                  │
└──────────────────────────────────────────────────────────┘

  Principle 1          Principle 2          Principle 3
  ───────────          ───────────          ───────────
  Not every time       Reusable             Independent
  ────────────────     ────────────────     ────────────────
       │                    │                    │
       └────────────────────┼────────────────────┘
                            │
                            ▼
              ┌─────────────────────────┐
              │   Can be Skills         │
              └─────────────────────────┘

┌──────────────────────────────────────────────────────────┐
│                    Skills Categories                     │
├──────────────────────────────────────────────────────────┤
│  🎯 Decision Support    │  quality-gate, risk-assessment │
│  🔄 Workflows           │  git-workflow, review-process  │
│  📋 Standards           │  coding-standards, doc-guide   │
│  📚 Domain Knowledge    │  embedding-models, vector-search│
└──────────────────────────────────────────────────────────┘
```

### 5. 记忆系统 vs 访问系统

```
┌──────────────────────────────────────────────────────────┐
│                   Key Distinction                        │
└──────────────────────────────────────────────────────────┘

  Memory System                      Access System
  ─────────────                      ─────────────
  (Content)                          (Method)
                                       
  ┌─────────────┐                   ┌─────────────┐
  │ Books in    │                   │ Library     │
  │ a library   │                   │ catalog     │
  └─────────────┘                   └─────────────┘
                                       
  Stored information                 Method to retrieve
  itself                             content

┌──────────────────────────────────────────────────────────┐
│                    Important Note                        │
├──────────────────────────────────────────────────────────┤
│  Index ≠ Memory                                         │
│  Index is "directory", not "content"                    │
│  Index is "method", not "memory"                        │
└──────────────────────────────────────────────────────────┘
```

---

## 快速开始

### 安装使用

```bash
# 克隆仓库
git clone https://github.com/Sonnet0524/SEARCH-R.git

# 进入目录
cd SEARCH-R

# 启动 Research Agent
opencode --agent research
```

### 学习路径

```
Step 1 ──────────────────────────────────────────────────→
  理解SEARCH-R方法论
  📖 阅读 methodology/search-r-cycle.md

Step 2 ──────────────────────────────────────────────────→
  了解Research Agent设计
  📖 阅读 agents/research/AGENTS.md

Step 3 ──────────────────────────────────────────────────→
  建立文档结构
  📁 创建研究文档目录

Step 4 ──────────────────────────────────────────────────→
  开始研究循环
  🔄 从Survey（S）开始
```

---

## 目录结构

```
SEARCH-R/
├── 📄 README.md                      # 本文件
├── 📁 agents/
│   └── 📁 research/
│       ├── 📄 AGENTS.md             # Agent角色定义
│       ├── 📄 init.md               # 初始化指南
│       ├── 📄 current-topic.md      # 当前研究课题
│       ├── 📄 session-log.md        # 会话日志
│       │
│       ├── 📁 theory/               # 理论文档
│       │   ├── 📄 2026-03-07-metacognition-implementation.md
│       │   ├── 📄 2026-03-07-memory-compression-deep-dive.md
│       │   └── 📄 2026-03-07-quality-gate-and-agent-definition.md
│       │
│       ├── 📁 reflections/          # 自我反思
│       │   ├── 📄 2026-03-07.md
│       │   └── 📄 2026-03-07-quality-gate-review.md
│       │
│       ├── 📁 examples/             # 示例文档
│       ├── 📁 skills/               # 能力模块
│       └── 📁 research-topics/      # 研究课题
│
├── 📁 methodology/                   # 方法论
│   ├── 📄 README.md
│   ├── 📄 search-r-cycle.md         # SEARCH-R循环
│   ├── 📄 research-depth.md         # 研究深度
│   └── 📄 human-role.md             # Human角色
│
├── 📁 templates/                     # 文档模板
│   ├── 📄 observation-template.md
│   ├── 📄 retrieval-template.md
│   ├── 📄 theory-template.md
│   └── 📄 reflection-template.md
│
└── 📁 docs/                         # 使用文档
    ├── 📄 getting-started.md
    ├── 📄 design-philosophy.md
    └── 📄 MIGRATION-REPORT.md
```

---

## 研究成果

### 📚 理论文档

| 文档 | 内容 | 行数 |
|------|------|------|
| [元认知意识实现](agents/research/theory/2026-03-07-metacognition-implementation.md) | 质量门控、确定性评估、元认知设计 | 1,403 |
| [记忆压缩机制](agents/research/theory/2026-03-07-memory-compression-deep-dive.md) | Context优化、记忆系统设计 | 1,277 |
| [质量门控理论](agents/research/theory/2026-03-07-quality-gate-and-agent-definition.md) | 元认知意识、质量门控本质 | 804 |

### 🔄 自我反思

| 文档 | 内容 | 行数 |
|------|------|------|
| [方法论设计反思](agents/research/reflections/2026-03-07.md) | Research Agent方法论评估 | 288 |
| [质量门控Review](agents/research/reflections/2026-03-07-quality-gate-review.md) | 质量门控深度反思 | 361 |

**总计**: 4,132 行核心研究文档

---

## 应用场景

### ✅ 适合的研究课题

| 场景 | 说明 |
|------|------|
| 🏗️ 框架和方法论研究 | 需要系统性构建理论框架 |
| 🔍 技术调研和评估 | 需要深入分析技术方案 |
| 🏛️ 架构设计和演进 | 需要从第一性原理思考 |
| 📚 知识沉淀和提炼 | 需要记录和复用研究成果 |

### ❌ 不适合的任务

| 场景 | 原因 |
|------|------|
| ❓ 简单信息查询 | 不需要深度研究 |
| 💻 具体代码实现 | 这是执行层工作 |
| 📋 日常项目管理 | 不是研究型任务 |
| 🔧 简单问题解决 | 不需要系统性方法 |

---

## 设计哲学

### Research Agent 不是执行者

```
┌─────────────────────────────────────────────────────────┐
│                  Research Agent                         │
│                  ─────────────                          │
│                                                         │
│  Focus on:           Not on:                           │
│  ─────────           ─────────                          │
│  ✅ Why              ❌ How to implement                │
│  ✅ What             ❌ Code details                    │
│  ✅ Principles       ❌ Configuration                   │
│                                                         │
│  Provide:                                               │
│  ─────────                                               │
│  💡 Theoretical support                                 │
│  🎨 Design thinking                                     │
│  📋 Implementation approaches                           │
└─────────────────────────────────────────────────────────┘
```

### 研究三原则

```
┌─────────────────────────────────────────────────────────┐
│  1️⃣ Traceable                                          │
│  ────────────────                                       │
│  Every research should record:                          │
│  • How questions were discovered                        │
│  • How insights emerged                                 │
│  • How decisions were made                              │
├─────────────────────────────────────────────────────────┤
│  2️⃣ Deep                                               │
│  ────────────────                                       │
│  Should not stay on the surface:                        │
│  • Ask first principles                                 │
│  • Build theoretical frameworks                         │
│  • Derive design principles                             │
├─────────────────────────────────────────────────────────┤
│  3️⃣ Evolving                                           │
│  ────────────────                                       │
│  Research methods should evolve:                        │
│  • Reflect after each session                           │
│  • Iterate when problems found                          │
│  • Continuously optimize                                │
└─────────────────────────────────────────────────────────┘
```

---

## Human 的双重角色

```
┌─────────────────────────────────────────────────────────┐
│                 Human's Dual Roles                      │
└─────────────────────────────────────────────────────────┘
                           │
           ┌───────────────┴───────────────┐
           │                               │
           ▼                               ▼
┌─────────────────────┐       ┌─────────────────────┐
│ Role 1              │       │ Role 2              │
│ ─────────           │       │ ─────────           │
│ Information         │       │ Key Decision        │
│ Transmitter         │       │ Maker               │
├─────────────────────┤       ├─────────────────────┤
│ • Agent间信息传递   │       │ • 研究方向选择      │
│ • 不做决策          │       │ • 设计方案决策      │
│ • 不算"介入"        │       │ • 影响项目方向      │
└─────────────────────┘       └─────────────────────┘
        │                              │
        │                              │
        ▼                              ▼
  Not counted                    IS counted
  as intervention                as intervention
```

---

## 贡献

这个框架在持续迭代中。如果你有改进建议，欢迎讨论。

## 许可

MIT License

---

<div align="center">

**维护者**: Sonnet.G  
**创建时间**: 2026-03-07  
**最后更新**: 2026-03-08  
**状态**: 持续迭代中

**[⬆ 返回顶部](#-search-r-framework)**

</div>
