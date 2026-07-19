"""
统一 Excel 文件阅读工具

自动识别文件格式(.xls/.xlsx/.et)并调用相应的读取器。
"""

from typing import Optional, List, Dict, Any, Union
from pathlib import Path
import json


def read_excel(
    file_path: Union[str, Path],
    sheet_names: Optional[List[str]] = None,
    max_rows: Optional[int] = None
) -> Dict[str, Any]:
    """
    自动识别文件格式并读取 Excel 文件。
    
    支持的格式：
    - .xlsx (Excel 2007+)
    - .xlsm (Excel 2007+ with macros)
    - .xls (Excel 97-2003)
    - .et (WPS 表格)
    
    Args:
        file_path: Excel 文件路径
        sheet_names: 指定要读取的工作表名称列表，默认读取所有工作表
        max_rows: 每个工作表最大读取行数，用于限制大文件读取，默认无限制
    
    Returns:
        包含文件信息的字典，结构如下：
        {
            "file_info": {
                "file_path": "文件路径",
                "total_sheets": 工作表总数,
                "read_sheets": 实际读取的工作表数量,
                "format": "文件格式"
            },
            "sheets": [
                {
                    "name": "工作表名称",
                    "rows": 总行数,
                    "columns": 总列数,
                    "data": [[单元格数据...], ...]
                },
                ...
            ]
        }
    
    Raises:
        FileNotFoundError: 文件不存在
        ValueError: 文件格式不支持
    """
    file_path = Path(file_path)
    
    if not file_path.exists():
        raise FileNotFoundError(f"文件不存在: {file_path}")
    
    suffix = file_path.suffix.lower()
    
    if suffix in ['.xlsx', '.xlsm']:
        from .read_xlsx import read_xlsx
        result = read_xlsx(file_path, sheet_names, max_rows)
        result["file_info"]["format"] = suffix
        return result
    elif suffix == '.xls':
        from .read_xls import read_xls
        result = read_xls(file_path, sheet_names, max_rows)
        result["file_info"]["format"] = suffix
        return result
    elif suffix == '.et':
        from .read_et import read_et
        result = read_et(file_path, sheet_names, max_rows)
        result["file_info"]["format"] = suffix
        return result
    else:
        raise ValueError(f"不支持的文件格式: {suffix}\n支持的格式: .xlsx, .xlsm, .xls, .et")


def read_excel_as_markdown(
    file_path: Union[str, Path],
    sheet_names: Optional[List[str]] = None,
    max_rows: Optional[int] = None
) -> str:
    """
    自动识别文件格式并读取 Excel 文件，返回 Markdown 格式。
    
    Args:
        file_path: Excel 文件路径
        sheet_names: 指定要读取的工作表名称列表
        max_rows: 每个工作表最大读取行数
    
    Returns:
        Markdown 格式的字符串
    """
    file_path = Path(file_path)
    suffix = file_path.suffix.lower()
    
    if suffix in ['.xlsx', '.xlsm']:
        from .read_xlsx import read_xlsx_as_markdown
        return read_xlsx_as_markdown(file_path, sheet_names, max_rows)
    elif suffix == '.xls':
        from .read_xls import read_xls_as_markdown
        return read_xls_as_markdown(file_path, sheet_names, max_rows)
    elif suffix == '.et':
        from .read_et import read_et_as_markdown
        return read_et_as_markdown(file_path, sheet_names, max_rows)
    else:
        raise ValueError(f"不支持的文件格式: {suffix}\n支持的格式: .xlsx, .xlsm, .xls, .et")


if __name__ == "__main__":
    import sys
    
    if len(sys.argv) < 2:
        print("用法: python read_excel.py <文件路径> [工作表名称...] [--max-rows N]")
        print("支持的格式: .xlsx, .xlsm, .xls, .et")
        print("示例: python read_excel.py data.xls Sheet1 Sheet2 --max-rows 100")
        sys.exit(1)
    
    file_path_arg = sys.argv[1]
    sheet_names_arg: Optional[List[str]] = None
    max_rows_arg: Optional[int] = None
    
    args = sys.argv[2:]
    if "--max-rows" in args:
        idx = args.index("--max-rows")
        if idx + 1 < len(args):
            max_rows_arg = int(args[idx + 1])
            args = args[:idx] + args[idx + 2:]
    
    if args:
        sheet_names_arg = args
    
    try:
        result = read_excel(file_path_arg, sheet_names_arg, max_rows_arg)
        print(json.dumps(result, ensure_ascii=False, indent=2))
    except Exception as e:
        print(f"错误: {e}", file=sys.stderr)
        sys.exit(1)
