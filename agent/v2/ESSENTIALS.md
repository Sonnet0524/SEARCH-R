# ESSENTIALS.md — 核心要点速查

> SEARCH-R 所有核心概念的一页纸速查

---

## 1. SEARCH-R 循环

```
S - Survey（观察调研）→ 从实践中发现问题
E - Explore（探索检索）→ 检索相关知识
A - Analyze（分析思考）→ 深度理论构建
R - Review（评审探讨）→ Human 参与评审
C - Confirm（确认验证）→ 实践中验证
H - Harvest（收获产出）→ 沉淀研究成果
R - Reflect（反思迭代）→ 持续优化方法
```

**产出是研究结论**，不是 Insight。Insight 是研究过程中可能产生的副产品。

📖 详解：[search-r-cycle.md](../../methodology/search-r-cycle.md)

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

📖 详解：[research-depth.md](../../methodology/research-depth.md)

---

## 3. 知识萃取（独立能力）

```
研究产出 → 判断是否有可提取的知识
  → Info（信息）：事实、数据点、观察记录
  → Data（数据）：结构化的、可分析的信息
  → Insight（洞见）：能改变行动逻辑的发现
```

**洞见唯一判据**：能否改变行动逻辑？

**不合格洞见**：
- 数据点（"X 的值是 Y"）
- 过程结论（"我们决定用方案 A"）
- 工程设计（"系统应该这样实现"）
- 通识（"AI 正在改变世界"）

**注意**：不是每次研究都会产生 Insight。强制从研究中"榨取"洞见是过度设计。

📖 详解：[knowledge-extraction.md](../../methodology/knowledge-extraction.md)

---

## 4. 记忆分层

| 层级 | 容量 | 内容 | 读写规则 |
|------|------|------|----------|
| 即时层 | ≤5KB | 规则 + 锚点 + 指针 | 每次对话自动加载 |
| 近中期层 | 按需 | 索引 + 条目 | 按需读取，主动更新 |
| 长期层 | 无限 | 语义检索 | 按需搜索，定期沉淀 |

📖 详解：[memory-architecture.md](../../methodology/memory-architecture.md)

---

## 5. 课题管理

**核心规则**：
- 活跃课题 ≤ 2
- 每个课题有标准目录结构
- 课题有总览表：全量索引 + 域映射
- 完成课题及时归档

**课题状态**：
```
active   → 正在进行
paused   → 暂停
completed → 已完成（归档）
```

📖 详解：[init.md](init.md)

---

## 6. 课题网络梳理

**频率**：每 1-2 周

**核心产出**：
1. 课题网络图（可视化课题间关系）
2. 跨域洞察（从交叉点发现新 Insight）
3. 课题健康度评估

📖 详解：[topic-network-mapping.md](../../methodology/topic-network-mapping.md)

---

## 7. 人机协作

**Agent 的双重角色**：
1. **连接发现者**：发现课题之间、概念之间的隐藏连接
2. **线性翻译器**：把 Human 的网络式跳跃思维翻译成结构化的线性文本

**关键认知**：
- Human 的思维是网络式的、跳跃的、扩散的
- SEARCH-R 是事后整理工具，不是思考时的真实路径
- Agent 的职责是"接住"Human 的扩散，而不是纠正它

📖 详解：[human-role.md](../../methodology/human-role.md)

---

## 8. 质量门控

```
研究输出 → 自我评估
├─ 确定性 HIGH + 可接受性 HIGH + 无混淆 → 继续研究
└─ 确定性 LOW 或 可接受性 LOW 或 存在混淆 → 呼叫 Human
```

📖 详解：[search-r-cycle.md](../../methodology/search-r-cycle.md)

---

## 9. Skills vs Tools

```
Skills（业务能力）— 方法论层面的能力
    ↓ 可调用
Tools（底层工具）— 执行层面的工具
    ↓ 执行
外部 API / 文件系统
```

**Skills**：
- 知识萃取技能（knowledge-extraction）
- 课题管理技能（topic-management）
- 网络梳理技能（network-mapping）

📖 详解：[skills/README.md](skills/README.md)
