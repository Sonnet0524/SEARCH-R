# 研究课题目录

> Research Agent的多个研究课题管理

---

## 📚 说明

这个目录存放Research Agent的所有研究课题配置文件。每个研究课题是一个独立的Markdown文件，包含研究背景、目标、进展等信息。

---

## 📁 文件命名规范

```
[课题英文名].md

示例：
- agent-collaboration.md
- quality-gates.md
- agent-memory-system.md
```

---

## 🚀 如何使用

### 创建新研究课题

1. **复制模板**
   ```bash
   cp topic-template.md [your-topic].md
   ```

2. **填写内容**
   - 研究背景
   - 研究目标
   - 研究范围
   - 等等

3. **激活课题**
   - 更新 `../current-topic.md`
   - 指向新的研究课题文件

### 切换研究课题

1. **更新 `../current-topic.md`**
   - 修改 `current_topic` 字段
   - 更新快速链接

2. **读取新课题**
   - 研究Agent会自动读取新的课题配置

### 管理多个课题

- 使用status字段标记课题状态
- 定期回顾paused状态的课题
- 完成的课题保留用于参考

---

## 📊 当前课题列表

| 课题名称 | 状态 | 优先级 | 文件 |
|---------|------|--------|------|
| Agent协作框架 | active | high | [agent-collaboration.md](agent-collaboration.md) |

---

## 🎯 课题状态说明

- **active** - 正在进行的研究
- **paused** - 暂停的研究
- **completed** - 已完成的研究

---

## 📖 相关文档

- [研究课题初始化指南](../init.md)
- [Agent身份和能力](../AGENTS.md)
- [课题模板](topic-template.md)

---

**维护者**: Research Agent  
**更新时间**: 2026-03-07
