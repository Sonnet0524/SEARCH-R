# SEARCH-R v2

> 面向长期协作型 AI Agent 的研究方法论框架

---

## 定位

SEARCH-R 是一套研究方法论框架，解决三个问题：

1. **如何系统性推进研究**——SEARCH-R 研究循环
2. **知识往哪存、怎么管**——三层知识体系 + 记忆分层
3. **课题之间怎么联动**——课题网络梳理

---

## 核心模块

### 1. SEARCH-R 研究循环

7 阶段循环：Survey → Explore → Analyze → Review → Confirm → Harvest → Reflect

产出是研究结论。研究过程中可能产生 Insight，但不是每个循环都必须产出。

📖 [search-r-cycle.md](../../methodology/search-r-cycle.md)

### 2. 知识萃取（独立能力）

三层知识结构：Info → Data → Insight

洞见唯一判据：能否改变行动逻辑？

📖 [knowledge-extraction.md](../../methodology/knowledge-extraction.md)

### 3. 记忆分层架构

| 层级 | 容量 | 内容 |
|------|------|------|
| 即时层 | ≤5KB | 规则 + 锚点 + 指针 |
| 近中期层 | 按需 | 索引 + 条目 |
| 长期层 | 无限 | 语义检索 |

📖 [memory-architecture.md](../../methodology/memory-architecture.md)

### 4. 课题网络梳理

每 1-2 周对全部课题进行网络化梳理，发现跨课题连接，提炼跨域洞察。

📖 [topic-network-mapping.md](../../methodology/topic-network-mapping.md)

### 5. 人机协作

Human 的思维是网络式跳跃的，SEARCH-R 是事后整理工具。Agent 的职责是接住扩散、发现连接、翻译成线性文本。

📖 [human-role.md](../../methodology/human-role.md)

---

## 文件索引

```
agent/v2/
├── SOUL.md                            # Agent 身份定义（我是谁、信念、边界）
├── AGENTS.md                          # Agent 核心定义（能力、课题管理、工作流程）
├── ESSENTIALS.md                      # 核心要点速查（一页纸）
├── README.md                          # 本文件：模块概览与文件索引
│
├── skills/                            # 可加载技能
│   ├── README.md                      # 技能库索引
│   ├── knowledge-extraction/SKILL.md  # 知识萃取技能
│   ├── topic-management/SKILL.md      # 课题管理技能
│   └── network-mapping/SKILL.md       # 网络梳理技能
│
└── templates/                         # 文档模板
    ├── insight-template.md            # 洞见记录模板
    ├── topic-overview-template.md     # 课题总览模板
    └── network-map-template.md        # 网络图模板

methodology/（所有版本共享）
├── search-r-cycle.md                  # SEARCH-R 循环详解
├── research-depth.md                  # 研究深度定义
├── human-role.md                      # Human 角色定义
├── insight-management.md              # 洞察管理体系
├── memory-architecture.md             # 记忆分层架构
├── knowledge-extraction.md            # 知识萃取协议
├── topic-network-mapping.md           # 课题网络梳理机制
└── CHANGELOG.md                       # 方法论升级记录
```

---

## 快速上手

1. 阅读 [SOUL.md](SOUL.md) 了解 Agent 身份与信念
2. 阅读 [AGENTS.md](AGENTS.md) 了解核心能力与课题管理
3. 阅读 [ESSENTIALS.md](ESSENTIALS.md) 快速查阅核心概念
4. 参考 [templates/](templates/) 建立课题目录

---

## 设计原则

- **通用性**：不绑定任何特定平台，定义方法论，不是 API
- **实践导向**：每个概念都有"是什么 + 为什么 + 怎么做"
- **渐进式采用**：不需要一次性采用所有模块，可以逐步加入
- **面向长期协作**：Agent 不是一次性工具，是持续进化的研究伙伴
