---
name: quality-gate
description: 评估研究质量并决定Human介入时机。当需要判断研究结论、评估研究质量、决定是否需要Human确认时触发。
trigger: on_demand
tags: 质量评估, 门控, Human介入, 决策支持
---

# Quality Gate Skill

评估研究质量，判断确定性，决定Human介入时机。

## Execution Flow

1. 评估研究确定性（高/中/低）
2. 评估结论可接受性（高/中/低）
3. 检查是否存在认知混淆
4. 综合判断是否需要Human介入
5. 生成评估报告和建议

## Assessment Dimensions

### 确定性评估
| 等级 | 标准 | 表现 |
|------|------|------|
| HIGH | 逻辑清晰，证据充分 | 结论可靠 |
| MEDIUM | 逻辑基本清晰，证据部分缺失 | 需要补充验证 |
| LOW | 逻辑不清晰或证据严重缺失 | 需要重新研究 |

### 可接受性评估
| 等级 | 标准 | 表现 |
|------|------|------|
| HIGH | 符合预期，可直接应用 | 继续推进 |
| MEDIUM | 基本符合，需要小幅调整 | 优化后应用 |
| LOW | 不符合预期，需要重大调整 | 需要Human决策 |

### 混淆判断
- **无混淆**: 理解一致，无认知偏差
- **有混淆**: 存在理解歧义或概念不清

## Intervention Types

| 类型 | 触发条件 | 行动 |
|------|---------|------|
| NONE | HIGH + HIGH + 无混淆 | 继续研究 |
| CLARIFICATION | 存在混淆 | 请求澄清 |
| DIRECTION | MEDIUM等级 | 请求方向指导 |
| DECISION | LOW等级 | 请求决策 |

## Usage Patterns

### Pattern 1: 研究结论验证
```
User: "这个研究结论可以接受吗？"

→ 评估确定性: HIGH
→ 评估可接受性: MEDIUM
→ 混淆判断: 无
→ 结论: 继续推进，建议小幅优化
```

### Pattern 2: Human介入决策
```
User: "是否需要让Human确认？"

→ 确定性: LOW（证据不足）
→ 可接受性: MEDIUM
→ 结论: 需要DECISION介入
→ 建议: 请Human确认研究方向
```

### Pattern 3: 质量报告生成
```
User: "生成研究质量评估报告"

→ 综合评估各维度
→ 识别问题和风险
→ 提出改进建议
→ 输出评估报告
```

## Output Format

```markdown
# 质量评估报告

## 评估对象
- 研究主题: ...
- 评估时间: ...

## 维度评估

| 维度 | 等级 | 说明 |
|------|------|------|
| 确定性 | HIGH/MEDIUM/LOW | ... |
| 可接受性 | HIGH/MEDIUM/LOW | ... |
| 混淆 | 有/无 | ... |

## 综合判断
- 介入类型: NONE/CLARIFICATION/DIRECTION/DECISION
- 判断理由: ...

## 改进建议
1. ...
2. ...
```

## Decision Rules

```
IF 确定性=HIGH AND 可接受性=HIGH AND 无混淆:
    → 无需介入，继续研究

IF 确定性=LOW OR 可接受性=LOW:
    → DECISION介入，请求Human决策

IF 存在混淆:
    → CLARIFICATION介入，请求澄清

IF 确定性=MEDIUM OR 可接受性=MEDIUM:
    → DIRECTION介入，请求方向指导
```

## Related Skills

- **observation**: 观察质量评估
- **theory-building**: 理论质量检验
- **literature-review**: 文献质量评估

## References

- `references/assessment-frameworks.md` - 评估框架
- `references/intervention-types.md` - 介入类型详解
