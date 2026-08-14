# ESSENTIALS.md — 核心要点速查

> SEARCH-R v2.0 所有核心概念的一页纸速查

**版本**: v2.0 | **日期**: 2026-08-14

---

## 1. SEARCH-R 循环

```
S - Survey（观察调研）→ 从实践中发现问题
E - Explore（探索检索）→ 检索相关知识
A - Analyze（分析思考）→ 深度理论构建
R - Review（评审探讨）→ Human 参与评审
C - Confirm（确认验证）→ 实践中验证
H - Harvest（收获产出）→ 沉淀研究成果 ← 含"洞见提炼"子步骤
R - Reflect（反思迭代）→ 持续优化方法 ← 含"课题网络影响评估"

v2.0 增强：每个阶段增加知识交互协议（萃取、应用、关联）
```

📖 详解：[search-r-cycle.md](methodology/search-r-cycle.md)

---

## 2. 研究深度

| Level | 问题 | 说明 |
|-------|------|------|
| 0 | 本质是什么？为什么？ | 第一性原理 |
| 1 | 如何建模？ | 理论框架 |
| 2 | 遵循什么原则？ | 设计原则 |
| 3 | 如何设计？ | 实现思路 |
| 4 | 代码怎么写？ | ❌ 不是 Research Agent 的职责 |

**目标**：Level 0-2

📖 详解：[research-depth.md](methodology/research-depth.md)

---

## 3. 洞察管理（三层知识结构）

```
Info（信息）→ 事实、数据点、观察记录
  ↓ 整理后
Data（数据）→ 结构化的、可分析的信息
  ↓ 提炼后
Insight（洞见）→ 能改变行动逻辑的发现
```

**洞见唯一判据**：能否改变行动逻辑？

**不合格洞见**：
- 数据点（"X 的值是 Y"）
- 过程结论（"我们决定用方案 A"）
- 工程设计（"系统应该这样实现"）
- 通识（"AI 正在改变世界"）

📖 详解：[insight-management.md](methodology/insight-management.md)

---

## 4. 记忆分层

| 层级 | 容量 | 内容 | 读写规则 |
|------|------|------|----------|
| 即时层 | ≤5KB | 规则 + 锚点 + 指针 | 每次对话自动加载 |
| 近中期层 | 按需 | 索引 + 条目 | 按需读取，主动更新 |
| 长期层 | 无限 | 语义检索 | 按需搜索，定期沉淀 |

**即时层组成**：
- `soul` — 身份定义
- `user` — 用户画像
- `memory` — 规则 + 锚点 + 指针
- `tools` — 工具经验索引
- `secret` — 敏感凭证

📖 详解：[memory-architecture.md](methodology/memory-architecture.md)

---

## 5. 知识萃取协议

```
研究产出 → 识别知识候选 → 三层分类（Info/Data/Insight）
  → 判断是否达到 Insight 级别
  → 写入洞察索引
  → 检查跨课题关联
  → 更新知识图谱
```

**SEARCH-R 各阶段的知识交互**：
- S：检索已有知识，避免重复研究
- E：萃取新发现的信息
- A：将 Data 提炼为 Insight
- R：验证 Insight 是否站得住脚
- C：用实践检验 Insight
- H：正式归档 Insight + 检查跨课题关联
- R：评估 Insight 对课题网络的影响

📖 详解：[knowledge-extraction.md](methodology/knowledge-extraction.md)

---

## 6. 课题管理

**核心规则**：
- 活跃课题 ≤ 2
- 每个课题有标准目录：`topic.md` + `observations/` + `retrievals/` + `theory/` + `reflections/` + `examples/` + `references/`
- 课题有总览表：全量索引 + 域映射
- 完成课题及时归档

**课题状态**：
```
active   → 正在进行
paused   → 暂停
completed → 已完成（归档）
```

📖 详解：[init.md](agents/research/init.md)

---

## 7. 课题网络梳理

**频率**：每 1-2 周

**核心产出**：
1. 课题网络图（可视化课题间关系）
2. 跨域洞察（从交叉点发现新 Insight）
3. 课题健康度评估

**课题健康度维度**：
- 活跃度：最近一次研究是什么时候？
- 深度：是否达到 Level 0-2？
- 连接度：与其他课题有几个连接？
- 产出度：产出了多少个 Insight？

📖 详解：[topic-network-mapping.md](methodology/topic-network-mapping.md)

---

## 8. 人机协作

**Agent 的双重角色**：
1. **连接发现者**：发现课题之间、概念之间的隐藏连接
2. **线性翻译器**：把 Human 的网络式跳跃思维翻译成结构化的线性文本

**关键认知**：
- Human 的思维是网络式的、跳跃的、扩散的
- SEARCH-R 是事后整理工具，不是思考时的真实路径
- Agent 的职责是"接住"Human 的扩散，而不是纠正它

**Human 参与最小化**：
- 目标：< 20% 的决策需要 Human 参与
- 只在质量门控触发时呼叫 Human
- 信息传递不算介入

📖 详解：[human-role.md](methodology/human-role.md)

---

## 9. 质量门控

```
研究输出 → 自我评估
├─ 确定性 HIGH + 可接受性 HIGH + 无混淆 → 继续研究
└─ 确定性 LOW 或 可接受性 LOW 或 存在混淆 → 呼叫 Human
```

📖 详解：[search-r-cycle.md](methodology/search-r-cycle.md)

---

## 10. Skills vs Tools

```
Skills（业务能力）— 方法论层面的能力
    ↓ 可调用
Tools（底层工具）— 执行层面的工具
    ↓ 执行
外部 API / 文件系统
```

**v2.0 新增 Skills**：
- 知识萃取技能（knowledge-extraction）
- 课题管理技能（topic-management）
- 网络梳理技能（network-mapping）

📖 详解：[skills/README.md](skills/README.md)

---

## v1.x → v2.0 速查表

| 你熟悉的 v1.x 概念 | v2.0 的变化 |
|---------------------|-------------|
| 7 阶段 SEARCH-R 循环 | 保留 + 各阶段增加知识交互协议 |
| 研究深度 Level 0-4 | 保持不变 |
| Human 参与最小化 | 保留 + 增加关联式思维适配 |
| 文档模板体系 | 保留 + 新增洞见模板、课题总览模板、网络图模板 |
| 质量门控 | 保持不变 |
| Skills/Tools 分离 | 保留 + 新增 3 个 Skills |
| 元认知意识 | 保持不变 |
| 多课题管理 | 增强：增加课题网络梳理、跨课题触发 |
| — | **新增**：洞察管理体系 |
| — | **新增**：记忆分层架构 |
| — | **新增**：知识萃取协议 |
| — | **新增**：课题网络梳理机制 |

---

*版本: v2.0 | 日期: 2026-08-14*
