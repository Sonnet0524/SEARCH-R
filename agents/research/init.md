# Research Agent 初始化指南

> 如何初始化和管理多个研究课题

**版本**: v1.1 | **更新**: 2026-03-07

---

## 🎯 设计理念

### 关注点分离

```
Agent本体（不变）
├─ 身份定义：我是Research Agent
├─ 核心能力：元认知意识、SEARCH-R方法论
└─ 工作原则：研究深度、Human参与最小化
    ↓ 支持
    ↓ 切换
研究课题（可变）
├─ 研究课题1：Agent协作框架
├─ 研究课题2：质量门控理论
└─ 研究课题3：[你的研究课题]
```

### 多课题管理

```
┌─────────────────────────────────────────┐
│ Research Agent (AGENTS.md)              │
│ - 身份和能力不变                        │
│ - 可服务于多个研究课题                  │
└─────────────────────────────────────────┘
              ↓ 读取
┌─────────────────────────────────────────┐
│ current-topic.md                        │
│ - 当前激活的研究课题引用                │
└─────────────────────────────────────────┘
              ↓ 指向
┌─────────────────────────────────────────┐
│ research-topics/                        │
│ ├── agent-collaboration.md              │
│ ├── quality-gates.md                    │
│ └── your-research-topic.md              │
└─────────────────────────────────────────┘
```

---

## 🚀 初始化新研究课题

### Step 0: 确认使用环境（重要）

**必须首先询问用户的使用环境**，根据环境配置相应的配置文件：

#### OpenCode 环境

如果用户使用 **OpenCode** 工具，需要创建标准的 `opencode.json` 配置文件：

```json
{
  "$schema": "https://opencode.ai/config.json",
  "agent": {
    "research-agent": {
      "description": "Research Agent - [研究课题名称]",
      "mode": "primary",
      "prompt": "{file:./agents/research/AGENTS.md}",
      "skills": [
        "literature-review",
        "observation",
        "quality-gate",
        "theory-building",
        "baidu-search"
      ]
    }
  }
}
```

**关键要点**：
- `description`: 根据研究课题定制描述
- `prompt`: 指向 AGENTS.md 文件路径
- `skills`: 定义可用的技能模块

#### 其他环境

如果用户使用其他环境（如 Claude Code、Cursor等），询问用户是否需要特定的配置文件。

---

### Step 1: 创建研究课题配置文件

在 `research-topics/` 目录下创建新的研究课题文件：

```bash
# 创建新的研究课题
touch agents/research/research-topics/[topic-name].md
```

### Step 2: 填写研究课题配置

使用以下模板：

```markdown
---
topic: [课题名称]
created: YYYY-MM-DD
status: active|paused|completed
priority: high|medium|low
---

# [课题名称]

## 📋 研究背景

[为什么要研究这个课题？背景是什么？]

## 🎯 研究目标

[希望通过研究达成什么目标？]

### 核心问题
1. [核心问题1]
2. [核心问题2]
3. [核心问题3]

### 期望产出
- [ ] [产出1]
- [ ] [产出2]
- [ ] [产出3]

## 🏗️ 研究范围

### 包含的内容
- [内容1]
- [内容2]
- [内容3]

### 不包含的内容
- [不涉及的内容1]
- [不涉及的内容2]

## 📊 当前进展

### 已完成
- [完成的工作]

### 进行中
- [正在做的工作]

### 下一步
- [计划的工作]

## 📁 研究资料

### 相关文档
- [文档路径1]
- [文档路径2]

### 参考资料
- [资料1]
- [资料2]

## 🔗 相关课题

- 前置课题：[如有]
- 关联课题：[如有]
- 后续课题：[如有]

## 📝 研究记录

### [YYYY-MM-DD] 会话记录
- 研究内容：[内容]
- 关键发现：[发现]
- 下一步：[行动]
```

### Step 3: 激活研究课题

更新 `current-topic.md` 文件：

