---
skill: baidu-search
category: tool
depends_on: []
api_endpoint: https://qianfan.baidubce.com/v2/ai_search/web_search
api_method: POST
---

# 百度搜索能力

> 通过百度千帆平台调用百度搜索API，获取实时全网信息

---

## 📋 能力定义

使用百度搜索（BaiduSearch）API进行实时信息检索，支持：
- **网页搜索**：全网实时信息检索
- **多模态搜索**：网页、视频、图片、阿拉丁内容
- **高级过滤**：站点过滤、时效过滤、屏蔽站点
- **高权威性**：基于百度搜索能力，海量内容站点

## 🎯 使用场景

- 需要获取最新的实时信息
- 需要搜索新闻、技术文档、教程等
- 需要在特定站点内搜索
- 需要按时间范围筛选结果
- 需要多模态搜索（网页、视频、图片）

## 🔧 API配置

### 接口信息

| 项目 | 内容 |
|------|------|
| **API端点** | `https://qianfan.baidubce.com/v2/ai_search/web_search` |
| **请求方法** | POST |
| **Content-Type** | application/json |
| **认证方式** | Bearer Token |

### 认证配置

需要在环境变量或配置文件中设置`BAIDU_AISEARCH_TOKEN`：

```bash
# 方式1：环境变量
export BAIDU_AISEARCH_TOKEN="your_api_key"

# 方式2：.env.local文件
BAIDU_AISEARCH_TOKEN=your_api_key
```

## 🛠️ 请求参数

### 基础参数

| 参数 | 类型 | 必须 | 说明 |
|------|------|------|------|
| **messages** | array | ✅ 是 | 搜索输入，包含role和content |
| **search_source** | string | ❌ 否 | 固定值：`baidu_search_v2` |
| **edition** | string | ❌ 否 | 搜索版本：`standard`（完整版）或`lite`（简化版） |

### Messages对象

```json
{
  "messages": [
    {
      "content": "搜索关键词",
      "role": "user"
    }
  ]
}
```

### 资源类型过滤（resource_type_filter）

| 类型 | top_k范围 | 说明 |
|------|-----------|------|
| **web** | 1-50 | 网页搜索 |
| **video** | 1-10 | 视频搜索 |
| **image** | 1-30 | 图片搜索 |
| **aladdin** | 1-5 | 阿拉丁内容 |

```json
{
  "resource_type_filter": [
    {"type": "web", "top_k": 20},
    {"type": "video", "top_k": 5}
  ]
}
```

### 站点过滤（search_filter）

```json
{
  "search_filter": {
    "match": {
      "site": ["www.weather.com.cn", "news.baidu.com"]
    }
  }
}
```

### 时效过滤（search_recency_filter）

| 值 | 时间范围 |
|------|---------|
| **week** | 最近7天 |
| **month** | 最近30天 |
| **semiyear** | 最近180天 |
| **year** | 最近365天 |

## 📝 使用示例

### 基础搜索示例

```python
import requests

url = "https://qianfan.baidubce.com/v2/ai_search/web_search"
headers = {
    "Authorization": "Bearer YOUR_API_KEY",
    "Content-Type": "application/json"
}

payload = {
    "messages": [
        {
            "content": "国家电网 优质服务举措",
            "role": "user"
        }
    ],
    "search_source": "baidu_search_v2",
    "resource_type_filter": [
        {"type": "web", "top_k": 10}
    ]
}

response = requests.post(url, headers=headers, json=payload)
result = response.json()
```

### 站点过滤示例

```python
payload = {
    "messages": [
        {
            "content": "河北各个城市最近的天气",
            "role": "user"
        }
    ],
    "search_source": "baidu_search_v2",
    "resource_type_filter": [
        {"type": "web", "top_k": 10}
    ],
    "search_filter": {
        "match": {
            "site": ["www.weather.com.cn"]
        }
    }
}
```

### 时效过滤示例

```python
payload = {
    "messages": [
        {
            "content": "人工智能最新发展趋势",
            "role": "user"
        }
    ],
    "search_source": "baidu_search_v2",
    "resource_type_filter": [
        {"type": "web", "top_k": 10}
    ],
    "search_recency_filter": "month"  # 最近30天
}
```

