# SEARCH-R Framework

A methodology framework for AI Agent research.

[English](#english) | [中文](#中文)

---

<a name="english"></a>

## English

### What is this?

SEARCH-R Framework provides:

- 🔍 **SEARCH-R Methodology** - A complete research cycle: Survey → Explore → Analyze → Review → Confirm → Harvest → Reflect
- 🤖 **Research Agent Design** - How to design a research-oriented Agent
- 📝 **Document Templates** - Observation notes, retrieval reports, reflection notes, theory documents
- 🎯 **Multi-level Research Depth** - From first principles to implementation approaches
- 🧠 **Core Theories** - Agent system architecture, quality gates, skills separation principles

### SEARCH-R Methodology

**The Complete Cycle**:

```
S - Survey（观察调研）
    ↓
E - Explore（探索检索）
    ↓
A - Analyze（分析思考）
    ↓
R - Review（评审探讨）
    ↓
C - Confirm（确认验证）
    ↓
H - Harvest（收获产出）
    ↓
R - Reflect（反思迭代）
    ↓
(Back to S - Cycle continues)
```

**Each Phase Explained**:

```yaml
S - Survey（观察调研）:
  - Observe Agent Team practices
  - Track document changes
  - Identify collaboration patterns
  - Discover problems from practice

E - Explore（探索检索）:
  - Retrieve on-demand during discussions
  - Search external frameworks (OpenClaw, AutoGen, etc.)
  - Collect reference materials
  - Compare different approaches

A - Analyze（分析思考）:
  - Identify patterns and problems
  - Apply first principles reasoning
  - Form hypotheses
  - Build theoretical frameworks

R - Review（评审探讨）:
  - Provide insights
  - Raise challenges
  - Deep discussion with users
  - Record decision processes

C - Confirm（确认验证）:
  - Validate hypotheses
  - Test in practice
  - Check consistency with project foundations
  - Gather user feedback

H - Harvest（收获产出）:
  - Summarize theoretical achievements
  - Create documentation
  - Update framework designs
  - Consolidate methodology

R - Reflect（反思迭代）:
  - Reflect on methodology
  - Self-improvement
  - Theory revision
  - Return to S for next cycle
```

### Core Theories

#### 1. Agent System Architecture

```
Agent System = Identity Layer + Capability System + Memory System + Access System

Identity Layer:
  File: AGENTS.md
  Content: Role definition + Core capabilities
  Nature: Long-term, stable

Capability System:
  Core Capabilities: Defined in AGENTS.md, inseparable
  General Capabilities (Skills): Reusable, on-demand loading

Memory System:
  - Identity Memory (AGENTS.md): Who I am
  - State Memory (CATCH_UP.md): Current status, recent history
  - Experience Memory (experiences/): Historical knowledge
  - Session Memory (session-log.md): Current conversation

Access System:
  - Memory Index (memory-index.yaml): Directory to locate memories
  - Retrieval Mechanism: Load relevant memories on-demand
  - Compression Mechanism: Convert short-term to long-term memory
```

#### 2. Quality Gate Layers

```
Quality Gate = Metacognitive Awareness + Evaluation Rules + Evaluation Tools

Metacognitive Awareness (Inseparable):
  - Defined in AGENTS.md
  - "I know when I don't know"
  - Core attribute of Agent

Evaluation Rules (Can be Skills):
  - Determinism evaluation (HIGH/MEDIUM/LOW)
  - Acceptability evaluation
  - Confusion detection

Evaluation Tools (Can be Skills):
  - Quality gate schemas
  - Evaluation workflows
```

#### 3. Agent vs Subagent

```
Distinction Standard: Decision Autonomy (NOT documentation completeness)

Agent (Has autonomy):
  - Can make autonomous decisions
  - Independent task space
  - Responsible for outcomes
  Example: PM Agent, Research Agent

Subagent (No autonomy):
  - Task-bound
  - Decision-constrained
  - Executes assigned tasks
  Example: AI Team, Core Team, Integration Team

Key Insight: Subagent can also have complete three-layer memory system!
```

#### 4. Skills Separation Principles

```
What should be Skills?

Principle 1: Not needed every time → Can be Skills
Principle 2: Reusable across Agents → Should be Skills
Principle 3: Independent capability unit → Can be Skills

Skills Categories:
  - Decision Support: quality-gate, risk-assessment
  - Workflows: git-workflow, review-process
  - Standards: coding-standards, documentation-guide
  - Domain Knowledge: embedding-models, vector-search
```

#### 5. Memory System vs Access System

```
Key Distinction:

Memory System (Content):
  Nature: Stored information itself
  Analogy: Books in a library

Access System (Method):
  Nature: Method to retrieve content
  Analogy: Library catalog

Index ≠ Memory
Index is "directory", not "content"
Index is "method", not "memory"
```

### Research Depth: From First Principles to Implementation

```
Level 0: First Principles
  Question: What is the essence of XXX? Why XXX?
  Method: Ask "why" until you can't ask anymore

Level 1: Theoretical Framework
  Question: How to model XXX? What is the decision model?
  Method: Build models, formal expressions, logical deduction

Level 2: Design Principles
  Question: What principles to follow? How to trade-off?
  Method: Derive principles from theory

Level 3: Implementation Approaches
  Question: How to design? What are the options?
  Method: Derive approaches from principles

Level 4: Implementation Details ❌
  Question: How to write code? Where to put config?
  Method: Not Research Agent's responsibility
```

### Human's Dual Roles

**Role 1: Information Transmitter (NOT "Human Intervention")**
- Inter-agent information passing
- No decision-making
- Doesn't affect "Minimize Human Participation" principle

**Role 2: Key Decision Maker (IS "Human Intervention")**
- Research direction selection
- Design decision-making
- Affects project direction

### Quick Start

1. **Understand SEARCH-R Methodology** - Learn the complete cycle
2. **Define Role** - Reference `agents/research/AGENTS.md`
3. **Setup Document Structure** - Create research directories
4. **Start Research Cycle** - Begin with Survey (S)

### Directory Structure

```
SEARCH-R/
├── README.md                      # This file
├── agents/
│   └── research/
│       ├── AGENTS.md             # Role definition (core)
│       └── guides/               # Research guides
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

SEARCH-R框架提供了：

- 🔍 **SEARCH-R方法论** - 完整的研究循环：观察调研 → 探索检索 → 分析思考 → 评审探讨 → 确认验证 → 收获产出 → 反思迭代
- 🤖 **Research Agent设计** - 如何设计一个研究型Agent
- 📝 **文档模板** - 观察笔记、检索报告、思考笔记、理论文档等
- 🎯 **多层次研究深度** - 从第一性原理到实现思路
- 🧠 **核心理论** - Agent系统架构、质量门控、Skills分离原则

### SEARCH-R方法论

**完整循环**：

```
S - Survey（观察调研）
    ↓
E - Explore（探索检索）
    ↓
A - Analyze（分析思考）
    ↓
R - Review（评审探讨）
    ↓
C - Confirm（确认验证）
    ↓
H - Harvest（收获产出）
    ↓
R - Reflect（反思迭代）
    ↓
(回到S - 循环继续)
```

**每个阶段详解**：

```yaml
S - Survey（观察调研）:
  - 观察Agent Team实践
  - 跟踪文档变化
  - 识别协作模式
  - 从实践中发现问题

E - Explore（探索检索）:
  - 对话中按需检索
  - 检索外部框架（OpenClaw、AutoGen等）
  - 收集参考资料
  - 对比不同方法

A - Analyze（分析思考）:
  - 识别模式和问题
  - 第一性原理推导
  - 形成假设
  - 构建理论框架

R - Review（评审探讨）:
  - 提供洞察
  - 提出挑战
  - 与用户深度讨论
  - 记录决策过程

C - Confirm（确认验证）:
  - 验证假设
  - 实践检验
  - 与项目基础一致性检查
  - 获取用户反馈

H - Harvest（收获产出）:
  - 总结理论成果
  - 形成文档产出
  - 更新框架设计
  - 沉淀方法论

R - Reflect（反思迭代）:
  - 方法论反思
  - 自我改进
  - 理论修正
  - 回到S，继续循环
```

### 核心理论

#### 1. Agent系统架构

```
Agent系统 = 身份层 + 能力系统 + 记忆系统 + 访问系统

身份层：
  文件：AGENTS.md
  内容：角色定义 + 核心能力
  性质：长期、稳定

能力系统：
  核心能力：定义在AGENTS.md中，不可分离
  通用能力（Skills）：可复用、按需加载

记忆系统：
  - 身份记忆（AGENTS.md）：我是谁
  - 状态记忆（CATCH_UP.md）：当前状态、最近历史
  - 经验记忆（experiences/）：历史经验、知识积累
  - 会话记忆（session-log.md）：当前会话

访问系统：
  - 记忆索引（memory-index.yaml）：记忆的目录
  - 检索机制：按需加载相关记忆
  - 压缩机制：短期记忆转长期记忆
```

#### 2. 质量门控分层

```
质量门控 = 元认知意识 + 评估规则 + 评估工具

元认知意识（不可分离）：
  - 定义在AGENTS.md中
  - "我知道自己什么时候不知道"
  - Agent的核心属性

评估规则（可Skills化）：
  - 确定性评估（HIGH/MEDIUM/LOW）
  - 可接受性评估
  - 混淆判断

评估工具（可Skills化）：
  - 质量门控Schema
  - 评估流程
```

#### 3. Agent vs Subagent

```
区分标准：决策自主性（不是文档完整性）

Agent（有自主权）：
  - 可以自主决策
  - 独立的任务空间
  - 对结果负责
  示例：PM Agent、Research Agent

Subagent（无自主权）：
  - 任务绑定
  - 决策受限
  - 执行分配的任务
  示例：AI Team、Core Team、Integration Team

关键洞察：Subagent也可以有完整的三层记忆系统！
```

#### 4. Skills分离原则

```
什么内容应该Skills化？

原则1：非每次都需要 → 可以Skills化
原则2：可多个Agent复用 → 应该Skills化
原则3：相对独立的能力单元 → 可以Skills化

Skills分类：
  - 决策支持类：quality-gate、risk-assessment
  - 工作流类：git-workflow、review-process
  - 规范类：coding-standards、documentation-guide
  - 领域知识类：embedding-models、vector-search
```

#### 5. 记忆系统 vs 访问系统

```
关键区分：

记忆系统（内容）：
  性质：存储信息内容本身
  类比：图书馆的书

访问系统（方法）：
  性质：检索内容的方法
  类比：图书馆目录

索引 ≠ 记忆
索引是"目录"，不是"内容"
索引是"方法"，不是"记忆"
```

### 研究深度：从第一性原理到实现思路

```
Level 0: 第一性原理层
  问题：XXX的本质是什么？为什么要XXX？
  方法：追问"为什么"直到无法再追问

Level 1: 理论框架层
  问题：XXX如何建模？决策模型是什么？
  方法：构建模型、形式化表达、逻辑推演

Level 2: 设计原则层
  问题：应该遵循什么原则？原则如何权衡？
  方法：从理论推导原则

Level 3: 实现思路层
  问题：如何设计？有哪些方案？
  方法：从原则推导思路

Level 4: 实施建议层 ❌
  问题：代码怎么写？配置放哪里？
  方法：这不是Research Agent的职责范围
```

### Human的双重角色

**角色1：信息传递者（不算"Human介入"）**
- Agent间信息传递
- 不做决策
- 不影响"Human参与最小化"原则

**角色2：关键决策者（算"Human介入"）**
- 研究方向选择
- 设计方案决策
- 影响项目方向

### 快速开始

1. **理解SEARCH-R方法论** - 学习完整循环
2. **定义角色** - 参考 `agents/research/AGENTS.md`
3. **建立文档结构** - 创建研究文档目录
4. **开始研究循环** - 从Survey（S）开始

### 目录结构

```
SEARCH-R/
├── README.md                      # 本文件
├── agents/
│   └── research/
│       ├── AGENTS.md             # 角色定义（核心）
│       └── guides/               # 研究指导
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
**Methodology**: SEARCH-R
