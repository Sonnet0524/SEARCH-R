# SEARCH-R: 研究方法论框架

> **让研究系统化、可追溯、高质量**

SEARCH-R是一个完整的Research Agent方法论框架，帮助你用AI辅助进行系统化的研究探索。

## 🎯 核心特性

- **📋 完整的方法论体系**：SEARCH-R循环（Survey → Explore → Analyze → Review → Confirm → Harvest → Reflect）
- **🤖 Agent设计规范**：Research Agent的核心能力和工作流程
- **✅ 质量门控机制**：确保研究质量的自我评估体系
- **📝 标准化文档**：可复用的研究文档模板
- **🛠️ 丰富的技能库**：文献检索、观察分析、理论构建等研究技能
- **🚀 快速初始化**：一键创建新的研究课题

## 📦 仓库定位

**SEARCH-R是方法论模板框架，不是具体的研究项目。**

```
SEARCH-R仓库 (L0)
  ├─ 提供方法论定义
  ├─ 提供文档模板
  ├─ 提供技能库
  └─ 提供初始化工具
     ↓ 用于创建
研究课题 (L1)
  ├─ search-r-methodology-research（研究方法论）
  ├─ agent-team-research（Agent协作研究）
  ├─ harness-engineering-research（Harness工程研究）
  └─ your-research-project（你的研究课题）
```

## 🚀 快速开始

### 方式1：使用初始化脚本（推荐）

```bash
# 1. 克隆SEARCH-R仓库
git clone https://github.com/Sonnet0524/SEARCH-R.git
cd SEARCH-R

# 2. 初始化你的研究课题
./tools/init-research.sh my-research-project

# 3. 进入新创建的项目
cd ../my-research-project

# 4. 编辑课题定义
# 编辑 research/topic.md 定义你的研究课题

# 5. 开始研究
# 按照 agents/research/AGENTS.md 的指导进行研究
```

### 方式2：手动创建

```bash
# 1. 复制SEARCH-R模板
cp -r SEARCH-R my-research-project
cd my-research-project

# 2. 清理不需要的文件
rm -rf research-instances .git

# 3. 初始化Git
git init
git add .
git commit -m "feat: 初始化研究项目"

# 4. 编辑课题定义
# 编辑 research/topic.md

# 5. 开始研究
```

## 📁 框架结构

```
SEARCH-R/
├── README.md                    # 框架说明
├── QUICKSTART.md                # 快速开始指南
│
├── methodology/                 # 方法论文档
│   ├── search-r-cycle.md        # SEARCH-R循环详解
│   ├── research-depth.md        # 研究深度定义
│   ├── human-role.md            # Human角色定义
│   └── README.md                # 方法论总览
│
├── agents/research/             # Agent配置
│   ├── AGENTS.md                # Agent核心定义 ⭐
│   ├── init.md                  # 初始化指南
│   ├── ESSENTIALS.md            # 核心要点
│   ├── session-log.md           # 会话日志模板
│   ├── current-topic.md         # 当前课题模板
│   │
│   ├── research-topics/         # 课题模板
│   │   ├── topic-template.md    # 课题定义模板
│   │   └── README.md            # 课题管理说明
│   │
│   ├── skills/                  # Agent技能库
│   │   ├── baidu-search.md      # 百度搜索技能
│   │   ├── literature-review.md # 文献检索技能
│   │   ├── observation.md       # 观察技能
│   │   ├── theory-building.md   # 理论构建技能
│   │   └── quality-gate.md      # 质量门控技能
│   │
│   └── examples/                # 示例文档
│       └── example-session.md   # 完整会话示例
│
├── templates/                   # 文档模板
│   ├── observation-template.md  # 观察笔记模板
│   ├── retrieval-template.md    # 检索报告模板
│   ├── theory-template.md       # 理论文档模板
│   └── reflection-template.md   # 反思笔记模板
│
├── tools/                       # 工具
│   └── init-research.sh         # 项目初始化脚本
│
├── references/                  # 参考资料
│   ├── academic-papers/         # 学术论文
│   ├── official-documents/      # 官方文件
│   └── industry-reports/        # 行业报告
│
└── research-instances/          # 研究实例注册
    ├── README.md                # 实例管理说明
    └── *.md                     # 各研究实例引用
```

## 📚 核心文档

### 方法论体系

- **[SEARCH-R循环](methodology/search-r-cycle.md)**：完整的7阶段研究循环
- **[研究深度定义](methodology/research-depth.md)**：Level 0-3的研究深度标准
- **[Human角色定义](methodology/human-role.md)**：Human在研究中的角色定位

### Agent配置

