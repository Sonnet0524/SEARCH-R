---
date: 2026-03-07
type: theory-document
subject: 记忆压缩机制 - 深入研究
depth: Level 3 (Implementation Design)
priority: P0
---

# 记忆压缩机制 - 深入研究

## 📋 研究目标

**核心目标**：设计一个可实施的记忆压缩机制，平衡信息完整性和Context优化。

**关键问题**：
1. 如何压缩？（压缩算法）
2. 保留什么？（关键信息识别）
3. 何时压缩？（触发条件）
4. 效果如何？（评估方法）

**研究深度**：Level 3 - 提供具体的实现思路和算法设计

---

## 🔍 需求分析

### 压缩场景

#### 场景1：session-log → CATCH_UP（短期→中期）

**原始文档**（session-log.md，~2k tokens）：
```markdown
# 会话日志

## [2026-03-07 10:15] 会话开始

### 任务
- 响应 Research Agent 的观察要求，创建 session-log.md 文件
- 准备启动 v1.1 Sprint 1（创建 GitHub Issues）

### 关键决策
- 接受 Research Agent 的观察要求，采用轻量级日志记录方式
- 按照指定格式创建日志，保持简洁实用

### 遇到的问题
- 无

### 与其他Agent的交互
- 接收到 Research Agent 的观察要求文档

## [2026-03-07 10:20] 启动 v1.1 Sprint 1 准备

### 任务
- 创建 GitHub Issues（TASK-AI1, TASK-AI2, TASK-TE1, TASK-TE2）
- 设置 labels 和 milestone

### 关键决策
- 开始执行 v1.1 Sprint 1 的启动流程

### 关键决策
- 创建了 4 个 GitHub Issues，分配给 AI Team 和 Test Team
- 创建了团队 labels（ai-team, test-team, core-team, integration-team）
- 创建了 Sprint 1 milestone（编号 1）
- 将任务编号从 TASK-Dx 改为 TASK-AIx，反映团队结构调整

### 遇到的问题
- milestone 参数格式问题，先创建 Issues 后添加 milestone 解决

### 与其他Agent的交互
- 无
```

**压缩目标**：
- 目标大小：~500 tokens（压缩率75%）
- 保留关键信息：决策、问题、交互
- 删除冗余：重复的会话头、详细的过程描述

**压缩后文档**（CATCH_UP.md相关部分）：
```markdown
## 最近会话摘要（2026-03-07）

### 关键决策
1. 接受 Research Agent 观察要求 → 创建 session-log.md
2. 启动 v1.1 Sprint 1 → 创建4个Issues
3. 调整任务编号规则 → TASK-AIx（反映团队结构调整）

### 遇到的问题
- milestone参数格式问题 → 先创建Issues后添加

### Agent交互
- Research Agent → 观察要求文档

### 工作进度
- ✅ session-log.md创建
- ✅ 4个GitHub Issues创建
- ✅ Labels和Milestone设置
```

---

#### 场景2：CATCH_UP → experiences（中期→长期）

**原始文档**（CATCH_UP.md，~3k tokens）：
```markdown
# PM Team - 启动文档

## Quick Status

**Last Updated**: 2026-03-06 18:00  
**Current Phase**: v1.1 Ready to Start  
**Status**: 🟢 Planning Committed

## Current Focus

**Primary Task**: v1.1规划完成，准备启动开发

**Completed Actions**:
1. ✅ 完成v1.1整体规划
2. ✅ 更新PRD（反映opencode集成架构）
3. ✅ 完成团队结构调整
   - 新建：Core Team, AI Team, Integration Team
   - 更新：PM Team, Test Team
   - 归档：Data Team, Template Team
...
```

**压缩目标**：
- 目标大小：~800 tokens（压缩率70%）
- 提取经验：成功做法、失败教训、改进建议
- 存储为经验文档

**压缩后文档**（experiences/pm/v1.1-planning.md）：
```markdown
# v1.1规划经验总结

**日期**: 2026-03-06  
**Agent**: PM Team  
**任务**: v1.1整体规划和团队调整

---

## 成功做法

### 1. PRD先行，明确架构
- 先更新PRD，明确opencode主控架构
- 避免了后续开发中的架构混乱

### 2. 团队结构调整
- 新建AI Team（专注AI能力）
- 归档Data Team（职责过重）
- 效果：职责更清晰，协作更顺畅

### 3. 配置文档完善
- 所有Team的AGENTS.md和CATCH_UP.md
- 启动脚本标准化
- 效果：启动流程清晰，减少混乱

---

## 遇到的问题

### 问题1：团队结构调整成本
- **原因**: 旧Team的文档需要迁移
- **解决**: 归档旧文档，新建Team文档
- **影响**: 增加了约20%的工作量

---

## 改进建议

### 对框架的建议
- 建立Team归档机制，避免文档混乱
- Team调整时，需要明确的迁移流程

### 对实践的建议
- 团队结构调整前，先评估影响范围
- 提前规划文档迁移策略
```

