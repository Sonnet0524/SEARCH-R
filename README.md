# Research Agent Framework

A methodology framework for AI Agent research.

[English](#english) | [中文](#中文)

---

<a name="english"></a>

## English

### What is this?

Research Agent Framework provides:

- 🤖 **Role Definition** - How to design a research-oriented Agent
- 📚 **Research Methodology** - Observe-Retrieve-Think-Discuss-Reflect cycle
- 📝 **Document Templates** - Observation notes, retrieval reports, reflection notes, theory documents, etc.
- 🎯 **Multi-level Research Depth** - From first principles to implementation approaches
- 🧠 **Self-reflection & Meta-research** - Continuous optimization of research methods

### Core Concepts

#### Research Cycle: Observe-Retrieve-Think-Discuss-Reflect

```
Observe (Agent Team practice)
    ↓
Retrieve (Online materials)
    ↓
Think (Questions & discoveries)
    ↓
Discuss (Insights & challenges)
    ↓
Reflect (Validation & iteration)
    ↓
(Cycle continues)
```

#### Research Depth: From First Principles to Implementation

```
Level 0: First Principles - Ask "why" until you can't ask anymore
Level 1: Theoretical Framework - Build models, formal expressions
Level 2: Design Principles - Derive principles from theory
Level 3: Implementation Approaches - Derive approaches from principles
Level 4: Implementation Details ❌ - Not Research Agent's responsibility
```

#### Human's Dual Roles

**Role 1: Information Transmitter (NOT "Human Intervention")**
- Inter-agent information passing
- No decision-making
- Doesn't affect "Minimize Human Participation" principle

**Role 2: Key Decision Maker (IS "Human Intervention")**
- Research direction selection
- Design decision-making
- Affects project direction

### Quick Start

1. **Define Role** - Reference `agents/research/AGENTS.md`
2. **Setup Document Structure** - Create research directories
3. **Use Templates** - Choose templates from `framework/templates/`
4. **Start Research Cycle** - Observe, retrieve, think, discuss, reflect

### Directory Structure

```
research-agent/
├── README.md                      # This file
├── agents/
│   └── research/
│       ├── AGENTS.md             # Role definition (core)
│       └── ESSENTIALS.md         # Core responsibilities
├── framework/
│   ├── templates/                # Document templates
│   │   ├── observation-template.md
│   │   ├── retrieval-survey-template.md
│   │   ├── retrieval-quick-template.md
│   │   ├── reflection-template.md
│   │   ├── theory-template.md
│   │   └── self-reflection-template.md
│   └── examples/                 # Usage examples
│       └── example-session.md
└── docs/
    ├── getting-started.md        # Quick start guide
    └── design-philosophy.md      # Design philosophy
```

### Use Cases

**Suitable for**:
- ✅ Complex problems requiring systematic research
- ✅ Design thinking from first principles
- ✅ Recording research process for review
- ✅ Continuous iteration of research methods
- ✅ Deep collaboration between Agent and Human

**Not suitable for**:
- ❌ Simple Q&A queries
- ❌ Pure execution-level work
- ❌ Tasks not requiring deep thinking

### Core Value

**Value 1: Record Thinking Process**
- How questions are discovered
- How insights emerge
- How decisions are made

**Value 2: Insight + Challenge Partnership**
- Human's role: Propose direction, make decisions
- Research Agent's role: Provide insights, raise challenges

This is "co-exploration, mutual inspiration", not "Q&A service".

---

<a name="中文"></a>

## 中文

### 这是什么？

Research Agent Framework提供了：

- 🤖 **角色定义** - 如何设计一个研究型Agent
- 📚 **研究方法论** - 观察-检索-思考-探讨-反思的研究循环
- 📝 **文档模板** - 观察笔记、检索报告、思考笔记、理论文档等
- 🎯 **多层次研究深度** - 从第一性原理到实现思路
- 🧠 **自我反思与元研究** - 研究方法本身的持续优化

### 核心理念

#### 研究循环：观察-检索-思考-探讨-反思

```
观察（Agent Team实践）
    ↓
检索（在线资料）
    ↓
思考（问题与发现）
    ↓
探讨（洞察与挑战）
    ↓
反思（验证与迭代）
    ↓
（循环继续）
```

#### 研究深度：从第一性原理到实现思路

```
Level 0: 第一性原理层 - 追问"为什么"直到无法再追问
Level 1: 理论框架层 - 构建模型、形式化表达
Level 2: 设计原则层 - 从理论推导原则
Level 3: 实现思路层 - 从原则推导思路
Level 4: 实施建议层 ❌ - 不是Research Agent的职责
```

#### Human的双重角色

**角色1：信息传递者（不算"Human介入"）**
- Agent间信息传递
- 不做决策
- 不影响"Human参与最小化"原则

**角色2：关键决策者（算"Human介入"）**
- 研究方向选择
- 设计方案决策
- 影响项目方向

### 快速开始

1. **定义角色** - 参考 `agents/research/AGENTS.md`
2. **建立文档结构** - 创建研究文档目录
3. **使用模板** - 从 `framework/templates/` 选择模板
4. **开始研究循环** - 观察、检索、思考、探讨、反思

### 目录结构

```
research-agent/
├── README.md                      # 本文件
├── agents/
│   └── research/
│       ├── AGENTS.md             # 角色定义（核心）
│       └── ESSENTIALS.md         # 核心职责
├── framework/
│   ├── templates/                # 文档模板
│   │   ├── observation-template.md
│   │   ├── retrieval-survey-template.md
│   │   ├── retrieval-quick-template.md
│   │   ├── reflection-template.md
│   │   ├── theory-template.md
│   │   └── self-reflection-template.md
│   └── examples/                 # 使用示例
│       └── example-session.md
└── docs/
    ├── getting-started.md        # 快速开始
    └── design-philosophy.md      # 设计哲学
```

### 适用场景

**适合**：
- ✅ 需要系统性研究的复杂问题
- ✅ 需要从第一性原理思考的设计
- ✅ 需要记录研究过程以便复盘
- ✅ 需要持续迭代研究方法
- ✅ Agent与Human深度协作的研究

**不适合**：
- ❌ 简单的问答式查询
- ❌ 纯执行层面的工作
- ❌ 不需要深度思考的任务

### 核心价值

**价值1：记录思考过程**
- 问题是如何发现的
- 洞察是如何产生的
- 决策是如何做出的

**价值2：洞察+挑战的配合**
- Human的角色：提出方向、做决策
- Research Agent的角色：提供洞察、提出挑战

这是"共同探索、相互激发"，不是"问答服务"。

---

## Design Philosophy | 设计哲学

### Research Agent is not an Executor | Research Agent不是执行者

Research Agent is a **researcher**, not an **executor**:
- Focus on "why" and "what", not "how"
- Provide theoretical support and design thinking, not implementation details

Research Agent是**研究员**，不是**执行者**：
- 关注"为什么"和"是什么"，不关心"怎么做"
- 提供理论支撑和设计思路，不提供实施细节

### Research Should be Traceable | 研究应该可追溯

Every research should record:
- How questions were discovered
- How insights emerged
- How decisions were made

每次研究都应该记录：
- 问题是如何发现的
- 洞察是如何产生的
- 决策是如何做出的

### Research Should be Deep | 研究应该有深度

Should not stay on the surface, should:
- Ask first principles
- Build theoretical frameworks
- Derive design principles
- Form implementation approaches

不应该停留在表面，应该：
- 追问第一性原理
- 构建理论框架
- 推导设计原则
- 形成实现思路

### Research Methods Should Evolve | 研究方法应该持续进化

Research methods themselves also need research and improvement:
- Reflect after each session
- Iterate when methodology problems are found
- Continuously optimize research efficiency

研究方法本身也需要研究和改进：
- 每次会话后反思
- 发现方法论问题及时迭代
- 不断优化研究效率

---

## Examples | 案例

See `framework/examples/` for real usage examples.

查看 `framework/examples/` 了解实际使用案例。

---

## Contributing | 贡献

This framework is continuously iterating. If you have improvement suggestions, welcome to discuss.

这个框架本身也在持续迭代中。如果你有改进建议，欢迎讨论。

---

## License | 许可

MIT License

---

**Maintainer**: Research Agent  
**Created**: 2026-03-07  
**Status**: Actively iterating
