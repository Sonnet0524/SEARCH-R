# Harness Engineering Research - 独立仓库创建指南

> 本文档提供创建 Harness Engineering 独立研究仓库的完整方案

---

## 📁 仓库结构

```
harness-engineering-research/
│
├── README.md                          # 项目说明
│   └── 明确标注：使用SEARCH-R方法论
│
├── research/                          # 研究过程
│   ├── topic.md                       # 研究课题定义
│   ├── session-log.md                 # 会话日志
│   │
│   ├── observations/                  # 观察笔记
│   │   └── 2026-03-09-harness-practice.md
│   │
│   ├── retrievals/                    # 检索报告
│   │   └── 2026-03-09-lm-eval-harness.md
│   │
│   ├── theory/                        # 理论文档
│   │   ├── 2026-03-09-evaluation-essence.md
│   │   ├── 2026-03-09-benchmark-design.md
│   │   └── 2026-03-09-evaluation-framework.md
│   │
│   └── reflections/                   # 反思笔记
│       └── 2026-03-09-methodology-review.md
│
├── output/                            # 研究产出
│   ├── harness-framework/             # 评估框架
│   │   ├── README.md
│   │   ├── evaluation-principles.md
│   │   └── benchmark-guide.md
│   │
│   └── best-practices/                # 最佳实践
│       └── evaluation-workflow.md
│
├── templates/                         # 从SEARCH-R复制
│   ├── observation-template.md
│   ├── retrieval-template.md
│   └── theory-template.md
│
└── references/                        # 参考资料
    ├── academic-papers.md
    └── technical-docs.md
```

---

## 📄 README.md 模板

```markdown
# 🔍 Harness Engineering Research

**使用 [SEARCH-R方法论](https://github.com/Sonnet0524/SEARCH-R) 进行研究**

## 项目定位

本项目使用SEARCH-R方法论，系统化地研究Harness Engineering（评估方法论）。

## 研究问题

- 评估方法论的本质是什么？
- 为什么需要标准化评估？
- 如何构建可复用的评估框架？

## 研究方法

本项目使用SEARCH-R方法论进行研究：
- S - Survey：观察现有评估实践
- E - Explore：检索评估相关知识
- A - Analyze：构建评估理论框架
- R - Review：Human参与评审
- C - Confirm：实践验证
- H - Harvest：沉淀研究成果
- R - Reflect：持续迭代优化

## 产出目标

- 评估方法论理论框架
- 标准化评估设计原则
- 评估最佳实践指南

## 与SEARCH-R的关系

- **方法论来源**：使用SEARCH-R方法论
- **研究性质**：独立研究课题
- **服务范围**：可服务于多个项目

## 许可

MIT License
```

---

## 📄 research/topic.md 模板

