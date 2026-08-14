---
name: literature-review
description: 系统化检索和分析文献。当用户要求"检索文献"、"调研现有研究"、"文献综述"、"了解研究现状"时触发。
trigger: on_demand
tags: 文献检索, 研究, 综述, 知识图谱
---

# Literature Review Skill

系统化检索、分析和整理文献，为研究提供知识基础。

## Execution Flow

1. 明确检索目标（关键词、范围、时间）
2. 多渠道检索（学术库、技术文档、案例）
3. 筛选评估（相关性、质量）
4. 整理归纳（索引、观点、图谱）

## Capabilities

### ✅ Can Do
- 关键词检索和扩展
- 文献质量评估
- 观点提取和对比
- 知识图谱构建

### ❌ Cannot Do
- 访问付费全文（需要订阅）
- 替代专业数据库检索
- 自动判断研究创新性

## Usage Patterns

### Pattern 1: 领域调研
```
User: "调研大语言模型的研究现状"

→ 确定关键词: LLM, Large Language Model, GPT, Transformer
→ 检索渠道: arXiv, Google Scholar, 官方博客
→ 筛选标准: 近3年, 高引用, 顶会
→ 输出: 研究现状综述
```

### Pattern 2: 技术方案对比
```
User: "对比不同的Agent架构方案"

→ 检索: Agent架构, Multi-Agent, ReAct, Chain-of-Thought
→ 对比维度: 架构模式、适用场景、优缺点
→ 输出: 对比分析表
```

### Pattern 3: 知识图谱构建
```
User: "建立这个领域的知识图谱"

→ 提取核心概念和关系
→ 建立概念层次结构
→ 标注关键文献来源
→ 输出: 知识图谱文档
```

## Output Format

```markdown
# 文献综述：[研究主题]

## 一、检索策略
- 关键词: ...
- 数据库: ...
- 时间范围: ...

## 二、文献概览
- 检索结果: X篇
- 筛选后: Y篇
- 核心文献: Z篇

## 三、主题分析

### 主题1: ...
### 主题2: ...

## 四、研究趋势
...

## 五、参考文献
...
```

## Quality Criteria

| 维度 | 高质量标准 |
|------|-----------|
| 全面性 | 覆盖主要研究流派 |
| 时效性 | 包含最新研究进展 |
| 权威性 | 引用高质量来源 |
| 结构性 | 清晰的分类体系 |

## Related Skills & Tools

### Related Skills
- **observation**: 基于观察发现研究问题
- **theory-building**: 基于文献构建理论
- **quality-gate**: 评估文献质量

### Related Tools
- **baidu-scholar-search**: 学术文献检索（推荐）
- **baidu-search**: 网络信息搜索
- **baidu-baike-data**: 概念定义查询
- **file-reading**: 解析文献文件（建设中）

## References

- `references/search-strategies.md` - 检索策略
- `references/evaluation-methods.md` - 评估方法
