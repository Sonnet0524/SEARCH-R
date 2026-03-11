# Skills - 研究技能库

本目录包含Research Agent可用的研究技能。每个技能都是一个独立的目录，包含SKILL.md定义文件。

## 📁 目录结构

```
skills/
├── README.md                  # 本文件：技能库使用指南
├── literature-review/         # 文献检索技能
│   └── SKILL.md
├── observation/               # 观察技能
│   └── SKILL.md
├── theory-building/           # 理论构建技能
│   └── SKILL.md
├── quality-gate/              # 质量门控技能
│   └── SKILL.md
└── baidu-search/              # 百度搜索技能
    ├── SKILL.md
    └── scripts/               # 实现脚本
        └── baidu_web_search_api.py
```

## 📋 可用技能

### 文献检索能力 (literature-review)
- **用途**: 系统化检索和分析文献
- **场景**: 调研现有研究、梳理知识图谱
- **详情**: [literature-review/SKILL.md](literature-review/SKILL.md)

### 观察能力 (observation)
- **用途**: 系统化观察和记录
- **场景**: 从实践中发现模式和问题
- **详情**: [observation/SKILL.md](observation/SKILL.md)

### 理论构建能力 (theory-building)
- **用途**: 构建和验证理论框架
- **场景**: 提出新理论、建立模型
- **详情**: [theory-building/SKILL.md](theory-building/SKILL.md)

### 质量门控能力 (quality-gate)
- **用途**: 评估研究质量
- **场景**: 判断研究结论、决定Human介入时机
- **详情**: [quality-gate/SKILL.md](quality-gate/SKILL.md)

### 百度搜索能力 (baidu-search)
- **用途**: 实时信息检索
- **场景**: 搜索新闻、技术文档、实时信息
- **实现**: 提供Python API脚本
- **详情**: [baidu-search/SKILL.md](baidu-search/SKILL.md)

## 🔧 使用方法

### 1. 查看技能定义

每个技能目录下都有SKILL.md文件，包含：
- 技能说明和能力范围
- 使用场景和触发条件
- 执行流程和参数说明
- 示例对话

### 2. 在研究中应用

```markdown
# 在研究过程中使用技能

## Survey阶段
使用 [观察技能](observation/SKILL.md) 记录发现

## Explore阶段
使用 [文献检索技能](literature-review/SKILL.md) 检索资料
使用 [百度搜索技能](baidu-search/SKILL.md) 搜索实时信息

## Analyze阶段
使用 [理论构建技能](theory-building/SKILL.md) 构建理论

## 各阶段
使用 [质量门控技能](quality-gate/SKILL.md) 评估研究质量
```

### 3. 使用技能脚本

部分技能提供实现脚本（如baidu-search）：

```bash
# 使用百度搜索API
cd skills/baidu-search/scripts
python3 baidu_web_search_api.py --query "搜索关键词" --top_k 10
```

## 📝 添加新技能

### 技能模板结构

```
{skill-name}/
├── SKILL.md              # 必需：技能定义文件
└── scripts/              # 可选：实现脚本
    └── {script-name}.py
```

### SKILL.md格式

```markdown
---
skill_id: skill-name
name: 技能名称
description: 技能简要描述
version: 1.0.0
skill_type: ability
category: research
triggers:
  - "触发词1"
  - "触发词2"
tags:
  - tag1
  - tag2
---

# 技能名称

## 概述
详细描述技能的用途和特点

## 能力范围
### ✅ 可以做
- 能力1
- 能力2

### ❌ 不能做
- 限制1
- 限制2

## 使用场景
场景描述和示例

## 使用方法
详细的使用说明

## 参考资料
相关文档和资源
```

## 🔗 相关资源

### 方法论文档
- [SEARCH-R循环](../methodology/search-r-cycle.md)
- [研究深度定义](../methodology/research-depth.md)

### 模板文档
- [文档模板库](../templates/)

---

**创建时间**: 2026-03-11  
**用途**: 研究技能库使用指南  
**维护者**: SEARCH-R Framework
