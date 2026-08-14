---
name: observation
description: 系统化观察和记录发现。当用户要求"观察"、"记录发现"、"提取模式"、"注意"时触发。
trigger: on_demand
tags: 观察, 记录, 模式识别, 发现
---

# Observation Skill

系统化观察实践，记录发现，提取模式。

## Execution Flow

1. 确定观察对象和范围
2. 设计观察框架
3. 记录观察数据
4. 提取模式和规律
5. 形成初步假设

## Capabilities

### ✅ Can Do
- 结构化记录观察
- 从数据中提取模式
- 发现异常和边界情况
- 形成初步假设

### ❌ Cannot Do
- 替代实证研究验证
- 自动判断因果关系
- 预测未来趋势

## Usage Patterns

### Pattern 1: 实践观察
```
User: "观察这个系统的运行情况"

→ 确定观察维度: 性能、稳定性、用户体验
→ 设计记录框架
→ 收集数据并记录
→ 提取关键模式
```

### Pattern 2: 模式提取
```
User: "从这些数据中提取模式"

→ 分析数据结构
→ 识别重复模式
→ 标注异常情况
→ 形成模式总结
```

### Pattern 3: 假设形成
```
User: "基于观察形成研究假设"

→ 汇总观察发现
→ 识别潜在因果关系
→ 构建假设框架
→ 设计验证方案
```

## Output Format

```markdown
# 观察笔记：[主题]

## 观察背景
- 时间: ...
- 对象: ...
- 目的: ...

## 观察内容

### 发现1: ...
- 描述: ...
- 证据: ...
- 意义: ...

### 发现2: ...

## 提取的模式
1. 模式A: ...
2. 模式B: ...

## 初步假设
...

## 待验证问题
- 问题1: ...
- 问题2: ...
```

## Observation Framework

| 维度 | 关注点 | 记录方式 |
|------|--------|---------|
| What | 发生了什么 | 事实描述 |
| When | 什么时候发生 | 时间戳 |
| Where | 在哪里发生 | 位置/环境 |
| How | 如何发生 | 过程描述 |
| Why | 为什么发生 | 原因分析 |

## Quality Criteria

- **客观性**: 记录事实，区分观察与推断
- **完整性**: 覆盖所有相关维度
- **一致性**: 使用统一的记录格式
- **可追溯**: 保留原始数据引用

## Related Skills & Tools

### Related Skills
- **literature-review**: 文献支撑观察发现
- **theory-building**: 基于观察构建理论
- **quality-gate**: 验证观察质量

### Related Tools
- **file-reading**: 读取观察数据（建设中）
- **paddleocr-async**: OCR处理大文件
- **document-output**: 输出观察报告（建设中）

## References

- `references/pattern-recognition.md` - 模式识别方法
- `references/hypothesis-formation.md` - 假设形成指南
