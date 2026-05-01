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

# 复制工具集
print_info "复制工具集..."
if [ -d "tools" ]; then
    mkdir -p "../$PROJECT_NAME/tools"
    cp -r tools/* "../$PROJECT_NAME/tools/"
    print_success "已复制tools目录（包含所有工具定义和脚本）"
else
    print_warning "未找到tools目录，跳过"
fi

# 创建opencode.json配置（项目入口文件，必须创建）
print_info "创建opencode.json项目入口配置..."
cat > "../$PROJECT_NAME/opencode.json" << 'OPENCODE_JSON_EOF'
{
  "$schema": "https://opencode.dev/schema/v1/opencode.json",
  "project": {
    "name": "${PROJECT_NAME}",
    "displayName": "${PROJECT_TITLE}",
    "description": "${PROJECT_DESC:-使用SEARCH-R方法论进行系统性研究}",
    "version": "1.0.0",
    "methodology": "SEARCH-R Framework v2.0",
    "createdAt": "$(date +%Y-%m-%d)",
    "repository": { "type": "git", "url": "./" }
  },
  "agents": [
    {
      "id": "research",
      "name": "Research Agent",
      "description": "使用SEARCH-R方法论进行系统性研究的研究型Agent",
      "mode": "primary",
      "entryPoint": "agents/research/AGENTS.md",
      "version": "2.0",
      "skills": [
        "literature-review",
        "observation",
        "quality-gate",
        "theory-building"
      ],
      "defaultSkill": "literature-review",
      "metadata": {
        "role": "研究员",
        "focus": ["为什么", "是什么", "怎么做"],
        "level": "L0 - 研究方法论框架层"
      }
    }
  ],
  "skills": [
    {
      "id": "literature-review",
      "name": "文献检索",
      "description": "系统化检索和分析文献。当用户要求'检索文献'、'调研现有研究'、'文献综述'、'了解研究现状'时触发。",
      "type": "agent",
      "agentId": "research",
      "entryPoint": "agents/research/skills/literature-review/SKILL.md",
      "tags": ["文献检索", "研究", "综述", "知识图谱"],
      "trigger": "on_demand",
      "relatedTools": ["baidu-scholar-search", "baidu-search", "baidu-baike-data"]
    },
    {
      "id": "observation",
      "name": "观察记录",
      "description": "系统化观察和记录。当用户要求'观察'、'记录现象'、'发现模式'时触发。",
      "type": "agent",
      "agentId": "research",
      "entryPoint": "agents/research/skills/observation/SKILL.md",
      "tags": ["观察", "记录", "模式发现", "现象分析"],
      "trigger": "on_demand"
    },
    {
      "id": "quality-gate",
      "name": "质量门控",
      "description": "评估研究质量。当需要判断研究结论的确定性、可接受性时触发。",
      "type": "agent",
      "agentId": "research",
      "entryPoint": "agents/research/skills/quality-gate/SKILL.md",
      "tags": ["质量评估", "研究评审", "确定性评估"],
      "trigger": "auto"
    },
    {
      "id": "theory-building",
      "name": "理论构建",
      "description": "构建和验证理论框架。当用户要求'建立理论'、'构建框架'、'提出模型'时触发。",
      "type": "agent",
      "agentId": "research",
      "entryPoint": "agents/research/skills/theory-building/SKILL.md",
      "tags": ["理论构建", "框架设计", "模型验证"],
      "trigger": "on_demand"
    }
  ],
  "tools": [
    {
      "id": "baidu-search",
      "name": "百度搜索",
      "description": "百度AI搜索引擎（BDSE）。用于实时信息、文档或研究主题的搜索。",
      "category": "search",
      "entryPoint": "tools/baidu-search/SKILL.md",
      "script": "tools/baidu-search/scripts/search.py",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["BAIDU_API_KEY", "BAIDU_AISEARCH_TOKEN"],
        "primaryEnv": "BAIDU_AISEARCH_TOKEN"
      },
      "parameters": {
        "query": {"type": "string", "required": true},
        "count": {"type": "integer", "required": false, "default": 10, "range": "1-50"},
        "freshness": {"type": "string", "required": false}
      }
    },
    {
      "id": "baidu-scholar-search",
      "name": "百度学术",
      "description": "百度学术文献检索。用于学术论文、期刊、会议论文的检索。",
      "category": "search",
      "entryPoint": "tools/baidu-scholar-search/SKILL.md",
      "script": "tools/baidu-scholar-search/scripts/search.py",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["BAIDU_API_KEY", "BAIDU_AISEARCH_TOKEN"],
        "primaryEnv": "BAIDU_AISEARCH_TOKEN"
      },
      "parameters": {
        "query": {"type": "string", "required": true},
        "count": {"type": "integer", "required": false, "default": 10, "range": "1-50"},
        "freshness": {"type": "string", "required": false}
      }
    },
    {
      "id": "baidu-baike-data",
      "name": "百度百科",
      "description": "百度百科词条查询。用于概念定义、术语解释、知识查询。",
      "category": "data",
      "entryPoint": "tools/baidu-baike-data/SKILL.md",
      "script": "tools/baidu-baike-data/scripts/baike.py",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["BAIDU_API_KEY", "BAIDU_AISEARCH_TOKEN"],
        "primaryEnv": "BAIDU_AISEARCH_TOKEN"
      },
      "parameters": {
        "query": {"type": "string", "required": true}
      }
    },
    {
      "id": "file-reading",
      "name": "文件阅读",
      "description": "读取Excel(.xlsx/.xls/.et)和Word(.docx)文件内容。",
      "category": "io",
      "entryPoint": "tools/file-reading/SKILL.md",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": []
      },
      "note": "依赖 openpyxl, python-docx, xlrd, pywin32，运行 pip install -r tools/file-reading/scripts/requirements.txt 安装"
    },
    {
      "id": "paddleocr-doc-parsing",
      "name": "文档解析",
      "description": "高级文档解析（表格、公式、图表）。用于复杂PDF、扫描件的深度解析。",
      "category": "ocr",
      "entryPoint": "tools/paddleocr-doc-parsing/SKILL.md",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["PADDLEOCR_OCR_API_URL"]
      },
      "note": "需要配置PaddleOCR专属API URL"
    },
    {
      "id": "paddleocr-text-recognition",
      "name": "文字识别",
      "description": "图像/PDF文字识别（OCR）。用于提取图片或PDF中的文字内容。",
      "category": "ocr",
      "entryPoint": "tools/paddleocr-text-recognition/SKILL.md",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["PADDLEOCR_OCR_API_URL"]
      },
      "note": "需要配置PaddleOCR专属API URL"
    },
    {
      "id": "paddleocr-async",
      "name": "异步OCR",
      "description": "PaddleOCR异步API调用。用于大文件、批量文档的异步识别处理。",
      "category": "ocr",
      "entryPoint": "tools/paddleocr-async/SKILL.md",
      "script": "tools/paddleocr-async/scripts/paddleocr_async.py",
      "status": "ready",
      "requires": {
        "bins": ["python"],
        "env": ["PADDLEOCR_OCR_API_URL"]
      }
    },
    {
      "id": "document-output",
      "name": "文档输出",
      "description": "生成格式化文档（报告、论文等）。建设中。",
      "category": "io",
      "entryPoint": "tools/document-output/SKILL.md",
      "status": "wip",
      "note": "功能受限，建设中"
    }
  ],
  "workflows": [
    {
      "id": "search-r-cycle",
      "name": "SEARCH-R研究循环",
      "description": "完整的研究方法论循环：Survey -> Explore -> Analyze -> Review -> Confirm -> Harvest -> Reflect",
      "steps": [
        {"id": "S", "name": "Survey", "description": "观察调研：从实践中发现问题"},
        {"id": "E", "name": "Explore", "description": "探索检索：检索相关知识"},
        {"id": "A", "name": "Analyze", "description": "分析思考：深度理论构建"},
        {"id": "R1", "name": "Review", "description": "评审探讨：Human参与探讨"},
        {"id": "C", "name": "Confirm", "description": "确认验证：实践中验证"},
        {"id": "H", "name": "Harvest", "description": "收获产出：沉淀研究成果"},
        {"id": "R2", "name": "Reflect", "description": "反思迭代：持续优化方法"}
      ],
      "entryPoint": "methodology/search-r-cycle.md"
    }
  ],
  "directories": {
    "agents": "agents/",
    "skills": "agents/research/skills/",
    "tools": "tools/",
    "methodology": "methodology/",
    "templates": "templates/",
    "research": {
      "observations": "research/observations/",
      "retrievals": "research/retrievals/",
      "theory": "research/theory/",
      "reflections": "research/reflections/"
    },
    "references": "references/",
    "examples": "examples/"
  },
  "config": {
    "defaultAgent": "research",
    "researchDepth": {
      "target": "Level 0-2",
      "levels": {
        "L0": "第一性原理（为什么）",
        "L1": "设计原则（是什么）",
        "L2": "实现思路（怎么做）",
        "L3": "具体实现（细节）"
      }
    },
    "humanInvolvement": {
      "mode": "最小化参与",
      "triggers": ["研究方向决策", "理论验证决策", "重大反思决策"]
    },
    "documentation": {
      "required": true,
      "templates": {
        "observation": "templates/observation-template.md",
        "retrieval": "templates/retrieval-survey-template.md",
        "theory": "templates/theory-template.md",
        "reflection": "templates/reflection-template.md"
      }
    }
  },
  "currentTopic": {
    "id": "${PROJECT_NAME}",
    "name": "${PROJECT_TITLE}",
    "status": "active",
    "entryPoint": "agents/research/research-topics/${PROJECT_NAME}.md",
    "sessionLog": "agents/research/session-log.md"
  }
}
OPENCODE_JSON_EOF
print_success "已创建opencode.json配置（完整项目入口）"

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
    echo "  - 可用技能: literature-review, observation, quality-gate, theory-building, file-reading, document-output"
fi
echo ""
print_info "查看文档:"
echo "  - README.md: 项目说明"
echo "  - research/topic.md: 课题定义"
echo "  - agents/research/AGENTS.md: Agent配置"
echo "  - methodology/search-r-cycle.md: 方法论说明"
