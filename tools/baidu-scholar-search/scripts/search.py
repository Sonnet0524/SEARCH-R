#!/usr/bin/env python3
"""
Baidu Scholar Search Script
Search Chinese and English academic literature
"""

import os
import sys
import requests
import json
import argparse
from typing import Dict, Any, List


class BaiduScholarClient:
    """Baidu Scholar API Client"""
    
    BASE_URL = "https://qianfan.baidubce.com/v2/tools/baidu_scholar/search"
    
    def __init__(self, api_key: str):
        self.api_key = api_key
        self.headers = {
            "Authorization": f"Bearer {api_key}",
            "X-Appbuilder-From": "openclaw",
        }
    
    def search(self, keyword: str, page_num: int = 0, enable_abstract: bool = False) -> List[Dict[str, Any]]:
        """Search academic literature."""
        params = {
            "wd": keyword,
            "pageNum": page_num,
            "enable_abstract": str(enable_abstract).lower()
        }
        
        response = requests.get(
            self.BASE_URL, 
            params=params, 
            headers=self.headers, 
            timeout=30
        )
        response.raise_for_status()
        result = response.json()
        
        # 检查错误（百度API返回code字段，可能是字符串"0"或整数0）
        if "code" in result and result["code"] not in ["0", 0]:
            raise RuntimeError(f"API error: {result.get('message', 'Unknown error')}")
        
        return result.get("data", [])
    
    def _check_error(self, result: Dict[str, Any]) -> None:
        if "errno" in result and result["errno"] != 0:
            errmsg = result.get("errmsg", "Unknown error")
            raise RuntimeError(f"API error: {errmsg} (code: {result['errno']})")


def main():
    parser = argparse.ArgumentParser(description="Search Baidu Scholar")
    parser.add_argument(
        "--keyword", "-k", 
        required=True,
        help="Search keyword"
    )
    parser.add_argument(
        "--page", "-p", 
        type=int, 
        default=0, 
        help="Page number (starts from 0)"
    )
    parser.add_argument(
        "--abstract", "-a", 
        action="store_true",
        help="Include abstract in results"
    )
    
    args = parser.parse_args()
    
    api_key = os.getenv("BAIDU_API_KEY")
    if not api_key:
        print("Error: BAIDU_API_KEY environment variable not set", file=sys.stderr)
        sys.exit(1)
    
    try:
        client = BaiduScholarClient(api_key)
        results = client.search(
            args.keyword, 
            page_num=args.page, 
            enable_abstract=args.abstract
        )
        
        print(json.dumps(results, ensure_ascii=False, indent=2))
        
    except requests.exceptions.RequestException as e:
        print(f"Network error: {e}", file=sys.stderr)
        sys.exit(1)
    except RuntimeError as e:
        print(f"API error: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
