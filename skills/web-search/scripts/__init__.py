"""
搜索API包
"""
from .api import search
from .config import get_api_key, API_URL

__all__ = ["search", "get_api_key", "API_URL"]
