# Skills 目录

本目录包含Research Agent的可复用能力模块。

## 📦 已集成Skills

### 1. 百度搜索能力 (baidu-search)

**功能**: 通过百度千帆平台API进行实时信息检索

**使用方式**:
```python
import sys
sys.path.insert(0, r'D:\opencode\github\SEARCH-R\agents\research\skills')
from baidu_web_search_api import BaiduWebSearch

# 创建客户端
client = BaiduWebSearch()

# 执行搜索
result = client.search(
    query="搜索关键词",
    top_k=10,
    resource_types=["web"],
    recency_filter="month"
)

# 处理结果
if result["success"]:
    for ref in result["references"]:
        print(f"标题: {ref['title']}")
        print(f"URL: {ref['url']}")
        print(f"内容: {ref['content'][:200]}...")
```

**命令行使用**:
```bash
cd D:\opencode\github\SEARCH-R
python agents\research\skills\baidu_web_search_api.py --query "关键词" --top_k 10
```

**特性**:
- ✅ 支持网页、视频、图片搜索
- ✅ 支持站点过滤
- ✅ 支持时效过滤（最近7天/30天/180天/365天）
- ✅ 自动记录搜索日志到 `search-logs/` 目录
- ✅ 支持standard和lite两种搜索版本

**文档**: [baidu-search.md](./baidu-search.md)

**实现**: [baidu_web_search_api.py](./baidu_web_search_api.py)

---

### 2. 文献检索能力 (literature-review)

**功能**: 系统化检索和分析文献

**文档**: [literature-review.md](./literature-review.md)

---

### 3. 观察能力 (observation)

**功能**: 系统化观察和记录

**文档**: [observation.md](./observation.md)

---

### 4. 理论构建能力 (theory-building)

**功能**: 构建和验证理论框架

**文档**: [theory-building.md](./theory-building.md)

---

### 5. 质量门控能力 (quality-gate)

**功能**: 评估研究质量

**文档**: [quality-gate.md](./quality-gate.md)

---

## 🔧 API密钥配置

百度搜索API需要在 `.env.local` 文件中配置：

```bash
BAIDU_AISEARCH_TOKEN=your_api_key_here
```

**获取方式**:
1. 访问 [百度千帆平台](https://console.bce.baidu.com/qianfan/ais/console/onlineTest)
2. 创建应用并获取API Key
3. 配置到 `.env.local` 文件

**安全注意**:
- ⚠️ 请勿将 `.env.local` 文件提交到版本控制
- ✅ `.gitignore` 已包含 `.env.local`

---

## 📊 搜索日志

所有搜索记录自动保存在 `search-logs/` 目录：
- 文件格式：`YYYY-MM-DD.jsonl`
- 每行一条记录，包含时间戳、查询、结果数量、响应时间

---

## 📝 添加新Skill

要添加新的Skill：

1. 在 `skills/` 目录创建技能文档 `[skill-name].md`
2. 可选：创建Python实现文件 `[skill_name].py`
3. 在 `opencode.json` 的 `skills` 数组中添加技能名称

**Skill文档模板**:
```markdown
---
skill: skill-name
category: tool
depends_on: []
---

# Skill名称

> 简短描述

## 📋 能力定义

详细说明技能的功能和使用场景。

## 🎯 使用场景

列出适用的场景。

## 🔧 使用方法

提供具体的使用示例。

## 📚 参考资料

列出相关文档和资源。
```

---

**维护者**: Research Agent  
**更新时间**: 2026-03-11  
**集成状态**: ✅ 百度搜索API已集成
