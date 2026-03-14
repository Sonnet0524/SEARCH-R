#!/bin/bash

# SEARCH-R Research Project Initializer
# 用于从SEARCH-R模板创建新的研究课题

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印带颜色的信息
print_info() {
    echo -e "${BLUE}ℹ ${NC}$1"
}

print_success() {
    echo -e "${GREEN}✓ ${NC}$1"
}

print_warning() {
    echo -e "${YELLOW}⚠ ${NC}$1"
}

print_error() {
    echo -e "${RED}✗ ${NC}$1"
}

# 显示帮助信息
show_help() {
    cat << EOF
SEARCH-R Research Project Initializer

用法:
    ./init-research.sh <项目名称> [选项]

参数:
    项目名称           新研究项目的名称（必填）

选项:
    -d, --description  项目描述
    -g, --git          初始化Git仓库（默认：是）
    -e, --environment  使用环境 (opencode|other)，默认自动检测
    -h, --help         显示此帮助信息

示例:
    ./init-research.sh my-research-project
    ./init-research.sh my-research-project -d "我的研究项目"
    ./init-research.sh my-research-project --description "研究AI" --git
    ./init-research.sh my-research-project -e opencode

EOF
}

# 检查参数
if [ $# -eq 0 ]; then
    show_help
    exit 1
fi

# 解析参数
PROJECT_NAME=""
PROJECT_DESC=""
INIT_GIT=true
ENVIRONMENT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -d|--description)
            PROJECT_DESC="$2"
            shift 2
            ;;
        -g|--git)
            INIT_GIT=true
            shift
            ;;
        --no-git)
            INIT_GIT=false
            shift
            ;;
        -e|--environment)
            ENVIRONMENT="$2"
            shift 2
            ;;
        *)
            if [ -z "$PROJECT_NAME" ]; then
                PROJECT_NAME="$1"
            fi
            shift
            ;;
    esac
done

# 验证项目名称
if [ -z "$PROJECT_NAME" ]; then
    print_error "项目名称不能为空"
    exit 1
fi

# 自动检测环境
if [ -z "$ENVIRONMENT" ]; then
    if [ -f "opencode.json" ]; then
        ENVIRONMENT="opencode"
        print_info "检测到OpenCode环境"
    else
        ENVIRONMENT="other"
        print_info "未检测到OpenCode环境，使用通用配置"
    fi
fi

# 检查项目目录是否已存在
if [ -d "../$PROJECT_NAME" ]; then
    print_error "目录 ../$PROJECT_NAME 已存在"
    exit 1
fi

print_info "开始创建研究项目: $PROJECT_NAME"
echo ""

# 创建项目目录
print_info "创建项目目录结构..."
mkdir -p "../$PROJECT_NAME"/{research/{observations,retrievals,theory,reflections},templates,references,tools}
mkdir -p "../$PROJECT_NAME/agents/research"