---

### 压缩需求总结

| 维度 | session→state | state→experience |
|------|--------------|------------------|
| 压缩率 | 75% | 70% |
| 信息保留率 | 90% | 85% |
| 关键信息 | 决策、问题、交互 | 经验、教训、建议 |
| 触发时机 | 会话结束 | 项目里程碑 |
| 存储格式 | Markdown摘要 | Markdown经验文档 |

---

## 💡 压缩算法设计

### 算法1：基于规则的提取式压缩

**核心思想**：定义提取规则，从原文档中提取关键信息，生成压缩文档。

#### 规则定义

**规则1：结构化提取**
```python
# session-log.md 提取规则

extract_rules = {
    "decisions": {
        "pattern": "### 关键决策",
        "action": "extract_list",
        "max_items": 5,
        "format": "list"
    },
    
    "problems": {
        "pattern": "### 遇到的问题",
        "action": "extract_content",
        "format": "summary"
    },
    
    "interactions": {
        "pattern": "### 与其他Agent的交互",
        "action": "extract_list",
        "max_items": 3,
        "format": "simple"
    },
    
    "tasks": {
        "pattern": "### 任务",
        "action": "extract_list",
        "max_items": 5,
        "format": "list"
    }
}
```

**规则2：去重和合并**
```python
# 去重规则

dedup_rules = {
    "remove_duplicates": True,
    "merge_similar": True,
    "similarity_threshold": 0.8,  # 相似度阈值
    "merge_strategy": "keep_latest"  # 保留最新的
}
```

**规则3：关键信息优先级**
```python
# 优先级规则

priority_rules = {
    "P0": ["关键决策", "阻塞问题"],  # 必须保留
    "P1": ["与其他Agent的交互", "遇到的问题"],  # 推荐保留
    "P2": ["任务", "会话开始时间"],  # 可选保留
    "P3": ["详细过程", "重复信息"]  # 可以删除
}
```

#### 算法流程

```
输入：原始文档（session-log.md）

Step 1: 解析文档结构
  - 识别章节标题（##、###）
  - 提取章节内容
  - 构建文档树

Step 2: 应用提取规则
  - 对每个章节应用对应规则
  - 提取关键信息
  - 过滤优先级低的信息

Step 3: 去重和合并
  - 检查重复信息
  - 合并相似内容
  - 保留最新信息

Step 4: 生成压缩文档
  - 按照模板格式组织
  - 生成Markdown文档
  - 输出压缩文档

输出：压缩文档（CATCH_UP.md更新部分）
```

#### 实现示例

```python
def compress_session_to_state(session_log_path):
    """压缩session-log到CATCH_UP"""
    
    # Step 1: 读取session-log
    with open(session_log_path, 'r') as f:
        content = f.read()
    
    # Step 2: 解析结构
    sections = parse_markdown_sections(content)
    
    # Step 3: 提取关键信息
    extracted = {
        "decisions": extract_by_rule(sections, "关键决策"),
        "problems": extract_by_rule(sections, "遇到的问题"),
        "interactions": extract_by_rule(sections, "与其他Agent的交互"),
        "tasks": extract_by_rule(sections, "任务")
    }
    
    # Step 4: 去重
    deduplicated = deduplicate(extracted)
    
    # Step 5: 生成压缩文档
    compressed = generate_compressed_doc(deduplicated)
    
    return compressed

def extract_by_rule(sections, rule_name):
    """根据规则提取信息"""
    rule = extract_rules.get(rule_name)
    if not rule:
        return []
    
    # 查找匹配的章节
    matched_sections = find_sections(sections, rule["pattern"])
    
    # 提取内容
    items = []
    for section in matched_sections:
        if rule["action"] == "extract_list":
            items.extend(extract_list_items(section))
        elif rule["action"] == "extract_content":
            items.append(extract_paragraph(section))
    
    # 限制数量
    if rule.get("max_items"):
        items = items[:rule["max_items"]]
    
    return items
```

