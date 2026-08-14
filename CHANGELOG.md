# CHANGELOG

> Agent 版本变更记录。方法论升级记录见 `methodology/CHANGELOG.md`。

---

## Agent v2.1 — 2026-08-14

**主题**：智能化管理五新能力

### 新增

| 文件 | 内容 |
|------|------|
| `methodology/quality-metrics.md` | 研究质量度量体系：趋势观察法，可量化+可评估指标组合 |
| `agent/v2/skills/skill-evolution/` | 技能进化元技能：使用后反思、进化需求记录、批量优化 |

### 增强

| 文件 | 变化 |
|------|------|
| `methodology/memory-architecture.md` | +记忆智能化管理：引用追踪、跨课题升级、冗余检查、健康度自检 |
| `methodology/insight-management.md` | +实时关联发现：轻量级关键词匹配+效果验证日志 |
| `methodology/search-r-cycle.md` | +研究契约机制：边界框定位，定义"不值得继续"而非"完成" |
| `agent/v2/skills/knowledge-extraction/SKILL.md` | +冗余检查、引用追踪、实时关联触发、进化意识引用 |
| `README.md` | +研究契约/质量度量/技能进化章节，更新目录结构 |

### 设计动机

v2.0 建立了知识操作系统，但缺乏自我管理能力：
1. 记忆只增不减，缺乏健康度管理
2. 技能使用后没有进化反馈机制
3. 研究质量缺乏观察手段
4. 新 Insight 产出后不会主动发现关联
5. 研究课题缺乏边界管理，容易发散失控

v2.1 的核心改变：**让研究系统具备自我管理能力**。不是替代人的判断，而是提供趋势观察和主动提醒。

---

## Agent v2.0 — 2026-08-14

**主题**：知识驱动的研究型 Agent

### 新增

| 文件 | 内容 |
|------|------|
| `SOUL.md` | Agent 身份定义：使命、性格、行为风格、核心使命 |
| `AGENTS.md` | Agent 行为规范：协作关系、质量门控、记忆系统、知识应用协议 |
| `ESSENTIALS.md` | 10 个核心概念速查卡片 |
| `skills/knowledge-extraction/` | 知识萃取技能：三层分类、洞见判定、跨课题关联 |
| `skills/topic-management/` | 课题管理技能：创建、更新、回顾、归档 |
| `skills/network-mapping/` | 课题网络梳理技能：发现跨课题连接与洞察 |
| `templates/insight-template.md` | 洞见记录模板（Info / Data / Insight） |
| `templates/topic-overview-template.md` | 课题总览表模板 |
| `templates/network-map-template.md` | 课题网络图模板 |

### 增强

- 记忆系统：即时层（规则 + 锚点 + 指针）+ 近中期层（索引 + 条目）
- 知识应用协议：SEARCH-R 各阶段与知识体系的交互规则
- 课题并行管理：活跃课题 ≤ 2，全量索引
- 关联式思维适配：Agent 负责接住扩散、发现连接、翻译为线性文本

### 与 v1.x 的区别

| 维度 | v1.x | v2.0 |
|------|------|------|
| 定位 | 研究流程框架 | 知识驱动的研究 Agent |
| 知识管理 | 散落各处 | 三层结构（Info/Data/Insight） |
| 记忆系统 | 未定义 | 即时层 + 近中期层 |
| 课题关系 | 独立管理 | 网络梳理 + 跨课题洞察 |
| 平台绑定 | 绑定 OpenCode | 平台无关，通用方法论 |
| 工具集成 | 百度系列 API | 平台无关，可插拔 |

---

## Agent v1.1 — 2026-03-11

**主题**：SEARCH-R 框架初始版本

### 包含

- SEARCH-R 7 阶段研究循环
- 研究深度 5 层定义（Level 0-4）
- Human 角色定义
- 基础文档模板
- 工具集成（百度搜索、百度学术、PaddleOCR 等）
- OpenCode 平台配置