### 多模态搜索示例

```python
payload = {
    "messages": [
        {
            "content": "Python机器学习教程",
            "role": "user"
        }
    ],
    "search_source": "baidu_search_v2",
    "resource_type_filter": [
        {"type": "web", "top_k": 10},
        {"type": "video", "top_k": 5},
        {"type": "image", "top_k": 3}
    ]
}
```

## 📤 响应参数

### 成功响应

```json
{
    "request_id": "ca749cb1-26db-4ff6-9735-f7b472d59003",
    "references": [
        {
            "id": 1,
            "title": "网页标题",
            "url": "https://example.com",
            "content": "网页内容片段...",
            "date": "2026-03-10 08:30:00",
            "icon": null,
            "web_anchor": "网站锚文本",
            "website": "站点名称",
            "type": "web",
            "rerank_score": 0.95,
            "authority_score": 0.88,
            "image": null,
            "video": null
        }
    ]
}
```

### Reference对象说明

| 字段 | 类型 | 说明 |
|------|------|------|
| **id** | int | 引用编号 |
| **title** | string | 网页标题 |
| **url** | string | 网页地址 |
| **content** | string | 网页内容片段（2000字以内） |
| **date** | string | 网页日期 |
| **type** | string | 资源类型：web/video/image/aladdin |
| **rerank_score** | float | 相关性评分（0-1） |
| **authority_score** | float | 权威性评分（0-1） |

## 💡 最佳实践

### 1. 参数选择指南

| 场景 | 推荐配置 |
|------|---------|
| **新闻资讯** | resource_type=[web], recency=week/month |
| **技术文档** | resource_type=[web], edition=standard |
| **视频教程** | resource_type=[web, video] |
| **特定站点** | 添加search_filter.match.site |
| **快速搜索** | edition=lite, top_k=5-10 |

### 2. 性能优化

- **使用lite版本**：时延表现更好，适合快速搜索
- **控制top_k**：不要设置过大的返回数量
- **合理使用过滤**：站点过滤和时效过滤可以提高结果相关性

### 3. 错误处理

| 错误码 | 说明 | 解决方法 |
|--------|------|---------|
| 400 | 客户端请求参数错误 | 检查请求参数格式 |
| 500 | 服务端执行错误 | 稍后重试 |
| 501 | 调用模型服务超时 | 增加timeout或减少top_k |
| 502 | 模型流式输出超时 | 稍后重试 |

## 🔒 安全注意

### API Key安全

- ⚠️ 请勿将API Key提交到公开仓库
- ✅ 使用环境变量或配置文件管理
- ✅ 定期更换API Key
- ✅ 监控API使用量和费用

### 配置文件示例

创建`.env.local`文件：
```bash
BAIDU_AISEARCH_TOKEN=your_api_key_here
```

确保`.gitignore`包含：
```
.env
.env.local
```

## 📊 Python实现

完整的Python实现请参考：`skills/baidu_web_search_api.py`

### 快速使用

```python
from skills.baidu_web_search_api import BaiduWebSearch

# 创建客户端
client = BaiduWebSearch()

# 执行搜索
result = client.search(
    query="国家电网 优质服务举措",
    top_k=10,
    resource_types=["web"],
    recency_filter="month"
)

# 处理结果
if result["success"]:
    for ref in result["references"]:
        print(f"标题: {ref['title']}")
        print(f"URL: {ref['url']}")
        print(f"日期: {ref['date']}")
        print(f"内容: {ref['content'][:200]}...")
        print("---")
```

## 📚 API文档参考

- [百度搜索API官方文档](https://cloud.baidu.com/doc/AppBuilder/s/klv6eyrj9)
- [百度千帆平台](https://cloud.baidu.com/product/wenxinworkshop)
- [API Key获取](https://console.bce.baidu.com/qianfan/ais/console/onlineTest)

---

**技能类型**: 信息检索工具  
**维护者**: Research Agent  
**更新时间**: 2026-03-10  
**API版本**: baidu_search_v2
