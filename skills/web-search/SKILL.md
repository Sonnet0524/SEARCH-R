---
name: web-search
description: 执行网络搜索获取实时信息。当用户要求"搜索"、"查找"、"检索"、"查一下"实时信息、新闻、技术文档时触发。
trigger: on_demand
tags: 搜索, 信息检索, API工具
---

# Web Search Skill

执行网络搜索，从搜索引擎获取实时信息。

## Execution Flow

1. 接收搜索请求，解析查询意图
2. 构建搜索参数（查询词、结果数量、过滤条件）
3. 调用搜索API
4. 解析响应，返回结构化结果

## Tool Call

```python
from skills.web_search.scripts.search_api import search

# 执行搜索
result = search(
    query="搜索关键词",
    top_k=10,
    site_filter=["docs.python.org"],  # 可选
    recency="month"                     # 可选: week/month/year
)

# 处理结果
if result["success"]:
    for item in result["items"]:
        print(f"{item['title']}: {item['url']}")
```

## Key Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| query | required | 搜索关键词 |
| top_k | 10 | 返回结果数量 |
| site_filter | None | 指定站点列表 |
| recency | None | 时效过滤：week/month/year |

## Result Structure

### Success
```json
{
  "success": true,
  "items": [
    {
      "title": "标题",
      "url": "https://...",
      "snippet": "摘要...",
      "date": "2026-03-10"
    }
  ],
  "total": 100
}
```

### Error
```json
{
  "success": false,
  "error": "错误信息"
}
```

## Usage Patterns

### Pattern 1: 实时新闻搜索
```
User: "搜索最近AI领域的大新闻"

→ search(query="AI人工智能 最新进展", recency="week")
→ 返回最近一周的相关新闻
```

### Pattern 2: 技术文档搜索
```
User: "查找Python异步编程教程"

→ search(query="Python asyncio 教程", top_k=15)
→ 返回技术教程和文档
```

### Pattern 3: 特定站点搜索
```
User: "在python官网查asyncio文档"

→ search(query="asyncio", site_filter=["docs.python.org"])
→ 只返回官方文档
```

## API Configuration

需要配置API Key：

```bash
export SEARCH_API_KEY="your_api_key"
# 或使用百度搜索
export BAIDU_AISEARCH_TOKEN="your_baidu_token"
```

## Limitations

- 需要网络连接
- 需要有效的API Key
- 部分内容可能需要付费访问

## References

- `references/api-reference.md` - API详细文档
- `references/best-practices.md` - 搜索技巧
- `scripts/search_api.py` - 搜索API实现
