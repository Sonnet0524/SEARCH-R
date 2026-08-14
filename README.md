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

SEARCH-R 是一套面向 AI Agent 的**研究方法论框架**，包含两个核心部分：

1. **方法论（methodology/）**：研究循环、深度分层、知识管理、记忆架构 — 定义「怎么研究」
2. **智能体定义（agent/）**：身份、行为规范、技能、模板 — 定义「怎么构建 Agent」

方法论独立于任何 AI 平台，不绑定特定服务；智能体定义提供可直接使用的工程规范。

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
│       ├── AGENTS.md                       行为规范 + 协作关系
│       ├── ESSENTIALS.md                   核心概念速查
│       ├── skills/                         技能定义
│       └── templates/                      文档模板
│
├── INIT.md                         ← 智能体初始化指南（重要！）
└── CHANGELOG.md                    ← Agent 版本变更记录
```

---

## 🚀 快速开始：智能体接入指南

> 你正在构建一个 Research Agent？按以下步骤接入 SEARCH-R。

### Step 1：阅读核心定义

按顺序阅读 `agent/v2/` 下的文件：

| 顺序 | 文件 | 作用 |
|------|------|------|
| 1 | `SOUL.md` | 理解 Agent 的身份、使命、性格 |
| 2 | `AGENTS.md` | 行为规范、协作关系、质量门控 |
| 3 | `ESSENTIALS.md` | 速查 10 个核心概念 |

### Step 2：掌握方法论

阅读 `methodology/` 下的文件：

| 顺序 | 文件 | 作用 |
|------|------|------|
| 1 | `search-r-cycle.md` | 核心：7 阶段研究循环 |
| 2 | `research-depth.md` | 研究深度：Level 0-4 |
| 3 | `human-role.md` | 人机协作边界 |
| 4 | `insight-management.md` | 知识三层结构 + 洞见判定 |
| 5 | `memory-architecture.md` | 记忆系统分层 |
| 6 | `knowledge-extraction.md` | 知识萃取方法 |
| 7 | `topic-network-mapping.md` | 课题网络梳理 |

### Step 3：加载技能

按需加载 `agent/v2/skills/` 下的技能：

- `knowledge-extraction/` — 知识萃取
- `topic-management/` — 课题管理
- `network-mapping/` — 课题网络梳理

### Step 4：启动研究

1. 创建课题目录
2. 从 SEARCH-R 循环的 S（Survey）阶段开始
3. 研究产出后，可选地执行知识萃取
4. 产出归档到课题目录

**完整的初始化流程详见 [INIT.md](INIT.md)**

---

## 方法论核心概览

### SEARCH-R 循环

```
S → Survey（观察调研）    — 观察实践，发现问题
E → Explore（探索检索）   — 检索知识，收集信息
A → Analyze（分析思考）   — 深度分析，构建理论
R → Review（评审探讨）    — Human 评审，方向确认
C → Confirm（确认验证）   — 实践验证，收集证据
H → Harvest（收获产出）   — 沉淀成果，知识固化
R → Reflect（反思迭代）   — 反思迭代，持续改进
```

### 研究深度

```
Level 0: 第一性原理    — 问题的本质是什么？
Level 1: 理论框架      — 如何建模？
Level 2: 设计原则      — 应该遵循什么原则？
Level 3: 实现思路      — 如何设计？（执行层）
Level 4: 实施建议      — 代码怎么写？（执行层）
```

Research Agent 聚焦 Level 0-2，Level 3-4 交给执行层。

### 知识体系

| 模块 | 说明 |
|------|------|
| 三层知识结构 | Info → Data → Insight，统一知识分级 |
| 洞见判定标准 | 「能否改变行动逻辑」 |
| 知识萃取 | 独立于研究循环的知识整理能力 |
| 记忆架构 | 即时层 + 近中期层 + 长期层 |
| 课题网络梳理 | 发现跨课题连接与跨域洞察 |

---

## 版本历史

| 版本 | 日期 | 主题 | 说明 |
|------|------|------|------|
| **Agent v2.0** | 2026-08-14 | 知识驱动 | 增加知识管理、记忆架构、课题网络梳理 |
| Agent v1.1 | 2026-03-11 | 初始版本 | 基础 SEARCH-R 循环 + 工具集成 |

详细记录见 [CHANGELOG.md](CHANGELOG.md)（Agent）和 [methodology/CHANGELOG.md](methodology/CHANGELOG.md)（方法论）

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
