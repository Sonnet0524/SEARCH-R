# Skills - 研究技能库

本目录包含Research Agent可用的研究技能，遵循Skills v2.0标准。

## 核心原则

1. **Context Window is a Public Good** - 每个token都要有价值
2. **Progressive Disclosure** - 渐进式加载
3. **Skills可调用Tools** - 协作关系

## 目录结构

```
project/                      # 项目根目录
├── skills/                   # 技能（业务能力）
│   ├── literature-review/    # 文献检索
│   ├── observation/          # 观察记录
│   ├── theory-building/      # 理论构建
│   └── quality-gate/         # 质量门控
│
└── tools/                    # 工具（底层能力）
    ├── baidu-search/         # 百度搜索
    ├── baidu-scholar-search/ # 百度学术
    ├── baidu-baike-data/     # 百度百科
    ├── paddleocr-doc-parsing/    # PaddleOCR文档解析
    ├── paddleocr-text-recognition/ # PaddleOCR文本识别
    ├── paddleocr-async/      # PaddleOCR异步API
    ├── file-reading/         # 文件读取
    └── document-output/      # 文档输出
```

## 技能分类

**本目录只包含业务能力（Ability）类型的技能**。

工具类型的技能已移至 `tools/` 目录，详见 [Tools库索引](../tools/README.md)。

## 技能列表

| 技能 | 触发条件 | 用途 |
|------|---------|------|
| [literature-review](literature-review/SKILL.md) | "检索文献"、"调研研究" | 文献检索与分析 |
| [observation](observation/SKILL.md) | "观察"、"记录发现" | 系统化观察记录 |
| [theory-building](theory-building/SKILL.md) | "构建理论"、"建立模型" | 理论构建与验证 |
| [quality-gate](quality-gate/SKILL.md) | 研究结论需验证时 | 质量评估与介入决策 |

## Skills vs Tools

```
Skills (业务能力)
    ↓ 指导/调用
Tools (底层工具)
    ↓ 执行
外部API / 文件系统
```

**协作示例**：
```
literature-review (Skill)
    ↓ 调用
baidu-scholar-search (Tool)
    ↓ 执行
百度学术API
```

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

## 使用方法

按SKILL.md中的方法指导执行：

```markdown
1. 阅读SKILL.md理解方法论
2. 按Execution Flow执行
3. 使用Usage Patterns参考
4. 输出符合Output Format
```

## 相关资源

- [Tools库索引](../tools/README.md) - 底层工具完整列表
- [SEARCH-R循环](../methodology/search-r-cycle.md) - 研究方法论
- [研究深度定义](../methodology/research-depth.md) - Level 0-3深度标准
- [文档模板库](../templates/) - 文档模板

---

**版本**: v2.2  
**更新时间**: 2026-05-01  
**维护者**: SEARCH-R Framework
