# 研究课题目录

> Research Agent的研究课题配置库

**版本**: v2.0 | **更新**: 2026-03-13

---

## 📚 说明

这个目录存放Research Agent的所有研究课题配置文件。每个研究课题是一个独立的Markdown文件，记录研究过程和成果。

---

## 📁 可用模板

### 最小化模板（推荐用于快速启动）

**文件**: [topic-minimal-template.md](topic-minimal-template.md)

**特点**:
- 只包含必填字段
- 快速创建课题
- 后续逐步完善

**适用场景**:
- 首次创建研究课题
- 快速启动研究
- 不确定研究细节时

### 完整模板

**文件**: [topic-template.md](topic-template.md)

**特点**:
- 包含所有字段
- 详细的研究规划
- 完整的记录结构

**适用场景**:
- 深入研究阶段
- 需要详细规划时
- 复杂的研究课题

---

## 📝 文件命名规范

```
[课题英文名].md

示例：
- agent-collaboration.md
- quality-gates.md
- agent-memory-system.md
```

**建议**: 使用有意义且简洁的英文名称，便于引用和管理。

---

## 🚀 如何创建课题

### 方式1：对话式创建（推荐）

```
Human: "我想研究 [课题描述]"

Agent会：
1. 引导填写核心信息
2. 自动创建课题文件
3. 使用最小化模板
4. 激活课题
```

### 方式2：手动创建

1. **选择模板**
   ```bash
   # 快速启动 - 使用最小化模板
   cp topic-minimal-template.md [your-topic].md
   
   # 或使用完整模板
   cp topic-template.md [your-topic].md
   ```

2. **填写核心信息**
   - 课题名称
   - 研究背景
   - 核心问题

3. **激活课题**
   - 更新 `../current-topic.md`
   - 指向新的研究课题文件

---

## 📊 课题状态管理

### 状态定义

- **active** - 正在进行的研究
- **paused** - 暂停的研究
- **completed** - 已完成的研究

### 状态转换

```
创建 → paused (初始状态)
paused → active (激活课题)
active → paused (暂停课题)
active → completed (完成课题)
```

### 管理建议

- 同时active的课题不超过2个
- 定期回顾paused状态的课题
- 完成的课题保留用于参考
- 使用priority字段标识优先级

---

## 📊 课题清单

当前项目的研究课题：

| 课题名称 | 状态 | 优先级 | 创建日期 | 文件 |
|---------|------|--------|---------|------|
| [课题1] | active | high | YYYY-MM-DD | [topic-1.md](topic-1.md) |
| [课题2] | paused | medium | YYYY-MM-DD | [topic-2.md](topic-2.md) |
| [课题3] | completed | - | YYYY-MM-DD | [topic-3.md](topic-3.md) |

> 💡 提示：课题清单由Research Agent自动维护，或手动更新

---

## 🔄 课题切换

### 对话式切换

```
Human: "切换到 [课题名称]"

Agent会：
1. 保存当前课题进展
2. 更新课题状态
3. 切换到新课题
4. 报告新课题进展
```

### 手动切换

1. 更新当前课题状态为 `paused`
2. 更新新课题状态为 `active`
3. 更新 `../current-topic.md` 指向新课题

---

## 📖 相关文档

### 模板文档
- [最小化模板](topic-minimal-template.md) - 快速启动
- [完整模板](topic-template.md) - 详细规划

### 指导文档
- [研究课题初始化指南](../init.md) - 完整的创建和管理指南
- [Agent身份和能力](../AGENTS.md) - Research Agent核心定义
- [SEARCH-R方法论](../../methodology/search-r-cycle.md) - 研究方法论

### 工具和资源
- [快速开始指南](../../../QUICKSTART.md) - 详细使用教程
- [研究实例](../../../research-instances/README.md) - 使用案例

---

## 💡 最佳实践

### 创建课题
1. 使用对话式创建，让Agent引导
2. 先用最小化模板快速启动
3. 在研究过程中逐步完善

### 管理课题
1. 保持active课题不超过2个
2. 明确优先级，专注高优先级课题
3. 定期回顾paused课题
4. 及时更新课题进展

### 完善课题文档
1. Survey阶段 → 补充研究背景
2. Explore阶段 → 补充研究资料
3. Analyze阶段 → 补充研究计划
4. 持续更新 → 记录研究进展

---

**维护者**: Research Agent  
**更新时间**: 2026-03-13  
**版本**: v2.0
