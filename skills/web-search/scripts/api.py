"""
搜索API调用
"""
import json
import urllib.request
import urllib.error
from typing import Dict, Any, Optional, List

from .config import API_URL, get_api_key


def search(
    query: str,
    top_k: int = 10,
    site_filter: Optional[List[str]] = None,
    recency: Optional[str] = None
) -> Dict[str, Any]:
    """
    执行搜索
    
    Args:
        query: 搜索关键词
        top_k: 返回数量 (1-50)
        site_filter: 站点过滤
        recency: 时效过滤 (week/month/year)
    """
    payload = {
        "messages": [{"content": query, "role": "user"}],
        "search_source": "baidu_search_v2",
        "resource_type_filter": [{"type": "web", "top_k": min(top_k, 50)}]
    }
    
    if site_filter:
        payload["search_filter"] = {"match": {"site": site_filter}}
    if recency:
        payload["search_recency_filter"] = recency
    
    try:
        data = json.dumps(payload).encode("utf-8")
        req = urllib.request.Request(
            API_URL, data=data,
            headers={
                "Authorization": f"Bearer {get_api_key()}",
                "Content-Type": "application/json"
            }
        )
        
        with urllib.request.urlopen(req, timeout=15) as resp:
            result = json.loads(resp.read().decode("utf-8"))
        
        return _format_result(result)
        
    except urllib.error.URLError as e:
        return {"success": False, "error": f"网络错误: {e}"}
    except Exception as e:
        return {"success": False, "error": str(e)}


def _format_result(result: Dict) -> Dict[str, Any]:
    """格式化搜索结果"""
    items = []
    for ref in result.get("references", []):
        items.append({
            "title": ref.get("title", ""),
            "url": ref.get("url", ""),
            "snippet": ref.get("content", "")[:500],
            "date": ref.get("date", "")
        })
    return {"success": True, "items": items, "total": len(items)}
