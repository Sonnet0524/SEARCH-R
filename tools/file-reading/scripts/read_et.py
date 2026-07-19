"""
et 文件阅读理解工具

读取 WPS 表格 (.et) 格式文件，通过转换为 xlsx 后读取。
"""

from typing import Optional, List, Dict, Any, Union
from pathlib import Path
import json
import tempfile
import os
import platform

from .read_xlsx import read_xlsx


def convert_et_to_xlsx(et_path: Union[str, Path], xlsx_path: Union[str, Path]) -> bool:
    """
    将 .et 文件转换为 .xlsx 文件
    
    Args:
        et_path: .et 文件路径
        xlsx_path: 输出的 .xlsx 文件路径
    
    Returns:
        转换是否成功
    """
    et_path = Path(et_path)
    xlsx_path = Path(xlsx_path)
    
    if platform.system() != 'Windows':
        raise RuntimeError(".et 文件转换仅支持 Windows 系统")
    
    try:
        import win32com.client
    except ImportError:
        raise ImportError("请安装 pywin32: pip install pywin32")
    
    if not et_path.exists():
        raise FileNotFoundError(f"文件不存在: {et_path}")
    
    et_app = None
    workbook = None
    
    try:
        # 优先尝试WPS ET组件，因为.et是WPS表格格式
        errors = []
        # Ket.Application是WPS表格专用接口，KWps.Application是WPS文字接口
        apps_to_try = ["Ket.Application", "KWps.Application", "Excel.Application"]
        
        for app_name in apps_to_try:
            try:
                et_app = win32com.client.Dispatch(app_name)
                print(f"Using COM interface: {app_name}")
                break
            except Exception as e:
                errors.append(f"{app_name}: {e}")
                et_app = None
        
        if et_app is None:
            raise RuntimeError(f"无法找到可用的COM接口: {'; '.join(errors)}")
        
        try:
            et_app.Visible = False
            et_app.DisplayAlerts = False
        except:
            pass
        
        workbook = et_app.Workbooks.Open(str(et_path.absolute()))
        workbook.SaveAs(str(xlsx_path.absolute()), FileFormat=51)
        workbook.Close(False)
        
        return True
    except Exception as e:
        raise RuntimeError(f"无法转换 .et 文件: {e}。请确保已安装 WPS Office 或 Microsoft Excel")
    finally:
        if workbook:
            try:
                workbook.Close(False)
            except:
                pass
        if et_app:
            try:
                et_app.Quit()
            except:
                pass


def read_et(
    file_path: Union[str, Path],
    sheet_names: Optional[List[str]] = None,
    max_rows: Optional[int] = None
) -> Dict[str, Any]:
    """
    读取 et 文件并返回结构化数据。
    
    Args:
        file_path: WPS 表格文件路径
        sheet_names: 指定要读取的工作表名称列表，默认读取所有工作表
        max_rows: 每个工作表最大读取行数，用于限制大文件读取，默认无限制
    
    Returns:
        包含文件信息的字典，结构与 read_xlsx 相同
    
    Raises:
        FileNotFoundError: 文件不存在
        ValueError: 文件格式错误或工作表不存在
        RuntimeError: 不支持的操作系统
    """
    file_path = Path(file_path)
    
    if not file_path.exists():
        raise FileNotFoundError(f"文件不存在: {file_path}")
    
    if file_path.suffix.lower() not in ['.et']:
        raise ValueError(f"不支持的文件格式: {file_path.suffix}，仅支持 .et 文件")
    
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_xlsx = Path(temp_dir) / f"{file_path.stem}.xlsx"
        
        convert_et_to_xlsx(file_path, temp_xlsx)
        
        result = read_xlsx(temp_xlsx, sheet_names, max_rows)
        
        result["file_info"]["file_path"] = str(file_path)
        result["file_info"]["original_format"] = ".et"
        result["file_info"]["converted_to"] = ".xlsx"
        
        return result


def read_et_as_markdown(
    file_path: Union[str, Path],
    sheet_names: Optional[List[str]] = None,
    max_rows: Optional[int] = None
) -> str:
    """
    读取 et 文件并返回 Markdown 格式的表格。
    
    Args:
        file_path: WPS 表格文件路径
        sheet_names: 指定要读取的工作表名称列表
        max_rows: 每个工作表最大读取行数
    
    Returns:
        Markdown 格式的字符串
    """
    data = read_et(file_path, sheet_names, max_rows)
    
    markdown_lines = []
    markdown_lines.append(f"# Excel 文件: {data['file_info']['file_path']}\n")
    markdown_lines.append(f"- 原始格式: {data['file_info'].get('original_format', '.et')}")
    markdown_lines.append(f"- 总工作表数: {data['file_info']['total_sheets']}")
    markdown_lines.append(f"- 读取工作表数: {data['file_info']['read_sheets']}\n")
    
    for sheet in data["sheets"]:
        markdown_lines.append(f"## 工作表: {sheet['name']}\n")
        markdown_lines.append(f"- 行数: {sheet['rows']}")
        markdown_lines.append(f"- 列数: {sheet['columns']}\n")
        
        if sheet["data"]:
            header = sheet["data"][0] if sheet["data"] else []
            markdown_lines.append("| " + " | ".join(str(cell) for cell in header) + " |")
            markdown_lines.append("| " + " | ".join(["---"] * len(header)) + " |")
            
            for row in sheet["data"][1:]:
                while len(row) < len(header):
                    row.append("")
                markdown_lines.append("| " + " | ".join(str(cell) for cell in row[:len(header)]) + " |")
        
        markdown_lines.append("")
    
    return "\n".join(markdown_lines)


if __name__ == "__main__":
    import sys
    
    if len(sys.argv) < 2:
        print("用法: python read_et.py <文件路径> [工作表名称...] [--max-rows N]")
        print("示例: python read_et.py data.et Sheet1 Sheet2 --max-rows 100")
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
        result = read_et(file_path_arg, sheet_names_arg, max_rows_arg)
        print(json.dumps(result, ensure_ascii=False, indent=2))
    except Exception as e:
        print(f"错误: {e}", file=sys.stderr)
        sys.exit(1)