#### 优势与劣势

**优势**：
- ✅ 不需要LLM，成本低
- ✅ 规则可控，结果可预测
- ✅ 实施简单，易于维护
- ✅ 处理速度快

**劣势**：
- ⚠️ 规则需要预先定义
- ⚠️ 灵活性受限
- ⚠️ 无法处理非结构化内容
- ⚠️ 可能遗漏隐含信息

---

### 算法2：基于模板的压缩

**核心思想**：定义压缩模板，将原文档信息映射到模板字段。

#### 模板设计

**session→state模板**：
```yaml
template_name: "session-to-state-compression"

sections:
  - name: "会话摘要"
    fields:
      - key: "date"
        source: "会话日期"
        extraction: "first_match"
        pattern: "\\[(\\d{4}-\\d{2}-\\d{2})"
        
      - key: "decisions"
        source: "关键决策"
        extraction: "list_items"
        max_items: 5
        
      - key: "problems"
        source: "遇到的问题"
        extraction: "paragraph"
        max_length: 200
        
      - key: "interactions"
        source: "与其他Agent的交互"
        extraction: "list_items"
        max_items: 3

output_format: |
  ## 最近会话摘要（{{date}}）
  
  ### 关键决策
  {% for decision in decisions %}
  {{loop.index}}. {{decision}}
  {% endfor %}
  
  ### 遇到的问题
  {{problems}}
  
  ### Agent交互
  {% for interaction in interactions %}
  - {{interaction}}
  {% endfor %}
```

**state→experience模板**：
```yaml
template_name: "state-to-experience-compression"

sections:
  - name: "经验总结"
    fields:
      - key: "task"
        source: "Current Focus"
        extraction: "first_paragraph"
        
      - key: "successes"
        source: "Completed Actions"
        extraction: "list_items"
        filter: "successful"
        
      - key: "failures"
        source: "遇到的问题"
        extraction: "list_items"
        filter: "problematic"
        
      - key: "suggestions"
        source: "改进建议"
        extraction: "generate"  # 需要简单的生成逻辑

output_format: |
  # {{task}} - 经验总结
  
  **日期**: {{date}}
  **Agent**: {{agent}}
  
  ---
  
  ## 成功做法
  {% for success in successes %}
  ### {{loop.index}}. {{success.title}}
  - **做法**: {{success.content}}
  - **效果**: {{success.effect}}
  {% endfor %}
  
  ---
  
  ## 遇到的问题
  {% for failure in failures %}
  ### 问题{{loop.index}}: {{failure.title}}
  - **原因**: {{failure.cause}}
  - **解决**: {{failure.solution}}
  - **影响**: {{failure.impact}}
  {% endfor %}
  
  ---
  
  ## 改进建议
  {{suggestions}}
```

#### 算法流程

```
输入：原始文档 + 模板

Step 1: 加载模板
  - 解析模板定义
  - 识别字段映射规则

Step 2: 提取字段
  - 按照模板规则提取字段
  - 应用过滤和限制
  - 生成字段数据

Step 3: 渲染模板
  - 使用字段数据渲染模板
  - 生成Markdown文档

输出：压缩文档
```

#### 实现示例

```python
def compress_with_template(document_path, template_name):
    """基于模板的压缩"""
    
    # Step 1: 加载模板
    template = load_template(template_name)
    
    # Step 2: 读取文档
    with open(document_path, 'r') as f:
        content = f.read()
    
    # Step 3: 提取字段
    fields = {}
    for section in template["sections"]:
        for field in section["fields"]:
            value = extract_field(content, field)
            fields[field["key"]] = value
    
    # Step 4: 渲染模板
    compressed = render_template(template["output_format"], fields)
    
    return compressed

def extract_field(content, field):
    """提取字段值"""
    extraction = field["extraction"]
    
    if extraction == "first_match":
        # 正则匹配第一个
        match = re.search(field["pattern"], content)
        return match.group(1) if match else ""
    
    elif extraction == "list_items":
        # 提取列表项
        items = extract_list_items(content, field["source"])
        if field.get("max_items"):
            items = items[:field["max_items"]]
        return items
    
    elif extraction == "paragraph":
        # 提取段落
        para = extract_paragraph(content, field["source"])
        if field.get("max_length"):
            para = para[:field["max_length"]]
        return para
```

