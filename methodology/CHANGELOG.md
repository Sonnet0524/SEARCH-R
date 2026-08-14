# 方法论升级记录

> 方法论持续迭代，记录每次升级的核心变化。

---

## 2026-08-14 — v2.1 智能化管理升级

**主题**：为研究系统注入自我管理能力

### 新增

| 文件 | 内容 |
|------|------|
| [quality-metrics.md](quality-metrics.md) | 研究质量度量体系：趋势观察法，Insight产出/引用密度/跨课题连接/僵尸条目等指标 |

### 调整

| 文件 | 变化 |
|------|------|
| [memory-architecture.md](memory-architecture.md) | +§5 记忆智能化管理：引用追踪、跨课题升级、冗余检查、健康度自检 |
| [insight-management.md](insight-management.md) | +§5 实时关联发现：新增Insight时轻量匹配课题索引+效果验证日志 |
| [search-r-cycle.md](search-r-cycle.md) | +§5 研究契约机制：边界框定位，暂停条件，灵活修订 |

### 设计动机

v2.0 解决了知识操作系统的问题，但系统缺乏自我管理能力。记忆只增不减、技能用了不优化、质量看不到趋势、新发现不主动找关联、研究没有边界。

v2.1 的五个能力都是**轻量级、可验证、可回退**的：
- 记忆管理：引用追踪用文本标记，不引入数据库
- 研究契约：边界框不是完成标准，适合随意推进的研究
- 质量度量：趋势观察不追求精确量化
- 关联发现：轻量匹配~10-20秒，不做全量扫描
- 技能进化：反思记录，积累后批量优化

---


## 2026-08-14 — v2.0 知识体系升级

**主题**：从「流程框架」升级为「知识操作系统」

### 新增

| 文件 | 内容 |
|------|------|
| [insight-management.md](insight-management.md) | 三层知识结构（Info → Data → Insight），洞见判定标准「能否改变行动逻辑」，跨课题关联机制 |
| [memory-architecture.md](memory-architecture.md) | 三层记忆架构（即时层 / 近中期层 / 长期层），容量管理策略 |
| [knowledge-extraction.md](knowledge-extraction.md) | 独立于研究循环的知识萃取协议：触发时机、萃取方法、质量标准 |
| [topic-network-mapping.md](topic-network-mapping.md) | 课题网络梳理机制：触发条件、梳理流程、跨课题洞察发现 |

### 调整

| 文件 | 变化 |
|------|------|
| [search-r-cycle.md](search-r-cycle.md) | 明确产出是研究结论而非 Insight；知识萃取定位为独立能力，可选配合 |
| [human-role.md](human-role.md) | 增加关联式思维适配：Agent 负责接住扩散、发现连接、翻译为线性文本 |
| [research-depth.md](research-depth.md) | 无变化 |

### 设计动机

v1.x 解决了「研究流程」的问题——先做什么、后做什么。但在长期实践中发现：

1. 知识散落各处，缺乏统一分级和管理
2. 课题之间缺乏连接，无法发现跨课题洞察
3. 长期协作缺乏记忆管理，上下文容易丢失
4. 研究循环与知识体系是分离的，知识没有被充分利用

v2.0 的核心改变：**让研究循环与知识体系解耦但可协作**。研究循环专注推进研究深度，知识萃取作为独立能力在产出后可选执行。

---

## 2026-03-08 — v1.x 基线建立

**主题**：SEARCH-R 方法论基础框架

### 包含

| 文件 | 内容 |
|------|------|
| [search-r-cycle.md](search-r-cycle.md) | 7 阶段研究循环（S-E-A-R-C-H-R） |
| [research-depth.md](research-depth.md) | 5 层研究深度（Level 0-4） |
| [human-role.md](human-role.md) | Human 角色定义（信息传递者 vs 决策者） |

### 核心理念

- Research Agent 聚焦 Level 0-2（第一性原理 → 理论框架 → 设计原则）
- Human 时间占比 < 20%
- 研究 ≠ 写报告，研究是循环迭代的探索过程
