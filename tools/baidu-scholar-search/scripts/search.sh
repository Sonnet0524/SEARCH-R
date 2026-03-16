#!/bin/bash
# Baidu Scholar Search Wrapper Script
# Usage: bash search.sh "keyword" [page_num] [include_abstract]

KEYWORD="${1:-}"
PAGE_NUM="${2:-0}"
INCLUDE_ABSTRACT="${3:-false}"

if [ -z "$KEYWORD" ]; then
    echo "Error: keyword is required"
    echo "Usage: bash search.sh \"keyword\" [page_num] [include_abstract]"
    exit 1
fi

# Build Python command
if [ "$INCLUDE_ABSTRACT" = "true" ]; then
    python3 "$(dirname "$0")/search.py" --keyword "$KEYWORD" --page "$PAGE_NUM" --abstract
else
    python3 "$(dirname "$0")/search.py" --keyword "$KEYWORD" --page "$PAGE_NUM"
fi
