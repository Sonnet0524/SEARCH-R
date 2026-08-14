---
name: document-output
description: 生成格式化的文档输出。当用户要求"生成报告"、"输出文档"、"创建文档"、"写一个报告"时触发。
trigger: on_demand
tags: 文档生成, 报告, Markdown, 格式化
---

# Document Output Skill

生成格式美观的文档，支持多种输出格式。

## Execution Flow

1. 确定文档类型和格式
2. 应用对应的模板
3. 填充内容结构
4. 输出格式化文档

## Supported Formats

| 格式 | 扩展名 | 特点 |
|------|--------|------|
| Markdown | .md | 轻量级，通用性强 |
| HTML | .html | 支持丰富样式 |
| JSON | .json | 结构化数据 |

## Document Types

| 类型 | 用途 | 结构 |
|------|------|------|
| report | 研究报告 | 标题+摘要+章节+参考文献 |
| note | 观察笔记 | 标题+背景+内容+发现 |
| summary | 文献摘要 | 标题+来源+要点+评价 |
| analysis | 分析报告 | 标题+数据+分析+结论 |

## Tool Call

```python
from skills.document_output.scripts.generator import generate_document

# 生成文档
result = generate_document(
    doc_type="report",
    title="研究报告标题",
    content={
        "abstract": "摘要内容",
        "sections": [...],
        "references": [...]
    },
    format="markdown"
)
```

## Output Structure

```markdown
# 报告标题

> **作者**: Research Agent  
> **日期**: 2026-03-11  
> **类型**: 研究报告

## 摘要

摘要内容...

## 一、章节标题

### 1.1 子章节

内容...

## 参考文献

1. 参考文献1
2. 参考文献2

---

**生成时间**: 2026-03-11 10:30:00
```

## Usage Patterns

### Pattern 1: 研究报告
```
User: "生成一份研究报告"

→ generate_document(doc_type="report", title="...", content={...})
→ 输出结构化Markdown报告
```

### Pattern 2: 观察笔记
```
User: "记录这个观察发现"

→ generate_document(doc_type="note", ...)
→ 输出观察笔记格式
```

### Pattern 3: 文献摘要
```
User: "生成这篇文献的摘要"

→ generate_document(doc_type="summary", ...)
→ 输出文献摘要格式
```

## Templates

报告模板结构：
```
- 标题（H1）
- 元信息（作者、日期、类型）
- 摘要
- 章节（H2/H3）
- 参考文献
- 页脚信息
```

## References

- `references/templates.md` - 文档模板库
- `scripts/generator.py` - 生成器实现