# 复制模板文件
print_info "复制模板文件..."
cp -r templates/*.md "../$PROJECT_NAME/templates/"

# 复制方法论文档
print_info "复制方法论文档..."
cp -r methodology "../$PROJECT_NAME/"

# 复制Agent配置
print_info "复制Agent配置..."
mkdir -p "../$PROJECT_NAME/agents/research"
cp agents/research/AGENTS.md "../$PROJECT_NAME/agents/research/"
cp agents/research/init.md "../$PROJECT_NAME/agents/research/"
cp agents/research/ESSENTIALS.md "../$PROJECT_NAME/agents/research/"
cp agents/research/session-log.md "../$PROJECT_NAME/agents/research/"
cp agents/research/current-topic.md "../$PROJECT_NAME/agents/research/"

# 复制research-topics模板
print_info "复制研究课题模板..."
mkdir -p "../$PROJECT_NAME/agents/research/research-topics"
cp agents/research/research-topics/topic-template.md "../$PROJECT_NAME/agents/research/research-topics/"
cp agents/research/research-topics/README.md "../$PROJECT_NAME/agents/research/research-topics/"

# 复制技能库
print_info "复制技能库..."
mkdir -p "../$PROJECT_NAME/agents/research/skills"
if [ -d "skills" ]; then
    # 从根目录的skills/复制到新项目的agents/research/skills/
    cp -r skills/* "../$PROJECT_NAME/agents/research/skills/"
    print_success "已复制skills目录到 agents/research/skills/（包含所有技能文件）"
else
    print_warning "未找到根目录的skills/目录"
    # 尝试从agents/research/skills/复制（兼容旧结构）
    if [ -d "agents/research/skills" ]; then
        cp -r agents/research/skills/* "../$PROJECT_NAME/agents/research/skills/"
        print_success "已从agents/research/skills/复制"
    else
        print_warning "未找到skills目录，跳过"
    fi
fi

# 复制示例
print_info "复制示例..."
mkdir -p "../$PROJECT_NAME/examples"
if [ -d "agents/research/examples" ]; then
    cp -r agents/research/examples/* "../$PROJECT_NAME/examples/" 2>/dev/null || true
fi

# 创建opencode.json配置（如果是OpenCode环境）
if [ "$ENVIRONMENT" = "opencode" ]; then
    print_info "创建OpenCode配置..."
    cat > "../$PROJECT_NAME/opencode.json" << EOF
{
  "\$schema": "https://opencode.ai/config.json",
  "agent": {
    "research-agent": {
      "description": "Research Agent - ${PROJECT_DESC:-$PROJECT_TITLE}",
      "mode": "primary",
      "prompt": "{file:./agents/research/AGENTS.md}",
      "skills": [
        "literature-review",
        "observation",
        "quality-gate",
        "theory-building",
        "web-search",
        "file-reading",
        "document-output"
      ]
    }
  }
}
EOF
    print_success "已创建opencode.json配置"
fi

# 创建.gitignore
print_info "创建.gitignore..."
cat > "../$PROJECT_NAME/.gitignore" << 'EOF'
# Research outputs
*.pdf
*.docx
*.xlsx

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
.venv/
ENV/
*.egg-info/
dist/
build/

# Jupyter Notebook
.ipynb_checkpoints

# Environment
.env
.env.local
*.log

# OS
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# Temporary
tmp/
temp/
*.tmp
*.bak

# Search logs
search-logs/*.jsonl
search-logs/usage-stats.json
EOF

# 创建README.md
print_info "创建README.md..."
PROJECT_TITLE=$(echo "$PROJECT_NAME" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
cat > "../$PROJECT_NAME/README.md" << EOF
# $PROJECT_TITLE

${PROJECT_DESC:-研究项目说明}

## 📋 项目概述

本项目使用SEARCH-R方法论进行研究。

**研究目标**：
- 待填写

**研究深度**：Level 0-2

**研究周期**：待确定

## 📁 项目结构

\`\`\`
$PROJECT_NAME/
├── README.md                    # 项目说明
$(if [ "$ENVIRONMENT" = "opencode" ]; then echo "├── opencode.json               # OpenCode配置"; fi)
├── methodology/                 # SEARCH-R方法论
├── agents/research/            # Agent配置
│   ├── AGENTS.md               # Agent定义
│   ├── init.md                 # 初始化指南
│   ├── current-topic.md        # 当前研究课题
│   ├── session-log.md          # 会话日志
│   └── skills/                 # 技能库
├── research/                    # 研究目录
│   ├── topic.md                # 课题定义
│   ├── observations/           # 观察笔记
│   ├── retrievals/             # 检索报告
│   ├── theory/                 # 理论文档
│   └── reflections/            # 反思笔记
├── templates/                   # 文档模板
├── references/                  # 参考资料
└── tools/                       # 工具

\`\`\`

## 🚀 快速开始

### 1. 定义研究课题

编辑 \`research/topic.md\` 定义你的研究课题。

### 2. 开始研究

按照SEARCH-R方法论进行研究：

1. **Survey（观察调研）**：收集资料，建立初步认知
2. **Explore（探索检索）**：深入理解，检索相关知识
3. **Analyze（分析思考）**：深度分析，构建理论
4. **Review（评审探讨）**：Human参与，验证成果
5. **Confirm（确认验证）**：实践验证，完善结论
6. **Harvest（收获产出）**：沉淀成果，文档化
7. **Reflect（反思迭代）**：持续优化，改进方法

### 3. 记录研究过程

- 使用 \`research/observations/\` 记录观察笔记
- 使用 \`research/retrievals/\` 记录检索报告
- 使用 \`research/theory/\` 记录理论文档
- 使用 \`research/reflections/\` 记录反思笔记

## 📚 参考资料

- [SEARCH-R方法论](methodology/search-r-cycle.md)
- [研究深度定义](methodology/research-depth.md)
- [Human角色定义](methodology/human-role.md)
- [Agent配置](agents/research/AGENTS.md)

## 📝 研究记录

详细研究记录见 [会话日志](agents/research/session-log.md)

## 📄 许可证

本项目采用 AGPL-3.0 许可证

---

**创建时间**: $(date +%Y-%m-%d)  
**使用框架**: SEARCH-R
EOF

# 创建初始topic.md
print_info "创建初始课题定义..."
cat > "../$PROJECT_NAME/research/topic.md" << EOF
---
topic: $PROJECT_TITLE
created: $(date +%Y-%m-%d)
status: active
priority: high
---

# $PROJECT_TITLE

## 📋 研究背景

**背景描述**：
- 待填写

**研究动机**：
- 待填写

---

## 🎯 研究目标

### 核心问题

1. **核心问题1？**
   - 为什么重要：待填写
   - 期望答案：待填写

2. **核心问题2？**
   - 为什么重要：待填写
   - 期望答案：待填写

### 期望产出

- [ ] 待填写

### 成功标准

如何判断研究完成？
- 待填写

---

## 🏗️ 研究范围

### 包含的内容

- 待填写

### 不包含的内容

- 待填写

### 研究边界

- **深度目标**：Level 0-2
- **时间预期**：待确定
- **资源限制**：待确定

---

## 📊 当前进展

### 状态概览

- **当前阶段**：准备开始
- **完成度**：0%
- **优先级**：high

### 已完成

- [$(date +%Y-%m-%d)] 创建研究课题

### 进行中

- 正在准备开始Survey阶段

### 下一步

1. 开始Survey阶段
2. 收集基础资料
3. 建立初步认知

---

## 📁 研究资料

### 相关文档

待收集和整理

### 参考资料

待收集

---

## 🎯 研究计划

### Phase 1: Survey（观察调研）

**时间**：待确定

**目标**：建立对研究对象的初步认知

**任务**：
1. 收集基础资料
2. 整理分类框架
3. 记录观察笔记

**产出**：
- 资料清单
- 观察笔记

---

## 💡 洞察和假设

待研究过程中积累

---

**创建者**: Research Agent  
**创建时间**: $(date +%Y-%m-%d)  
**课题状态**: active
EOF

# 初始化Git仓库
if [ "$INIT_GIT" = true ]; then
    print_info "初始化Git仓库..."
    cd "../$PROJECT_NAME"
    git init
    git add .
    git commit -m "feat: 初始化研究项目

- 从SEARCH-R模板创建
- 包含完整的方法论框架
- 包含文档模板和技能库"
    cd - > /dev/null
fi

echo ""
print_success "研究项目创建完成！"
echo ""
print_info "项目位置: ../$PROJECT_NAME"
if [ "$ENVIRONMENT" = "opencode" ]; then
    print_success "OpenCode配置: opencode.json 已创建"
fi
print_info "下一步操作:"
echo "  1. cd ../$PROJECT_NAME"
echo "  2. 编辑 research/topic.md 定义研究课题"
echo "  3. 开始使用SEARCH-R方法论进行研究"
if [ "$ENVIRONMENT" = "opencode" ]; then
    echo ""
    print_info "OpenCode环境:"
    echo "  - 配置文件: opencode.json"
    echo "  - Agent: research-agent"
    echo "  - 可用技能: literature-review, observation, quality-gate, theory-building, web-search, file-reading, document-output"
fi
echo ""
print_info "查看文档:"
echo "  - README.md: 项目说明"
echo "  - research/topic.md: 课题定义"
echo "  - agents/research/AGENTS.md: Agent配置"
echo "  - methodology/search-r-cycle.md: 方法论说明"
