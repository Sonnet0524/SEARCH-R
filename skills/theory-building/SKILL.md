---
name: theory-building
description: 构建和验证理论框架。当用户要求"构建理论"、"建立模型"、"提出假设"、"理论分析"时触发。
trigger: on_demand
tags: 理论构建, 模型, 假设, 验证
---

# Theory Building Skill

构建理论框架，提出假设，验证理论有效性。

## Execution Flow

1. 明确理论范围和边界
2. 定义核心概念和关系
3. 提出核心命题/假设
4. 寻找支持证据
5. 验证理论一致性
6. 明确适用边界

## Capabilities

### ✅ Can Do
- 概念定义和关系建模
- 命题推导和论证
- 理论框架构建
- 一致性检验

### ❌ Cannot Do
- 替代实证研究
- 保证理论绝对正确
- 自动发现创新理论

## Usage Patterns

### Pattern 1: 理论构建
```
User: "构建一个Agent协作的理论框架"

→ 定义核心概念: Agent, 协作, 任务分解
→ 建立概念关系: 协作模式, 通信机制
→ 提出核心命题: ...
→ 设计验证方案
```

### Pattern 2: 假设提出
```
User: "基于观察提出研究假设"

→ 分析观察数据
→ 识别潜在规律
→ 构建假设陈述
→ 设计检验方法
```

### Pattern 3: 理论验证
```
User: "验证这个理论的有效性"

→ 检查内部一致性
→ 对比现有理论
→ 寻找支持/反驳证据
→ 明确适用边界
```

## Output Format

```markdown
# 理论框架：[理论名称]

## 一、理论概述
- 定义: ...
- 范围: ...
- 意义: ...

## 二、核心概念
| 概念 | 定义 | 来源 |
|------|------|------|
| 概念A | ... | ... |

## 三、核心命题
1. 命题1: ...
   - 推导: ...
   - 证据: ...

## 四、理论边界
- 适用场景: ...
- 不适用场景: ...
- 局限性: ...

## 五、验证方案
...
```

## Theory Components

| 组件 | 说明 | 要求 |
|------|------|------|
| 概念 | 基本单元 | 定义清晰 |
| 关系 | 概念间联系 | 逻辑明确 |
| 命题 | 核心主张 | 可验证 |
| 证据 | 支持材料 | 可追溯 |
| 边界 | 适用范围 | 明确界定 |

## Validation Criteria

- **内部一致性**: 命题之间不矛盾
- **外部一致性**: 与已知事实相符
- **解释力**: 能解释相关现象
- **预测力**: 能预测未来现象
- **简洁性**: 奥卡姆剃刀原则

## Related Skills & Tools

### Related Skills
- **literature-review**: 理论文献调研
- **observation**: 观察数据支撑
- **quality-gate**: 理论质量评估

### Related Tools
- **baidu-scholar-search**: 理论文献检索
- **baidu-baike-data**: 概念定义查询
- **document-output**: 输出理论文档（建设中）

## References

- `references/framework-patterns.md` - 理论框架模式
- `references/validation-methods.md` - 验证方法
