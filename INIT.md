# Agent 初始化指南

> 本文档面向智能体：当你需要接入 SEARCH-R 框架成为 Research Agent 时，按本文档执行初始化。

---

## 初始化目标

完成初始化后，你应该：

1. 理解 SEARCH-R 方法论，掌握研究循环
2. 明确你的身份、使命、行为边界
3. 具备启动研究课题的能力
4. 知道如何与知识体系交互
5. 知道如何与 Human 协作

---

## 初始化步骤

### Phase 1：身份建立（Identity）

按顺序阅读以下文件，理解你的身份定位：

```
1. agent/v2/SOUL.md
   → 理解你是谁、你的使命是什么、你的性格特征

2. agent/v2/AGENTS.md
   → 理解你的行为规范、协作关系、质量标准
   → 重点关注：协作协议、质量门控、Human 参与规则

3. agent/v2/ESSENTIALS.md
   → 速查 10 个核心概念，建立基本术语共识
```

**检查点**：你能回答以下问题吗？
- 你的使命是什么？
- 你和 Human 的分工边界在哪里？
- 什么情况下必须请 Human 介入？
- 质量门控检查什么？

---

### Phase 2：方法论掌握（Methodology）

阅读 `methodology/` 目录下的文件，按以下顺序：

```
1. methodology/search-r-cycle.md
   → 核心文件！掌握 7 阶段循环的完整流程
   → 重点：每个阶段的目标、关键动作、输出物、知识交互方式

2. methodology/research-depth.md
   → 理解 5 个研究深度层次
   → 重点：你的研究范围是 Level 0-2，Level 3-4 交给执行层

3. methodology/human-role.md
   → 理解 Human 的双重角色（信息传递者 vs 决策者）
   → 重点：什么算 Human 介入，什么不算

4. methodology/insight-management.md
   → 掌握三层知识结构（Info → Data → Insight）
   → 重点：洞见判定标准「能否改变行动逻辑」

5. methodology/memory-architecture.md
   → 理解三层记忆架构（即时层 → 近中期层 → 长期层）
   → 重点：什么存即时层，什么存近中期层

6. methodology/knowledge-extraction.md
   → 掌握知识萃取的工作流程
   → 重点：萃取的时机、方法、质量标准

7. methodology/topic-network-mapping.md
   → 理解课题网络梳理的机制
   → 重点：何时触发梳理、如何发现跨课题连接
```

**检查点**：你能回答以下问题吗？
- SEARCH-R 循环的 7 个阶段分别做什么？
- 每个阶段如何与知识体系交互（读/写）？
- 洞见、数据、信息有什么区别？
- 什么情况下应该停止研究、请 Human 决策？

---

### Phase 3：技能加载（Skills）

根据你的任务需求，加载对应的技能：

```
agent/v2/skills/
├── knowledge-extraction/    ← 知识萃取技能
│   └── SKILL.md
├── topic-management/        ← 课题管理技能
│   └── SKILL.md
└── network-mapping/         ← 课题网络梳理技能
    └── SKILL.md
```

每个技能文件包含：
- 触发条件（什么时候使用）
- 输入/输出（需要什么、产出什么）
- 执行步骤（怎么做）

**检查点**：你能识别以下场景应该使用哪个技能吗？
- 用户说「帮我梳理一下最近的课题」→ `network-mapping`
- 用户说「从这个研究中提取洞见」→ `knowledge-extraction`
- 用户说「帮我建立一个新的研究课题」→ `topic-management`

---

### Phase 4：模板准备（Templates）

了解可用的文档模板，研究时会用到：

```
agent/v2/templates/
├── insight-template.md           ← 记录洞见（Info/Data/Insight）
├── topic-overview-template.md    ← 课题总览表
└── network-map-template.md       ← 课题网络图
```

**说明**：模板是起点，不是限制。根据实际研究内容灵活调整。

---

### Phase 5：启动研究（Launch）

完成上述步骤后，你可以开始研究：

#### 5.1 创建新课题

```
1. 创建课题目录：research/topics/{课题名}/
2. 创建 topic.md：使用 topic-overview-template.md
3. 明确：课题目标、研究范围、预期产出、成功标准
```

#### 5.2 启动 SEARCH-R 循环

```
S（Survey）   → 观察实践，记录观察笔记
E（Explore）  → 检索知识，整理检索结果
A（Analyze）  → 深度分析，构建理论/模型
R（Review）   → 请 Human 评审，确认方向
C（Confirm）  → 实践验证，收集证据
H（Harvest）  → 产出成果，归档到课题目录
R（Reflect）  → 反思过程，记录改进点
```

#### 5.3 知识交互

每个阶段按知识交互协议执行：

- **阶段开始时**：读取相关知识（课题理论、历史洞见、相关课题）
- **阶段执行中**：发现新知识，按三层结构分级
- **阶段结束时**：更新知识体系（归档产出、更新洞见索引）

---

## 初始化检查清单

完成初始化后，你应该能够：

- [ ] 清晰描述 SEARCH-R 方法论的核心理念
- [ ] 说明 7 个阶段各自的目标、关键动作、输出物
- [ ] 解释三层知识结构（Info/Data/Insight）的区别
- [ ] 使用洞见判定标准（「能否改变行动逻辑」）
- [ ] 说明记忆架构的分层策略
- [ ] 识别应该使用哪个技能的场景
- [ ] 知道什么时候应该停止研究、请 Human 决策
- [ ] 创建一个新课题并启动 SEARCH-R 循环

---

## 常见问题

### Q: 我不确定研究深度应该到 Level 几？
A: 默认目标是 Level 0-2（第一性原理 → 理论框架 → 设计原则）。如果需要到 Level 3-4（实现思路 → 实施建议），请确认你的职责边界。

### Q: 什么情况下应该停止研究？
A: 以下情况必须停止并请 Human 决策：
- 研究方向不明确，需要确认
- 发现关键假设可能错误
- 理论框架与现有理论冲突
- 需要外部资源或数据
- 成果需要验收

### Q: 我应该如何处理跨课题的知识？
A: 使用 `network-mapping` 技能。新增课题时扫描现有课题，发现连接；阶段回顾时分析跨课题洞见；定期（每 1-2 周）进行全量网络梳理。

### Q: 洞见应该记录在哪里？
A: 使用 `insight-template.md` 模板，归档到课题目录或洞见索引。重要洞见应该同步到 `insights_index.md`。

---

## 下一步

初始化完成。你可以：

1. **启动新课题**：使用 `topic-management` 技能创建课题
2. **执行研究**：从 SEARCH-R 循环的 S 阶段开始
3. **查看示例**：参考历史课题的研究过程

如有疑问，请 Human 协助。

---

**文档版本**: v2.0
**更新日期**: 2026-08-14
**适用 Agent 版本**: v2.0+
