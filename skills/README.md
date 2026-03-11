# Skills - 研究技能库

本目录包含Research Agent可用的研究技能，遵循Skills v2.0标准。

## 核心原则

1. **Context Window is a Public Good** - 每个token都要有价值
2. **Progressive Disclosure** - 渐进式加载
3. **Skills可调用Tools** - 协作关系

## 目录结构

```
skills/
├── README.md
│
├── web-search/           # [tool] 网络搜索
│   ├── SKILL.md
│   ├── scripts/
│   │   └── search_api.py
│   └── references/
│
├── file-reading/         # [tool] 文件阅读
│   ├── SKILL.md
│   └── references/
│
├── document-output/      # [tool] 文档输出
│   ├── SKILL.md
│   └── references/
│
├── literature-review/    # [ability] 文献检索
│   ├── SKILL.md
│   └── references/
│
├── observation/          # [ability] 观察记录
│   ├── SKILL.md
│   └── references/
│
├── theory-building/      # [ability] 理论构建
│   ├── SKILL.md
│   └── references/
│
└── quality-gate/         # [ability] 质量门控
    ├── SKILL.md
    └── references/
```

## 技能分类

| 类型 | 说明 | 技能 |
|------|------|------|
| **tool** | 底层工具，可执行脚本 | web-search, file-reading, document-output |
| **ability** | 业务能力，方法论指导 | literature-review, observation, theory-building, quality-gate |

## 技能列表

| 技能 | 类型 | 触发条件 | 用途 |
|------|------|---------|------|
| [web-search](web-search/SKILL.md) | tool | "搜索"、"查找"、"检索" | 网络搜索获取实时信息 |
| [file-reading](file-reading/SKILL.md) | tool | "读取"、"解析"文件 | 读取PDF/Word/Excel等 |
| [document-output](document-output/SKILL.md) | tool | "生成报告"、"输出文档" | 生成格式化文档 |
| [literature-review](literature-review/SKILL.md) | ability | "检索文献"、"调研研究" | 文献检索与分析 |
| [observation](observation/SKILL.md) | ability | "观察"、"记录发现" | 系统化观察记录 |
| [theory-building](theory-building/SKILL.md) | ability | "构建理论"、"建立模型" | 理论构建与验证 |
| [quality-gate](quality-gate/SKILL.md) | ability | 研究结论需验证时 | 质量评估与介入决策 |

## Skills vs Tools

```
Skills (Markdown文档)
    ↓ 指导/调用
Tools (Python实现)
    ↓ 执行
外部API / 文件系统
```

- **Skills**: 给LLM看的指令文档
- **Tools**: 实际执行的代码
- Skills可以调用Tools

## SKILL.md规范

```yaml
---
name: skill-name
description: 功能描述 + 触发条件。Use when user asks to "trigger1", "trigger2".
trigger: on_demand
tags: tag1, tag2
---
```

**要求**:
- Frontmatter仅4个字段
- description包含触发条件
- Body < 200行

## Scripts规范

```python
# scripts/api.py
# - 每个文件 < 80行
# - 只依赖Python标准库
# - API Key从环境变量读取
```

## 使用方法

### 1. Tool类型技能
```python
# 调用web-search
from skills.web_search.scripts.search_api import search

result = search(query="关键词", top_k=10)
```

### 2. Ability类型技能
```markdown
# 按SKILL.md中的方法指导执行
1. 阅读SKILL.md理解方法论
2. 按Execution Flow执行
3. 使用Usage Patterns参考
4. 输出符合Output Format
```

## 相关资源

- [SEARCH-R循环](../methodology/search-r-cycle.md)
- [研究深度定义](../methodology/research-depth.md)
- [文档模板库](../templates/)

---

**版本**: v2.0  
**更新时间**: 2026-03-11  
**维护者**: SEARCH-R Framework