#### 优势与劣势

**优势**：
- ✅ 格式标准化
- ✅ 易于维护和扩展
- ✅ 输出格式统一
- ✅ 不需要LLM

**劣势**：
- ⚠️ 模板需要预先设计
- ⚠️ 字段映射可能不灵活
- ⚠️ 难以处理非标准格式

---

### 算法3：基于重要性的分层压缩

**核心思想**：将记忆分为多层，每层保留不同重要性的信息，按需加载。

#### 分层设计

```
Layer 0: 完整记忆（原始文档）
  - 内容：完整的session-log.md、CATCH_UP.md
  - 大小：原始大小
  - 加载：仅在需要详细查看时
  
Layer 1: 摘要记忆（压缩文档）
  - 内容：提取的关键信息摘要
  - 大小：原始的30-40%
  - 加载：推荐默认加载
  
Layer 2: 要点记忆（关键点）
  - 内容：最重要的决策和问题
  - 大小：原始的10-15%
  - 加载：快速回顾时
  
Layer 3: 索引记忆（元信息）
  - 内容：日期、关键词、统计
  - 大小：原始的1-2%
  - 加载：启动时默认加载
```

#### 示例

**原始文档**（session-log.md，Layer 0，~2000 tokens）：
```markdown
[完整的会话日志，包含所有细节]
```

**摘要记忆**（Layer 1，~700 tokens）：
```markdown
## 会话摘要（2026-03-07）

### 关键决策
1. 接受 Research Agent 观察要求 → 创建 session-log.md
2. 启动 v1.1 Sprint 1 → 创建4个Issues
3. 调整任务编号规则 → TASK-AIx

### 遇到的问题
- milestone参数格式问题 → 先创建Issues后添加

### Agent交互
- Research Agent → 观察要求文档

### 工作进度
- ✅ session-log.md创建
- ✅ 4个GitHub Issues创建
```

**要点记忆**（Layer 2，~200 tokens）：
```markdown
# 要点（2026-03-07）

决策：
1. 接受Research Agent观察要求
2. 启动v1.1 Sprint 1
3. 调整任务编号规则

问题：milestone参数格式
状态：已解决
```

**索引记忆**（Layer 3，~30 tokens）：
```yaml
date: "2026-03-07"
decisions: 3
problems: 1
interactions: 1
keywords: [Sprint, Research, Issue]
status: "completed"
```

#### 加载策略

```python
class MemoryLoader:
    """记忆加载器"""
    
    def load_for_startup(self):
        """启动时加载"""
        # 只加载Layer 3（索引）
        return self.load_layer(3)
    
    def load_for_quick_review(self):
        """快速回顾时加载"""
        # 加载Layer 3 + Layer 2
        return self.load_layer(3) + self.load_layer(2)
    
    def load_for_normal_work(self):
        """正常工作时加载"""
        # 加载Layer 3 + Layer 1
        return self.load_layer(3) + self.load_layer(1)
    
    def load_for_detailed_check(self):
        """详细检查时加载"""
        # 加载所有层
        return self.load_all_layers()
```

#### 压缩流程

```
Layer 0 → Layer 1：
  - 应用规则提取
  - 生成摘要文档
  - 压缩率：60-70%

Layer 1 → Layer 2：
  - 提取关键点
  - 简化表述
  - 压缩率：70-80%

Layer 2 → Layer 3：
  - 提取元信息
  - 统计和索引
  - 压缩率：80-90%
```

#### 优势与劣势

**优势**：
- ✅ 灵活加载，按需使用
- ✅ 平衡完整性和效率
- ✅ 支持渐进式了解
- ✅ Context优化明显

**劣势**：
- ⚠️ 实施复杂度高
- ⚠️ 存储空间增加
- ⚠️ 管理成本高
- ⚠️ 需要维护多个版本

---

## 🔬 算法对比

### 对比维度

| 维度 | 规则提取 | 模板压缩 | 分层压缩 |
|------|---------|---------|---------|
| 实施复杂度 | ⭐⭐ 简单 | ⭐⭐⭐ 中等 | ⭐⭐⭐⭐⭐ 复杂 |
| 压缩率 | 70-75% | 65-70% | 60-90%（多层） |
| 信息保留率 | 85-90% | 80-85% | 95%+（分层保留） |
| 灵活性 | ⭐⭐ 一般 | ⭐⭐⭐ 中等 | ⭐⭐⭐⭐⭐ 高 |
| Context优化 | ⭐⭐⭐ 好 | ⭐⭐⭐ 好 | ⭐⭐⭐⭐⭐ 优秀 |
| 维护成本 | ⭐⭐ 低 | ⭐⭐⭐ 中等 | ⭐⭐⭐⭐⭐ 高 |
| 需要LLM | ❌ 否 | ❌ 否 | ❌ 否 |

