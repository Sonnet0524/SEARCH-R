# Skills和Tools引用更新总结

## 📋 更新内容

### 问题发现

在Skills的SKILL.md文件中，发现了以下问题：

1. **错误引用web-search** - 该工具已删除
2. **混淆Skills和Tools** - file-reading等是Tools，不是Skills
3. **引用不明确** - 没有区分Skills和Tools

### 已修复文件

| 文件 | 修改内容 |
|------|---------|
| `skills/literature-review/SKILL.md` | 更新Related Skills & Tools部分 |
| `skills/observation/SKILL.md` | 更新Related Skills & Tools部分 |
| `skills/theory-building/SKILL.md` | 更新Related Skills & Tools部分 |
| `skills/quality-gate/SKILL.md` | 更新Related Skills & Tools部分 |

---

## ✅ 更新后的引用结构

### literature-review

**Related Skills**:
- observation - 基于观察发现研究问题
- theory-building - 基于文献构建理论
- quality-gate - 评估文献质量

**Related Tools**:
- baidu-scholar-search - 学术文献检索（推荐）
- baidu-search - 网络信息搜索
- baidu-baike-data - 概念定义查询
- file-reading - 解析文献文件（建设中）

---

### observation

**Related Skills**:
- literature-review - 文献支撑观察发现
- theory-building - 基于观察构建理论
- quality-gate - 验证观察质量

**Related Tools**:
- file-reading - 读取观察数据（建设中）
- paddleocr-async - OCR处理大文件
- document-output - 输出观察报告（建设中）

---

### theory-building

**Related Skills**:
- literature-review - 理论文献调研
- observation - 观察数据支撑
- quality-gate - 理论质量评估

**Related Tools**:
- baidu-scholar-search - 理论文献检索
- baidu-baike-data - 概念定义查询
- document-output - 输出理论文档（建设中）

---

### quality-gate

**Related Skills**:
- observation - 观察质量评估
- theory-building - 理论质量检验
- literature-review - 文献质量评估

**Related Tools**:
- baidu-scholar-search - 验证文献来源
- document-output - 输出评估报告（建设中）

---

## 📊 引用规则

### Skills引用Skills
✅ 允许 - 业务能力之间的协作关系

### Skills引用Tools
✅ 允许 - 明确标注为"Related Tools"
✅ 标注状态 - 已测试/建设中
✅ 推荐标注 - 推荐使用的工具

### Tools引用Skills
⚠️ 不推荐 - Tools是底层实现，不应依赖Skills

### Tools引用Tools
✅ 允许 - 工具之间可以协作

---

## 🎯 更新原则

1. **明确分类** - 区分Skills（业务能力）和Tools（底层工具）
2. **正确引用** - 只引用存在的工具
3. **状态透明** - 标注工具的测试状态
4. **推荐标注** - 标注推荐使用的工具

---

## 🔍 验证清单

- [x] 删除所有web-search引用
- [x] 区分Skills和Tools
- [x] 标注工具状态
- [x] 推荐工具标注
- [x] 保留Skills间引用
- [x] 添加相关Tools引用

---

**更新日期**: 2026-03-14  
**更新者**: SEARCH-R Framework