- **[AGENTS.md](agents/research/AGENTS.md)**：Research Agent的核心定义 ⭐
- **[init.md](agents/research/init.md)**：研究课题初始化指南
- **[ESSENTIALS.md](agents/research/ESSENTIALS.md)**：核心要点速查

### 技能库

- **[文献检索](agents/research/skills/literature-review.md)**：系统化文献检索和分析
- **[观察能力](agents/research/skills/observation.md)**：系统化观察和记录
- **[理论构建](agents/research/skills/theory-building.md)**：构建和验证理论
- **[质量门控](agents/research/skills/quality-gate.md)**：评估研究质量
- **[百度搜索](agents/research/skills/baidu-search.md)**：实时信息检索

### 模板库

- **[观察笔记模板](templates/observation-template.md)**：记录观察发现
- **[检索报告模板](templates/retrieval-template.md)**：记录检索过程
- **[理论文档模板](templates/theory-template.md)**：记录理论成果
- **[反思笔记模板](templates/reflection-template.md)**：记录方法论反思

## 🔬 SEARCH-R方法论

### 研究循环

```
S - Survey（观察调研）
    从实践中发现问题，建立初步认知
    ↓
E - Explore（探索检索）
    检索相关知识，深入理解背景
    ↓
A - Analyze（分析思考）
    深度分析，构建理论框架
    ↓
R - Review（评审探讨）
    Human参与，验证研究成果
    ↓
C - Confirm（确认验证）
    实践中验证，完善结论
    ↓
H - Harvest（收获产出）
    沉淀成果，文档化输出
    ↓
R - Reflect（反思迭代）
    持续优化方法论
    ↓
    (回到 Survey)
```

### 研究深度

- **Level 0**：第一性原理（为什么）
- **Level 1**：设计原则（是什么）
- **Level 2**：实现思路（怎么做）
- **Level 3**：具体实现（细节）

**目标**：追求Level 0-2的深度理解

### 质量门控

在关键决策点评估：

- **确定性评估**：我知道这个结论有多确定？
- **可接受性评估**：我知道这个结论是否可接受？
- **认知混淆识别**：我知道自己是否理解偏差？

## 📖 使用场景

### ✅ 适合的研究课题

- 框架和方法论研究
- 技术调研和评估
- 架构设计和演进
- 知识沉淀和提炼
- 理论构建和验证

### ❌ 不适合的任务

- 快速信息查询
- 具体代码实现
- 日常项目管理
- 简单问题回答

## 🎓 研究实例

使用SEARCH-R创建的研究课题：

### L1 研究课题

- **[search-r-methodology-research](../search-r-methodology-research)**  
  研究SEARCH-R方法论本身

- **[agent-team-research](../agent-team-research)**  
  Agent协作模式研究

- **[harness-engineering-research](../harness-engineering-research)**  
  Harness工程研究

- **[sgcc-quality-service-research](../sgcc-quality-service-research)**  
  国网优质服务举措研究

## 🛠️ 配置要求

### 必需配置

- Git
- Python 3.7+（如果使用技能库）
- 文本编辑器

### 可选配置

- 百度搜索API（用于实时信息检索）
- 文献数据库访问权限
- 文献管理工具（Zotero, Mendeley等）

## 📋 使用流程

### 1. 初始化研究课题

```bash
./tools/init-research.sh my-project
```

### 2. 定义研究课题

编辑 `research/topic.md`：
- 明确研究背景
- 定义核心问题
- 设定研究目标
- 确定研究范围

### 3. 执行SEARCH-R循环

```
Survey → Explore → Analyze → Review → Confirm → Harvest → Reflect
```

### 4. 记录研究过程

- 使用 `research/observations/` 记录观察
- 使用 `research/retrievals/` 记录检索
- 使用 `research/theory/` 记录理论
- 使用 `research/reflections/` 记录反思

### 5. 产出研究成果

- 理论文档
- 最佳实践
- 方法论改进

## 🤝 贡献

欢迎贡献：

- **方法论改进**：优化SEARCH-R循环
- **新技能**：添加新的研究技能
- **模板完善**：改进文档模板
- **最佳实践**：分享使用经验

## 📄 许可证

本项目采用 AGPL-3.0 许可证

## 🔗 相关资源

- **[快速开始指南](QUICKSTART.md)**：详细的入门教程
- **[设计哲学](docs/design-philosophy.md)**：框架设计思想
- **[迁移报告](docs/MIGRATION-REPORT.md)**：框架演进历史

---

**维护者**: SEARCH-R Framework  
**创建时间**: 2026-03-07  
**更新时间**: 2026-03-11  
**版本**: v1.0  
**定位**: L0 方法论框架模板
