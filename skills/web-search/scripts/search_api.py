#!/usr/bin/env python3
"""
搜索API命令行工具

使用：
    python search_api.py "关键词" --top_k 10
    python search_api.py "Python教程" --site docs.python.org --recency month
"""
import argparse
import json
from scripts.api import search


def main():
    parser = argparse.ArgumentParser(description="搜索API")
    parser.add_argument("query", help="搜索关键词")
    parser.add_argument("--top_k", type=int, default=10, help="结果数量")
    parser.add_argument("--site", nargs="+", help="站点过滤")
    parser.add_argument("--recency", choices=["week", "month", "year"])
    
    args = parser.parse_args()
    
    result = search(
        query=args.query,
        top_k=args.top_k,
        site_filter=args.site,
        recency=args.recency
    )
    
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
