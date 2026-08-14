<div align="center">

# 🔬 SEARCH-R Framework

**AI Agent 研究方法论框架**

[![Agent Version](https://img.shields.io/badge/Agent%20Version-v2.0-blue.svg)]()
[![License](https://img.shields.io/badge/license-AGPL%20v3-blue.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-active-success.svg)]()

*Search（搜索）+ Reflect（反思）= 持续探索真理*

</div>

---

## 这是什么？

SEARCH-R 是一套面向 AI Agent 的**研究方法论框架**。它解决的核心问题是：

> 如何让 AI Agent 像研究者一样工作——不是搜完就扔，而是持续积累、深度思考、发现连接？

SEARCH-R 不绑定任何特定 AI 平台，它定义的是方法论，不是 API。

---

## 目录

- [SEARCH-R 研究循环](#search-r-研究循环)
- [研究深度](#研究深度)
- [知识萃取](#知识萃取)
- [记忆分层架构](#记忆分层架构)
- [课题管理](#课题管理)
- [课题网络梳理](#课题网络梳理)
- [人机协作](#人机协作)
- [仓库结构](#仓库结构)
- [智能体接入指南](#智能体接入指南)

---

## SEARCH-R 研究循环

SEARCH-R 是一个 7 阶段的研究循环，用于系统性推进研究课题。

```
S - Survey    → 观察实践，发现问题
E - Explore   → 检索知识，收集信息
A - Analyze   → 深度分析，构建理论
R - Review    → Human 评审，方向确认
C - Confirm   → 实践验证，收集证据
H - Harvest   → 沉淀成果，固化知识
R - Reflect   → 反思迭代，持续改进
```

### 各阶段职责

| 阶段 | 做什么 | 产出 |
|------|--------|------|
| **S - Survey** | 观察一线工作场景，识别值得研究的课题，检索已有知识避免重复 | 课题定义 |
| **E - Explore** | 文献检索、案例搜索、信息整理分类、识别知识缺口 | 检索报告 |
| **A - Analyze** | 第一性原理分析，构建理论框架，提炼设计原则，形成概念模型 | 理论文档 |
| **R - Review** | Human 参与评审，验证理论是否站得住脚，根据反馈调整 | 评审意见 |
| **C - Confirm** | 小规模试点，收集验证数据，对比预期与实际，修正理论 | 验证报告 |
| **H - Harvest** | 整理研究文档，形成可复用的知识产出，归档到课题目录 | 研究成果 |
| **R - Reflect** | 回顾研究过程，识别方法论改进空间，记录经验教训 | 反思笔记 |

### 核心认知

**SEARCH-R 的产出是研究结论，不是 Insight。** 研究过程中可能产生洞见，但这是副产品，不是每个循环都必须产出。循环的价值在于系统性地推进研究深度。

### 循环模式

```
     ┌─── S ─── E ─── A ─── R ─── C ─── H ─── R ───┐
     │                                                │
     └──────────────── 迭代 ──────────────────────────┘
```

Reflect 之后回到 Survey，开始下一轮研究。每一轮循环推动研究向更深处发展。

📖 详解：[methodology/search-r-cycle.md](methodology/search-r-cycle.md)

---

## 研究深度

SEARCH-R 定义了 5 个研究深度层次，Agent 聚焦前 3 层：

```
Level 0: 第一性原理    — 问题的本质是什么？为什么？
Level 1: 理论框架      — 如何建模？决策模型是什么？
Level 2: 设计原则      — 应该遵循什么原则？如何权衡？
Level 3: 实现思路      — 如何设计？（执行层）
Level 4: 具体实现      — 代码怎么写？（执行层）
```

| 深度 | 方法 | 示例 |
|------|------|------|
| **Level 0** | 追问"为什么"直到无法再追问 | "为什么要分层记忆？" → "解决上下文有限 vs 知识无限的矛盾" |
| **Level 1** | 构建模型、形式化表达 | "分层记忆如何建模？" → "工作台 + 文件柜 + 图书馆三层模型" |
| **Level 2** | 从理论推导原则 | "分层应遵循什么原则？" → "即时层只放规则、锚点、指针" |
| Level 3-4 | 留给执行层 Agent | 不是 Research Agent 的职责 |

**深度检查**：每次研究后自问——我是否理解了"为什么"？是否建立了理论模型？是否明确了设计原则？

📖 详解：[methodology/research-depth.md](methodology/research-depth.md)

---

## 知识萃取

知识萃取是独立于研究循环的能力，在研究产出后**可选地**执行。

### 三层知识结构

```
Info（信息）→ 事实、数据点、观察记录
  ↓ 整理后
Data（数据）→ 结构化的、可分析的信息
  ↓ 提炼后
Insight（洞见）→ 能改变行动逻辑的发现
```

| 层级 | 特征 | 示例 |
|------|------|------|
| **Info** | 原始事实，来源明确但未加工 | "GPT-4 有 1.8T 参数" |
| **Data** | 经过整理的结构化信息 | "10 个模型的参数量与推理能力对比表" |
| **Insight** | 能改变行动逻辑的发现 | "参数量超过阈值后，推理能力提升来自架构而非规模" |

### 洞见判定：唯一判据

> **能否改变行动逻辑？**

知道这个发现后，你的下一步行动会不同吗？
- **会不同** → Insight，记录行动含义
- **不会不同** → 不是 Insight，降级为 Data 或 Info

**不合格的"洞见"**：
- ❌ 数据点："这个 API 响应时间 200ms"
- ❌ 过程结论："我们决定用方案 A"
- ❌ 工程设计："系统应该用 Redis 做缓存"
- ❌ 通识："AI 正在改变世界"

### 萃取流程

```
研究产出完成 → 判断是否有可提取的知识
  → 无：结束（正常，不是每次都有 Insight）
  → 有：三层分类 → Insight 判定 → 写入洞察索引
       → 检查跨课题关联 → 更新知识图谱
```

**关键原则**：不是每次研究都会产生 Insight。强制从研究中"榨取"洞见是过度设计。

📖 详解：[methodology/knowledge-extraction.md](methodology/knowledge-extraction.md) ｜ [methodology/insight-management.md](methodology/insight-management.md)

---

## 记忆分层架构

AI Agent 面临一个根本矛盾：**上下文窗口有限** vs **知识积累无限**。三层记忆架构解决这个矛盾。

```
                    ┌──────────────────┐
                    │     长期层        │
                    │  (语义检索)       │
                    │  全部历史记录     │
                    └────────┬─────────┘
                             │
                    沉淀 ↓    ↑ 提升
                             │
                    ┌────────┴─────────┐
                    │    近中期层       │
                    │  (索引+条目)      │
                    │  当前活跃信息     │
                    └────────┬─────────┘
                             │
                    精简 ↓    ↑ 加载
                             │
                    ┌────────┴─────────┐
                    │    即时层         │
                    │  (≤5KB)          │
                    │  规则+锚点+指针   │
                    └──────────────────┘
```

| 层级 | 类比 | 容量 | 内容 | 读写规则 |
|------|------|------|------|----------|
| **即时层** | 工作台 | ≤ 5KB | 规则 + 状态锚点 + 指针 | 每次对话自动加载 |
| **近中期层** | 文件柜 | 按需 | 索引 + 条目（项目/决策/待办） | 按需读取，主动更新 |
| **长期层** | 图书馆 | 无限 | 全部历史对话 | 语义检索，按需召回 |

**即时层**只放三样东西：规则（必须遵守的行为准则）、状态锚点（当前状态的关键指针）、指针（指向近中期层和长期层的引用）。详细内容下沉到近中期层，即时层只保留引用。

📖 详解：[methodology/memory-architecture.md](methodology/memory-architecture.md)

---

## 课题管理

### 课题标准目录

每个研究课题遵循统一的目录结构：

```
{课题名}/
├── topic.md              ← 课题定义与元数据（必须有）
├── observations/         ← S阶段：观察记录、实践发现
├── retrievals/           ← E阶段：文献检索、知识整理
├── theory/               ← A阶段：概念模型、设计原则
├── reflections/          ← R阶段：过程反思、方法改进
├── examples/             ← 实践案例、使用示例
└── references/           ← 参考资料（仅存储）
```

**设计原则**：
- **topic.md 是入口**：包含背景、核心问题、当前阶段、状态、关联课题
- **目录映射循环**：目录结构对应 SEARCH-R 的 7 个阶段
- **课题自包含**：每个课题目录包含该课题的全部产物，可独立理解

### 多课题并行管理

Agent 通常同时管理多个研究课题。整体架构分三层：

```
research/
├── 课题总览.md              ← 全局索引（入口）
├── topics/                  ← 课题目录
│   ├── {课题A}/
│   ├── {课题B}/
│   └── {课题N}/
└── knowledge-graph/         ← 知识层（跨课题共享）
    ├── insights_index.md    ← 洞见索引
    └── topic-network-map.md ← 课题网络图
```

| 层级 | 文件 | 职责 |
|------|------|------|
| 索引层 | 课题总览.md | 全量课题入口、状态一览、域映射、统计 |
| 课题层 | topics/{课题名}/ | 每个课题独立研究空间 |
| 知识层 | knowledge-graph/ | 跨课题共享的洞见索引和网络关系图 |

### 并行规则

- **活跃课题 ≤ 2**：同时 active 的课题不超过 2 个，深度优先于广度
- **状态流转**：`active` → `paused` → `completed`，暂停不是放弃，是策略性等待
- **归档不删除**：completed 课题保留目录，仅在总览表中标记

📖 模板：[templates/topic-overview-template.md](agent/v2/templates/topic-overview-template.md)

---

## 课题网络梳理

课题之间不是孤立的。每 1-2 周对全部课题进行一次网络化梳理：

1. **全量扫描**：读取所有课题状态和已产出的 Insight
2. **关系分析**：分析课题之间的连接（直接关联、间接关联、域关联、方法关联）
3. **跨域洞察**：从课题交叉点发现新 Insight——跨域洞察往往比单课题洞察更有价值
4. **健康度评估**：从活跃度、深度、连接度、产出度、方向清晰度五个维度评估
5. **生成网络图**：可视化课题间关系

```
[课题 A] ───补充──→ [课题 B]
   │                   │
   │                   │
   衍生              增强
   │                   │
   ↓                   ↓
[课题 C] ←──方法关联──[课题 D]
```

**梳理时机**：固定周期（每 1-2 周）、重大研究产出后、新课题启动前、课题归档前。

📖 详解：[methodology/topic-network-mapping.md](methodology/topic-network-mapping.md)

---

## 人机协作

### 核心理念

Human 是研究伙伴，不是老板。Agent 自主完成大部分研究工作，Human 只在关键决策点介入。

**目标**：Human 参与时间 / 总研究时间 < 20%

### 关联式思维适配

Human 的思维是网络式的、跳跃的、扩散的。他们不会按照 S→E→A→R→C→H→R 的顺序思考。

Agent 的角色：
1. **接住扩散**：不纠正 Human 的跳跃，而是跟着跳
2. **发现连接**：在跳跃中发现概念之间的隐藏关系
3. **翻译线性**：事后用 SEARCH-R 整理成结构化产出
4. **维护网络**：把发现的连接记录到课题网络图中

> **SEARCH-R 是事后整理工具，不是思考时的真实路径。**

### 质量门控

Agent 每次输出前进行自我评估：

```
研究输出 → 自我评估
├─ 确定性 HIGH + 可接受性 HIGH + 无混淆 → 继续研究
└─ 确定性 LOW 或 可接受性 LOW 或 存在混淆 → 呼叫 Human
```

### Human 介入触发条件

- ✅ 研究方向不明确，需要确认
- ✅ 理论框架需要确认
- ✅ 遇到根本性的冲突
- ✅ 需要外部资源支持
- ✅ 研究成果需要验收
- ❌ 常规检索、标准分析、文档整理——这些 Agent 自主完成

📖 详解：[methodology/human-role.md](methodology/human-role.md)

---

## 仓库结构

```
SEARCH-R/
├── methodology/                    ← 方法论（持续迭代，所有 Agent 版本共享）
│   ├── search-r-cycle.md               7 阶段研究循环
│   ├── research-depth.md               研究深度分层（Level 0-4）
│   ├── human-role.md                   Human 角色定义
│   ├── insight-management.md           三层知识结构与洞见判定
│   ├── memory-architecture.md          记忆架构设计
│   ├── knowledge-extraction.md         知识萃取协议
│   ├── topic-network-mapping.md        课题网络梳理机制
│   └── CHANGELOG.md                    方法论升级记录
│
├── agent/                          ← 智能体定义（按版本归档）
│   ├── v1/                             v1.x 归档
│   └── v2/                             v2.0（当前版本）
│       ├── SOUL.md                         身份定义
│       ├── AGENTS.md                       行为规范 + 课题管理
│       ├── ESSENTIALS.md                   核心概念速查
│       ├── README.md                       模块概览与文件索引
│       ├── skills/                         技能定义
│       └── templates/                      文档模板
│
├── INIT.md                         ← 智能体初始化指南
└── CHANGELOG.md                    ← Agent 版本变更记录
```

**设计决策**：

| 决策 | 原因 |
|------|------|
| 方法论不分版本 | 方法论是活的，持续打磨。每次升级记在 CHANGELOG.md，不做版本快照 |
| Agent 分版本 | Agent 是工程实现，有明确的版本边界。v1 和 v2 是不同的实现规范 |
| 方法论共享 | 所有 Agent 版本基于同一套方法论。方法论升级时，所有版本受益 |

---

## 智能体接入指南

> 想让一个 AI Agent 成为 SEARCH-R 研究智能体？
>
> 📖 **完整的初始化流程（含 5 个 Phase）详见 [INIT.md](INIT.md)**
>
> 以下是概览：

### Step 1：建立身份

阅读 `agent/v2/SOUL.md`，理解 Agent 的身份、核心信念和行为边界。

### Step 2：掌握行为规范

阅读 `agent/v2/AGENTS.md`，理解核心能力体系、课题管理机制和工作流程。

### Step 3：理解方法论

按顺序阅读 `methodology/` 目录下的文件：

| 顺序 | 文件 | 重点 |
|------|------|------|
| 1 | `search-r-cycle.md` | 7 阶段循环的完整流程 |
| 2 | `research-depth.md` | 研究深度 Level 0-4 |
| 3 | `human-role.md` | 人机协作边界 |
| 4 | `insight-management.md` | 三层知识结构 + 洞见判定 |
| 5 | `memory-architecture.md` | 记忆分层策略 |
| 6 | `knowledge-extraction.md` | 知识萃取方法 |
| 7 | `topic-network-mapping.md` | 课题网络梳理 |

### Step 4：加载技能

按需加载 `agent/v2/skills/` 下的技能：

- **knowledge-extraction** — 从研究中萃取知识
- **topic-management** — 管理课题生命周期
- **network-mapping** — 发现跨课题连接

### Step 5：启动研究

1. 创建课题目录和标准子目录
2. 创建 topic.md，填写课题目标和状态
3. 注册到课题总览表
4. 从 SEARCH-R 循环的 S（Survey）阶段开始


---

## 许可

[AGPL v3.0](https://www.gnu.org/licenses/agpl-3.0)

---

<div align="center">

**维护者**: Sonnet.G  
**创建时间**: 2026-03-07  
**最后更新**: 2026-08-14  
**当前 Agent 版本**: v2.0  

**[⬆ 返回顶部](#-search-r-framework)**

</div>
