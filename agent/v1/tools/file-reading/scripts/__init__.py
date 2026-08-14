"""
文件阅读理解工具包

提供 xlsx、xls、et 和 docx 文件的读取功能。
"""

from .read_xlsx import read_xlsx, read_xlsx_as_markdown
from .read_xls import read_xls, read_xls_as_markdown
from .read_et import read_et, read_et_as_markdown
from .read_excel import read_excel, read_excel_as_markdown
from .read_docx import read_docx, read_docx_as_markdown

__all__ = [
    'read_xlsx',
    'read_xlsx_as_markdown',
    'read_xls',
    'read_xls_as_markdown',
    'read_et',
    'read_et_as_markdown',
    'read_excel',
    'read_excel_as_markdown',
    'read_docx',
    'read_docx_as_markdown',
]

__version__ = '1.1.0'