```markdown
---
current_topic: [课题名称]
activated: YYYY-MM-DD
---

# 当前研究课题

**课题**: [课题名称]  
**配置文件**: [research-topics/topic-name.md](research-topics/topic-name.md)  
**状态**: Active

## 快速链接

- [研究背景和目标](research-topics/topic-name.md#研究背景)
- [当前进展](research-topics/topic-name.md#当前进展)
- [研究资料](research-topics/topic-name.md#研究资料)
```

---

## 🔄 切换研究课题

### 切换流程

```
1. 检查当前课题状态
   - 是否有未完成的工作？
   - 是否需要保存进度？

2. 暂停当前课题
   - 更新课题状态为 paused
   - 记录当前进展和下一步

3. 切换到新课题
   - 更新 current-topic.md
   - 读取新课题的配置
   - 确认研究状态

4. 开始新课题研究
   - 继续未完成的工作
   - 或开始新的研究循环
```

### 切换命令

```bash
# Human请求切换课题
"请切换到 [课题名称] 研究课题"

# Research Agent执行
1. 读取当前课题状态
2. 保存当前进展
3. 切换到新课题
4. 报告切换完成
```

---

## 📊 研究课题管理

### 查看所有课题

```
Research Agent可以：

1. 列出所有研究课题
   "列出当前所有研究课题"

2. 查看课题详情
   "查看 [课题名称] 的详情"

3. 查看课题进度
   "查看 [课题名称] 的进度"
```

### 课题状态管理

```
课题状态：

active   - 正在进行的研究
paused   - 暂停的研究
completed - 已完成的研究

状态转换：
active → paused (暂停)
paused → active (恢复)
active → completed (完成)
```

---

## 🎯 使用示例

### 示例1: 创建新研究课题

**Human**: "我想研究Agent的记忆系统设计"

**Research Agent**:
```
好的，我将创建一个新的研究课题：Agent记忆系统设计

首先，请确认您的使用环境：
1. OpenCode
2. 其他环境（请说明）

**Human**: "我使用OpenCode"

好的，我将为OpenCode环境配置研究项目：

1. 创建标准配置文件：opencode.json
   - 配置Research Agent
   - 定义可用技能

2. 创建研究课题配置：research-topics/agent-memory-system.md
   - 研究背景：Agent需要有效的记忆系统
   - 研究目标：设计Agent记忆系统架构
   - 核心问题：
     1. 记忆应该分为哪些类型？
     2. 如何实现记忆的按需加载？
     3. 如何实现记忆的压缩和遗忘？

3. 更新 current-topic.md 指向新课题

✅ 研究课题创建完成
✅ opencode.json 配置完成
是否现在开始研究？
```

### 示例2: 切换研究课题

**Human**: "请切换到质量门控研究课题"

**Research Agent**:
```
正在切换研究课题...

1. 当前课题：Agent协作框架
   状态：保存进展
   - 已完成：文档化交互模式研究
   - 下一步：调研Message Queue实现

2. 目标题：质量门控理论
   状态：激活
   - 读取配置：research-topics/quality-gates.md
   - 当前进展：理论框架构建中
   - 下一步：量化标准设计

3. 更新 current-topic.md
   - 当前课题：质量门控理论
   - 激活时间：2026-03-07

✅ 切换完成

质量门控理论当前进展：
- 已完成：质量门控三层架构定义
- 进行中：量化标准设计
- 下一步：设计确定性评估的量化方法

是否继续研究？
```

### 示例3: 查看所有课题

**Human**: "列出所有研究课题"

**Research Agent**:
```
当前研究课题清单：

1. Agent协作框架 (active)
   - 配置：research-topics/agent-collaboration.md
   - 状态：进行中
   - 优先级：high
   - 进度：70%

2. 质量门控理论
   - 配置：research-topics/quality-gates.md
   - 状态：进行中
   - 优先级：high
   - 进度：60%

3. Agent记忆系统
   - 配置：research-topics/agent-memory.md
   - 状态：暂停
   - 优先级：medium
   - 进度：30%

共3个研究课题，2个进行中，1个已暂停
```

