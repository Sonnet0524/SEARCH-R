"""
搜索API配置
"""
import os

API_URL = "https://qianfan.baidubce.com/v2/ai_search/web_search"

def get_api_key() -> str:
    """获取API Key（从环境变量）"""
    key = os.environ.get("BAIDU_AISEARCH_TOKEN")
    if not key:
        raise ValueError(
            "API Key未配置。请设置：\n"
            "  export BAIDU_AISEARCH_TOKEN='your_token'"
        )
    return key
