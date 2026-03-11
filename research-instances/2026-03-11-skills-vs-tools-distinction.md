# Research Instance: Skills vs Tools Distinction

**研究主题**: Skills与Tools的概念区分  
**研究日期**: 2026-03-11  
**研究方法**: SEARCH-R (搜索-分析-整合)  
**研究者**: Research Agent

---

## 一、研究背景

在构建Agent Team架构时，需要明确区分"Skills"和"Tools"两个核心概念，以确保架构设计的一致性和清晰性。

---

## 二、资料来源

### 2.1 Claude Code Skills
- **来源**: https://code.claude.com/docs/skills
- **定义**: Skills extend what Claude can do. Create a SKILL.md file with instructions, and Claude adds it to its toolkit.
- **核心特征**:
  - 是提示词扩展（prompt extensions）
  - 存储在SKILL.md文件中
  - 包含YAML frontmatter + Markdown指令
  - Claude阅读学习后理解如何执行任务

### 2.2 Agno Tools
- **来源**: https://docs.agno.com/agents/tools
- **定义**: Tools are functions Agents call to interact with external systems.
- **核心特征**:
  - 是可执行的Python函数
  - 通过function calling机制调用
  - Agent执行实际操作的媒介
  - 返回结构化结果

### 2.3 Model Context Protocol (MCP)
- **来源**: https://modelcontextprotocol.io/introduction
- **定义**: MCP is an open-source standard for connecting AI applications to external systems.
- **核心特征**:
  - 标准化协议，连接AI应用和外部系统
  - MCP Servers提供Tools和Resources
  - 一次构建，到处运行

### 2.4 LangChain Tools
- **来源**: https://python.langchain.com/docs/concepts/tools/
- **定义**: Tools are the interface an agent, chain, or LLM uses to interact with the world.
- **核心特征**:
  - 包含name、description、function
  - Agent通过工具执行外部操作
  - 支持并行执行

---

## 三、核心发现

### 3.1 概念定义对比

| 维度 | Skills | Tools |
|------|--------|-------|
| **本质** | 知识/指令/说明书 | 可执行函数 |
| **形式** | Markdown + YAML | Python/TypeScript代码 |
| **加载时机** | Agent学习阶段 | Agent执行阶段 |
| **作用** | 告诉Agent"怎么做" | 让Agent"执行操作" |
| **调用方式** | Agent阅读理解 | Agent直接function call |
| **存储位置** | SKILL.md文件 | tools/目录或模块 |

### 3.2 类比理解

```
Skills = 教科书/操作手册
├── 告诉Agent什么时候使用工具
├── 提供最佳实践和模式
├── 包含示例和参考文档
└── 可包含scripts作为参考实现

Tools = 实际的工具/机器
├── Agent运行时直接调用
├── 执行实际操作（搜索、文件读写等）
├── 返回结构化结果
└── 由平台/框架提供或开发者实现
```

### 3.3 架构关系

```
┌─────────────────────────────────────────────────────────────┐
│                        Agent Runtime                         │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│   ┌─────────────┐         ┌─────────────┐                   │
│   │   Skills    │ ──学习─→│   Agent     │                   │
│   │  (知识)     │         │  (理解)     │                   │
│   │  SKILL.md   │         │             │                   │
│   └─────────────┘         └──────┬──────┘                   │
│       ↑                          │                           │
│       │                          │ 调用                       │
│       │                          ▼                           │
│   ┌───┴─────────┐         ┌─────────────┐                   │
│   │   Scripts   │         │   Tools     │                   │
│   │  (参考代码)  │ ←──参照──│  (函数)     │                   │
│   └─────────────┘         └─────────────┘                   │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

### 3.4 Scripts的定位

**发现**: Scripts在Skills中有明确定位

根据Claude Code文档：
> Skills can include multiple files in their directory... Large reference docs, API specifications, or example collections don't need to load into context every time.

```
my-skill/
├── SKILL.md (required - 核心指令)
├── reference.md (详细参考 - 按需加载)
├── examples.md (示例 - 按需加载)
└── scripts/
    └── helper.py (工具脚本 - 执行或参考)
```

**Scripts的两种用途**：
1. **参考实现** - Agent可以复制使用的代码片段
2. **可执行脚本** - Agent可以直接调用的确定性任务

---

## 四、结论与建议

### 4.1 明确定义

**Skills（技能）**:
- 是给Agent的"知识"和"指令"
- 告诉Agent何时使用工具、如何使用工具
- 包含最佳实践、模式、示例
- 存储在SKILL.md中，供Agent阅读学习

**Tools（工具）**:
- 是Agent运行时可直接调用的函数
- 执行实际操作（API调用、文件操作等）
- 通过function calling机制调用
- 由平台或开发者提供实现

**Scripts（脚本）**:
- 在Skills中，是参考实现或可执行代码
- 不是Agent运行时直接调用的Tools
- 是给开发者参考或Agent复制使用的代码

### 4.2 架构建议

```
agent-team-research/
├── skills/                    # Skills（知识层）
│   └── web-search/
│       ├── SKILL.md          # 核心指令
│       ├── references/       # 详细参考
│       │   ├── parameters.md
│       │   ├── best-practices.md
│       │   └── examples.md
│       └── scripts/          # 参考代码
│           ├── apis/         # API调用示例
│           ├── processors/   # 数据处理函数
│           └── formatters/   # 格式化工具
│
└── tools/                    # Tools（执行层）
    ├── web_search.py         # Agent直接调用
    ├── file_reader.py
    └── ...
```

### 4.3 设计原则

1. **Skills关注"知识传递"**
   - 如何使用工具
   - 何时使用工具
   - 最佳实践和模式
   - 示例和参考文档

2. **Tools关注"功能实现"**
   - 可执行的函数
   - 标准化接口
   - 错误处理
   - 返回结构化结果

3. **Scripts作为"参考实现"**
   - 可复用的代码片段
   - API调用示例
   - 数据处理工具
   - 格式化函数

---

## 五、参考来源

1. Claude Code Skills Documentation: https://code.claude.com/docs/skills
2. Agno Tools Documentation: https://docs.agno.com/agents/tools
3. MCP Introduction: https://modelcontextprotocol.io/introduction
4. LangChain Tools Concepts: https://python.langchain.com/docs/concepts/tools/
5. OpenAI Function Calling: https://github.com/openai/openai-cookbook

---

**研究状态**: 已完成  
**下一步行动**: 更新SKILL_METHODOLOGY.md，明确Skills和Tools的边界定义
