---
name: baidu-search
description: Search the web using Baidu AI Search Engine (BDSE). Use for live information, documentation, or research topics.
metadata: { "openclaw": { "emoji": "🔍︎",  "requires": { "bins": ["python"], "env":["BAIDU_API_KEY", "BAIDU_AISEARCH_TOKEN"]},"primaryEnv":"BAIDU_AISEARCH_TOKEN" } }
---

# Baidu Search

Search the web via Baidu AI Search API.

## Usage

```bash
python tools/baidu-search/scripts/search.py '<JSON>'
```

## Request Parameters

| Param | Type | Required | Default | Description |
|-------|------|----------|---------|-------------|
| query | str | yes | - | Search query |
| count | int | no | 10 | Number of results to return, range 1-50 |
| freshness | str | no | Null | Time range, two formats: format one is ”YYYY-MM-DDtoYYYY-MM-DD“, and format two includes pd, pw, pm, and py, representing the past 24 hours, past 7 days, past 31 days, and past 365 days respectively |

## Examples

```bash
# Basic search
python scripts/search.py '{"query":"人工智能"}'

# Freshness first format "YYYY-MM-DDtoYYYY-MM-DD" example
python scripts/search.py '{
  "query":"最新新闻",
  "freshness":"2025-09-01to2025-09-08"
}'

# Freshness second format pd、pw、pm、py example
python scripts/search.py '{
  "query":"最新新闻",
  "freshness":"pd"
}'

# set count, the number of results to return
python scripts/search.py '{
  "query":"旅游景点",
  "count": 20
}'
```

## Setup

```bash
# Set environment variable (one of the following)
export BAIDU_API_KEY="your_api_key"
# or
export BAIDU_AISEARCH_TOKEN="your_api_key"
```

## Current Status

Fully functional.