### 适用场景

**规则提取**：
- ✅ 适合：结构化文档、固定格式
- ✅ 适合：快速实施、低成本
- ❌ 不适合：非结构化内容、灵活格式

**模板压缩**：
- ✅ 适合：标准化输出、统一格式
- ✅ 适合：可预测的文档结构
- ❌ 不适合：高度变化的格式

**分层压缩**：
- ✅ 适合：长期记忆、频繁查阅
- ✅ 适合：Context优化需求高
- ❌ 不适合：短期项目、快速迭代

---

## 💡 推荐方案

### 方案：混合策略

**核心思想**：结合三种算法的优点，分阶段实施。

#### Phase 1：规则提取（立即实施）

**目标**：快速实现基础压缩能力

**实施方案**：
```
1. 定义提取规则
   - 关键决策提取规则
   - 问题提取规则
   - 交互提取规则
   
2. 实现基础压缩函数
   - session-log → CATCH_UP压缩
   - 简单的去重和合并
   
3. 手动触发压缩
   - Agent执行`compress_session()`命令
   - 生成压缩文档
   - Human审核确认
```

**预期效果**：
- 压缩率：70%
- 信息保留率：85%
- 实施时间：1周

---

#### Phase 2：模板标准化（短期实施）

**目标**：标准化压缩输出格式

**实施方案**：
```
1. 设计压缩模板
   - session→state模板
   - state→experience模板
   
2. 优化提取规则
   - 结合模板字段
   - 提高信息保留率
   
3. 半自动压缩
   - Agent自动执行压缩
   - 生成标准格式文档
   - Human抽检审核
```

**预期效果**：
- 压缩率：70%
- 信息保留率：90%
- 实施时间：2周

---

#### Phase 3：分层优化（长期优化）

**目标**：实现分层记忆，优化Context

**实施方案**：
```
1. 实现Layer 0-1压缩
   - 完整记忆 → 摘要记忆
   - 按需加载机制
   
2. 实现Layer 2-3压缩
   - 要点记忆、索引记忆
   - 启动时默认加载Layer 3
   
3. 自动压缩
   - 自动触发压缩
   - 自动维护多层记忆
   - 按需加载优化Context
```

**预期效果**：
- 压缩率：60-90%（多层）
- 信息保留率：95%+
- Context优化：50-70%
- 实施时间：4周

---

## 📋 关键信息识别规则

### 规则定义

#### 决策信息识别

**定义**：
```
关键决策 = 影响范围 × 不可逆性 × 重要性

影响范围：
  - 项目级：影响整个项目（权重：3）
  - Sprint级：影响当前Sprint（权重：2）
  - 任务级：影响当前任务（权重：1）

不可逆性：
  - 不可逆：难以撤销（权重：3）
  - 难撤销：需要成本（权重：2）
  - 可逆：容易撤销（权重：1）

重要性：
  - 关键：必须保留（权重：3）
  - 重要：应该保留（权重：2）
  - 一般：可以保留（权重：1）

关键决策阈值：总分 ≥ 6
```

**识别规则**：
```python
def identify_key_decision(decision_text):
    """识别关键决策"""
    
    # 计算分数
    scope_score = calculate_scope(decision_text)
    reversibility_score = calculate_reversibility(decision_text)
    importance_score = calculate_importance(decision_text)
    
    total_score = scope_score * reversibility_score * importance_score
    
    # 判断是否关键决策
    return total_score >= 6

def calculate_scope(text):
    """计算影响范围分数"""
    project_keywords = ["架构", "团队", "规划", "方向"]
    sprint_keywords = ["Sprint", "任务", "里程碑"]
    
    if any(kw in text for kw in project_keywords):
        return 3
    elif any(kw in text for kw in sprint_keywords):
        return 2
    else:
        return 1

def calculate_reversibility(text):
    """计算不可逆性分数"""
    irreversible_keywords = ["创建", "删除", "归档", "合并"]
    hard_keywords = ["重构", "调整", "迁移"]
    
    if any(kw in text for kw in irreversible_keywords):
        return 3
    elif any(kw in text for kw in hard_keywords):
        return 2
    else:
        return 1

def calculate_importance(text):
    """计算重要性分数"""
    critical_keywords = ["阻塞", "关键", "必须"]
    important_keywords = ["重要", "注意", "建议"]
    
    if any(kw in text for kw in critical_keywords):
        return 3
    elif any(kw in text for kw in important_keywords):
        return 2
    else:
        return 1
```