---

## 📁 目录结构

```
研究项目根目录/
├── opencode.json               # OpenCode环境配置文件
├── agents/research/
│   ├── AGENTS.md               # Agent身份和能力（不变）
│   ├── init.md                 # 本文件：初始化指南
│   ├── current-topic.md        # 当前激活的研究课题引用
│   ├── research-topics/        # 研究课题库
│   │   ├── agent-collaboration.md
│   │   ├── quality-gates.md
│   │   └── [your-topic].md
│   ├── skills/                 # 可复用能力
│   │   ├── literature-review.md
│   │   ├── theory-building.md
│   │   ├── observation.md
│   │   └── quality-gate.md
│   └── session-log.md          # 会话日志
└── methodology/                # 方法论体系（从SEARCH-R复制）
    ├── search-r-cycle.md
    ├── research-depth.md
    └── human-role.md
```

### 配置文件说明

| 文件 | 用途 | 何时创建 |
|------|------|----------|
| `opencode.json` | OpenCode环境配置 | 初始化时根据环境创建 |
| `AGENTS.md` | Agent核心定义 | 从SEARCH-R复制 |
| `current-topic.md` | 当前课题引用 | 创建第一个课题时 |
| `research-topics/*.md` | 课题配置文件 | 创建新课题时 |

---

## 🎓 最佳实践

### 环境配置

1. **优先询问环境** - 初始化时首先确认用户的使用环境
2. **创建标准配置** - OpenCode环境必须创建opencode.json
3. **路径引用正确** - AGENTS.md中的路径要适配项目结构

### 课题创建

1. **明确研究范围** - 避免课题过大或模糊
2. **设置优先级** - 帮助Human决策研究顺序
3. **定义可衡量目标** - 明确何时算"完成"

### 课题切换

1. **保存当前进展** - 便于后续恢复
2. **清晰记录下一步** - 减少恢复成本
3. **避免频繁切换** - 保持研究连贯性

### 多课题管理

1. **限制活跃课题数** - 建议2-3个active课题
2. **定期回顾暂停课题** - 避免遗忘
3. **完成课题及时归档** - 保持课题库整洁

---

## 🔧 高级功能

### 课题依赖管理

```markdown
## 课题依赖

### 前置课题
- Agent架构设计 (completed)
  - 提供了Agent的基本概念

### 关联课题
- 质量门控理论
  - 共享：评估机制设计

### 后续课题
- Agent记忆系统实现
  - 需要：记忆架构设计成果
```

### 研究成果复用

```markdown
## 可复用成果

### 输出到其他课题
- 质量门控三层架构 → 可用于质量门控理论课题
- 文档分层原则 → 可用于Agent协作框架课题

### 从其他课题输入
- Agent四层架构 → 来自Agent架构设计课题
- Human参与最小化原则 → 来自项目基础
```

---

## 📝 注意事项

### ⚠️ 重要提醒

1. **AGENTS.md不变** - 只在创建Agent或重大更新时修改
2. **课题文件可变** - 随时更新研究进展和状态
3. **current-topic.md指向** - 必须准确指向当前课题
4. **Human确认切换** - 切换课题前应告知Human

### 🚫 避免的做法

1. **不要删除课题文件** - 即使已完成也应保留
2. **不要频繁切换** - 保持研究连贯性
3. **不要忽视暂停课题** - 定期回顾和恢复
4. **不要混淆课题范围** - 保持课题边界清晰

---

## 🔗 相关文档

- [Agent身份和能力](AGENTS.md)
- [SEARCH-R方法论](../../methodology/search-r-cycle.md)
- [研究深度定义](../../methodology/research-depth.md)
- [Human角色定义](../../methodology/human-role.md)

---

**维护者**: SEARCH-R Framework  
**更新时间**: 2026-03-07  
**版本**: v1.1