```markdown
---
topic: Harness Engineering方法论研究
created: 2026-03-09
status: active
priority: high
uses_methodology: SEARCH-R
---

# Harness Engineering方法论研究

## 📋 研究背景

随着LLM的发展，评估AI系统的能力成为关键问题。如何系统化、标准化地进行评估，是当前面临的挑战。

**背景描述**：
- LLM能力越来越强，需要有效的评估方法
- 现有评估方法缺乏标准化
- 评估结果难以比较和复现

**研究动机**：
- 理解评估方法论的本质
- 建立标准化评估框架
- 提供可复用的评估体系

## 🎯 研究目标

建立完整的Harness Engineering方法论体系，包括评估理论、框架设计、最佳实践等。

### 核心问题

1. **评估方法论的本质是什么？**
   - 为什么重要：理解本质才能设计有效方法
   - 期望答案：评估的理论基础

2. **为什么需要标准化评估？**
   - 为什么重要：标准化是复用的前提
   - 期望答案：标准化的必要性和原则

3. **如何构建可复用的评估框架？**
   - 为什么重要：框架需要服务于多种场景
   - 期望答案：框架设计原则和方法

### 期望产出

- [ ] **评估方法论理论框架**：评估的本质和理论基础
- [ ] **标准化评估设计原则**：如何设计标准化评估
- [ ] **评估最佳实践指南**：实践中的经验和建议

## 🏗️ 研究范围

### 包含的内容

- 评估方法论的本质研究
- 标准化评估的理论基础
- 评估框架设计原则
- 评估最佳实践提炼

### 不包含的内容

- 具体评估工具的开发（这是实践层）
- 具体模型的评估实施（这是应用层）

### 研究边界

- **深度目标**：Level 0-2（理论到设计原则）
- **时间预期**：3-6个月
- **方法论**：SEARCH-R

## 📊 研究计划

### Phase 1: Survey - 观察现有评估实践

**任务**：
1. 观察lm-evaluation-harness的使用
2. 分析现有评估框架的特点
3. 发现评估中的问题

**产出**：
- 观察笔记
- 问题清单

### Phase 2: Explore - 检索相关知识

**任务**：
1. 检索评估方法论文献
2. 学习评估框架设计
3. 收集最佳实践案例

**产出**：
- 文献综述
- 案例分析

### Phase 3: Analyze - 构建理论框架

**任务**：
1. 构建评估方法论理论
2. 定义标准化评估原则
3. 设计评估框架

**产出**：
- 理论文档
- 框架设计

### Phase 4: Review - Human参与评审

**任务**：
1. 提交理论框架评审
2. 讨论设计原则
3. 确认研究方向

**产出**：
- 评审记录
- 改进建议

### Phase 5: Confirm - 实践验证

**任务**：
1. 在实际项目中验证
2. 收集反馈
3. 优化框架

**产出**：
- 验证报告
- 优化方案

### Phase 6: Harvest - 沉淀成果

**任务**：
1. 整理研究成果
2. 编写最佳实践
3. 发布框架

**产出**：
- 完整的方法论体系
- 最佳实践指南

### Phase 7: Reflect - 持续迭代

**任务**：
1. 反思研究过程
2. 优化方法论
3. 规划后续研究

**产出**：
- 反思笔记
- 迭代计划
```

---

## 🚀 创建步骤

### 1. 创建仓库

```bash
# 在GitHub创建新仓库
# 仓库名：harness-engineering-research
# 描述：使用SEARCH-R方法论研究Harness Engineering

# 克隆到本地
git clone https://github.com/[your-username]/harness-engineering-research.git
cd harness-engineering-research
```

### 2. 创建目录结构

```bash
# 创建目录
mkdir -p research/{observations,retrievals,theory,reflections}
mkdir -p output/{harness-framework,best-practices}
mkdir -p templates
mkdir -p references

# 创建文件
touch README.md
touch research/topic.md
touch research/session-log.md
```

### 3. 复制SEARCH-R模板

```bash
# 从SEARCH-R项目复制模板
cp [SEARCH-R路径]/templates/* templates/
```

### 4. 初始化课题

```bash
# 使用上面的模板内容
# - 填充 README.md
# - 填充 research/topic.md
```

### 5. 开始研究

```bash
# 开始SEARCH-R循环
# 从Survey阶段开始

# 创建第一个观察笔记
touch research/observations/2026-03-09-harness-practice.md
```

---

## 🔗 与SEARCH-R的关系

### 方法论使用

```markdown
本项目使用SEARCH-R方法论进行研究：

1. 研究方法：遵循SEARCH-R循环
2. 研究深度：追求Level 0-2
3. 文档标准：使用SEARCH-R模板
4. 质量保证：使用质量门控机制
```

### 成果回馈

```markdown
研究成果可以回馈到SEARCH-R：

1. 方法论验证：验证SEARCH-R方法论的有效性
2. 最佳实践：为其他研究课题提供参考
3. 模板改进：优化研究模板
```

---

## 📝 注意事项

### 重要提醒

1. **明确方法论来源**
   - 在README中明确标注使用SEARCH-R
   - 在研究中遵循SEARCH-R方法论

2. **保持课题独立**
   - 这是独立的研究课题
   - 不是SEARCH-R项目的子课题

3. **正确的研究深度**
   - 专注于Level 0-2（理论到设计原则）
   - 不深入Level 3-4（具体实现）

4. **文档化研究过程**
   - 记录所有研究过程
   - 使用标准模板
   - 保持可追溯性

---

## ✅ 检查清单

创建仓库前，确认：

- [ ] 已理解SEARCH-R方法论
- [ ] 已明确研究课题边界
- [ ] 已准备好使用SEARCH-R进行研究
- [ ] 已创建目录结构
- [ ] 已复制模板文件
- [ ] 已初始化课题定义

---

**创建者**: Research Agent (SEARCH-R)  
**创建时间**: 2026-03-09  
**用途**: 提供Harness Engineering独立研究仓库创建指南