---

#### 问题信息识别

**定义**：
```
关键问题 = 影响程度 × 紧急程度 × 解决难度

影响程度：
  - 严重：阻塞关键任务（权重：3）
  - 中等：影响进度（权重：2）
  - 轻微：不影响进度（权重：1）

紧急程度：
  - 紧急：立即需要解决（权重：3）
  - 一般：短期需要解决（权重：2）
  - 不紧急：长期解决（权重：1）

解决难度：
  - 困难：需要协调或协助（权重：3）
  - 中等：需要时间研究（权重：2）
  - 容易：快速解决（权重：1）

关键问题阈值：总分 ≥ 6
```

---

#### 经验信息识别

**定义**：
```
关键经验 = 复用价值 × 学习价值 × 独特性

复用价值：
  - 高：可复用于多个场景（权重：3）
  - 中：可复用于类似场景（权重：2）
  - 低：场景特定（权重：1）

学习价值：
  - 高：重要的经验教训（权重：3）
  - 中：有参考价值（权重：2）
  - 低：常规经验（权重：1）

独特性：
  - 高：独特的方法或思路（权重：3）
  - 中：有一定创新（权重：2）
  - 低：常规做法（权重：1）

关键经验阈值：总分 ≥ 6
```

---

## ⏰ 触发条件设计

### 触发机制

#### 时间触发

```yaml
# 时间触发规则

session_to_state:
  trigger: "session_end"
  delay: 30  # 分钟
  condition: "会话结束后30分钟"
  
state_to_experience:
  trigger: "milestone_complete"
  delay: 0  # 立即
  condition: "里程碑完成后"
```

#### 大小触发

```yaml
# 大小触发规则

session_log:
  max_size: 3000  # tokens
  trigger: "超过3000 tokens时压缩"
  
catch_up:
  max_size: 5000  # tokens
  trigger: "超过5000 tokens时压缩到experiences"
```

#### 事件触发

```yaml
# 事件触发规则

events:
  - name: "task_complete"
    trigger: "任务完成"
    action: "compress_session"
    
  - name: "sprint_end"
    trigger: "Sprint结束"
    action: "compress_catch_up_to_experience"
    
  - name: "release_complete"
    trigger: "Release完成"
    action: "full_compression"
```

#### 手动触发

```yaml
# 手动触发

manual_commands:
  - command: "compress session"
    action: "压缩当前会话"
    
  - command: "compress state"
    action: "压缩状态记忆"
    
  - command: "compress experience"
    action: "提取经验记忆"
```

---

## 📊 评估方法

### 压缩质量指标

#### 指标1：压缩率

```python
def calculate_compression_ratio(original, compressed):
    """计算压缩率"""
    original_tokens = count_tokens(original)
    compressed_tokens = count_tokens(compressed)
    
    ratio = (original_tokens - compressed_tokens) / original_tokens
    return ratio

# 目标：压缩率 60-75%
```

#### 指标2：信息保留率

```python
def calculate_retention_rate(original, compressed, key_info):
    """计算关键信息保留率"""
    # 提取关键信息
    key_info_in_original = extract_key_info(original)
    key_info_in_compressed = extract_key_info(compressed)
    
    # 计算保留率
    retained = len(set(key_info_in_compressed) & set(key_info_in_original))
    total = len(key_info_in_original)
    
    rate = retained / total
    return rate

# 目标：保留率 > 85%
```

#### 指标3：信息完整性

```python
def calculate_completeness(compressed, original):
    """计算信息完整性"""
    # 检查关键信息是否完整
    checks = [
        check_decisions_complete,
        check_problems_complete,
        check_interactions_complete
    ]
    
    scores = [check(compressed, original) for check in checks]
    completeness = sum(scores) / len(scores)
    
    return completeness

# 目标：完整性 > 80%
```

#### 指标4：可读性

```python
def calculate_readability(compressed):
    """计算可读性"""
    # 使用可读性指标（Flesch-Kincaid等）
    readability_score = flesch_kincaid_grade(compressed)
    
    # 目标：可读性良好（6-8年级水平）
    return readability_score
```

---

### 评估流程

```
Step 1: 压缩前评估
  - 统计原始文档大小
  - 提取关键信息列表
  - 记录关键信息

Step 2: 执行压缩
  - 应用压缩算法
  - 生成压缩文档

Step 3: 压缩后评估
  - 统计压缩文档大小
  - 计算压缩率
  - 提取压缩文档中的关键信息
  - 计算保留率
  - 检查完整性
  - 评估可读性

Step 4: 生成评估报告
  - 压缩率：XX%
  - 保留率：XX%
  - 完整性：XX%
  - 可读性：XX
  - 总体评分：XX/100

Step 5: 反馈和优化
  - 如果评分 < 80，调整压缩参数
  - 重新执行压缩
  - 直到评分 ≥ 80
```

---

## 🎯 最终推荐方案

### 实施路径

```
Phase 1（1周）：规则提取
  ├─ 定义提取规则（决策、问题、交互）
  ├─ 实现基础压缩函数
  └─ 手动触发 + 人工审核

Phase 2（2周）：模板标准化
  ├─ 设计压缩模板
  ├─ 优化提取规则
  └─ 半自动压缩 + 抽检审核

Phase 3（4周）：分层优化
  ├─ 实现Layer 0-1压缩
  ├─ 实现Layer 2-3压缩
  └─ 自动压缩 + 按需加载
```

### 核心算法

**推荐**：规则提取 + 模板标准化（Phase 1-2）

**原因**：
1. ✅ 实施简单，成本低
2. ✅ 不需要LLM
3. ✅ 效果可控
4. ✅ 易于维护

**长期优化**：分层压缩（Phase 3）

**原因**：
1. ✅ Context优化明显
2. ✅ 按需加载灵活
3. ✅ 信息完整性好
4. ⚠️ 但实施复杂，需要逐步推进

---

## 📝 给PM的实施建议

### 立即可实施（Phase 1）

#### 任务1：定义提取规则

创建文件：`framework/compression/extract-rules.yaml`

```yaml
# 记忆压缩提取规则

session_to_state:
  decisions:
    pattern: "### 关键决策"
    action: "extract_list"
    max_items: 5
    
  problems:
    pattern: "### 遇到的问题"
    action: "extract_content"
    max_length: 200
    
  interactions:
    pattern: "### 与其他Agent的交互"
    action: "extract_list"
    max_items: 3
```

#### 任务2：创建压缩模板

创建文件：`framework/compression/templates/session-to-state.yaml`

```yaml
template_name: "session-to-state"

output_format: |
  ## 最近会话摘要（{{date}}）
  
  ### 关键决策
  {% for decision in decisions %}
  {{loop.index}}. {{decision}}
  {% endfor %}
  
  ### 遇到的问题
  {{problems}}
  
  ### Agent交互
  {% for interaction in interactions %}
  - {{interaction}}
  {% endfor %}
```

#### 任务3：实现压缩函数（伪代码/文档）

创建文件：`framework/compression/README.md`

```markdown
# 记忆压缩机制

## 使用方法

### 手动压缩session-log

Agent执行压缩命令：
```bash
compress session-log
```

压缩后更新到CATCH_UP.md。

## 压缩规则

详见：`extract-rules.yaml`
```

---

## 💬 需要讨论的问题

### 问题1：压缩自动化程度

**选项**：
- A. 完全手动（Agent执行命令，Human审核）
- B. 半自动（自动执行，Human抽检）
- C. 完全自动（自动执行，无需审核）

**我的建议**：先A后B（Phase 1手动，Phase 2半自动）

---

### 问题2：关键信息识别规则

**讨论点**：
- 决策重要性评分规则是否合理？
- 问题严重程度评分规则是否合理？
- 阈值设置是否合理？

**我的建议**：先使用简单规则，在实践中调整

---

### 问题3：分层压缩的必要性

**讨论点**：
- 是否需要Layer 0-3分层？
- 还是Layer 0-1即可？
- Context优化需求有多强？

**我的建议**：先实现Layer 0-1，观察效果后再决定是否需要Layer 2-3

---

**研究完成时间**: 2026-03-07  
**研究深度**: Level 3（实现思路）  
**状态**: 研究完成，可进入实施阶段  
**下一步**: 交付给PM，开始Phase 1实施
