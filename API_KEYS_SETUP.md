# API Keys配置指南

本文档说明SEARCH-R框架所需的所有API Keys，以及如何获取和配置。

---

## 📋 API Keys清单

| API Key | 用途 | 必需 | 获取难度 | 状态 |
|---------|------|:----:|----------|------|
| **BAIDU_API_KEY** | 百度系列服务 | ✅ 必需 | ⭐ 简单 | 未配置 |
| **PADDLEOCR_ACCESS_TOKEN** | PaddleOCR服务 | ✅ 必需 | ⭐ 简单 | 未配置 |
| **PADDLEOCR_OCR_API_URL** | OCR同步API | ⚠️ 可选 | ⭐⭐ 中等 | 未配置 |
| **PADDLEOCR_DOC_PARSING_API_URL** | 文档解析API | ⚠️ 可选 | ⭐⭐ 中等 | 未配置 |

**说明**：
- ✅ 必需：工具核心功能需要
- ⚠️ 可选：增强功能需要，不配置则使用替代方案
- ⭐ 难度：获取难度等级

**注意**：
- `PADDLEOCR_ACCESS_TOKEN`与`BAIDU_API_KEY`相同，只需配置一次
- OCR同步API和文档解析API需要用户专属URL，需要从任务页面获取

---

## 🔑 配置状态检查

### 如何检查配置状态

```bash
# 检查环境变量是否设置
env | grep BAIDU_API_KEY
env | grep PADDLEOCR

# 或检查.env文件
cat .env | grep -E "BAIDU_API_KEY|PADDLEOCR"
```

### 工具可用性矩阵

| 工具 | 无配置 | 仅BAIDU_API_KEY | 完整配置 |
|------|:------:|:---------------:|:--------:|
| **baidu-search** | ❌ 不可用 | ✅ 可用 | ✅ 可用 |
| **baidu-scholar-search** | ❌ 不可用 | ✅ 可用 | ✅ 可用 |
| **baidu-baike-data** | ❌ 不可用 | ✅ 可用 | ✅ 可用 |
| **paddleocr-async** | ❌ 不可用 | ✅ 可用 | ✅ 可用 |
| **paddleocr-text-recognition** | ❌ 不可用 | ❌ 不可用 | ✅ 可用 |
| **paddleocr-doc-parsing** | ❌ 不可用 | ❌ 不可用 | ✅ 可用 |
| **file-reading** | ⚠️ 功能受限 | ⚠️ 功能受限 | ⚠️ 建设中 |
| **document-output** | ✅ 可用 | ✅ 可用 | ⚠️ 建设中 |

**说明**：
- ❌ 不可用：需要配置相应的API Key
- ⚠️ 功能受限：部分功能可用，完整功能需要配置
- ⚠️ 建设中：脚本待实现，功能受限

---

## 📝 详细配置步骤

### 1. BAIDU_API_KEY（百度统一API Key）

**用途**：
- baidu-search（百度搜索）
- baidu-scholar-search（百度学术）
- baidu-baike-data（百度百科）
- paddleocr-async（PaddleOCR异步API）

**获取步骤**：

```
步骤1: 访问百度AI Studio
→ https://aistudio.baidu.com/

步骤2: 登录/注册百度账号
→ 如果已有百度账号，直接登录
→ 如果没有，点击注册

步骤3: 获取Access Token
→ 登录后访问：https://aistudio.baidu.com/account/accessToken
→ 复制显示的Token

步骤4: 配置环境变量
→ 方式1：添加到 .env 文件
   BAIDU_API_KEY=bce-v3/ALTAK-your-token-here
   
→ 方式2：设置系统环境变量
   export BAIDU_API_KEY="bce-v3/ALTAK-your-token-here"
```

**验证配置**：

```bash
# 测试百度搜索
python3 tools/baidu-search/scripts/search.py '{"query":"测试","count":1}'

# 期望输出
{
  "success": true,
  "items": [...]
}
```

**常见问题**：

| 问题 | 原因 | 解决方案 |
|------|------|----------|
| "Invalid token" | Token格式错误 | 检查Token是否完整复制 |
| "Token expired" | Token过期 | 重新获取Token |
| "Rate limit exceeded" | 请求频率过高 | 等待后重试 |

---

### 2. PADDLEOCR_ACCESS_TOKEN

**用途**：
- PaddleOCR系列工具（与BAIDU_API_KEY相同）

**获取方式**：
```
PADDLEOCR_ACCESS_TOKEN 与 BAIDU_API_KEY 相同！
只需设置一个即可。
```

**配置**：
```bash
# 方式1：使用相同的值
PADDLEOCR_ACCESS_TOKEN=$BAIDU_API_KEY

# 方式2：在.env中配置
PADDLEOCR_ACCESS_TOKEN=bce-v3/ALTAK-your-token-here
```

---

### 3. PADDLEOCR_OCR_API_URL（OCR同步API - 可选）

**用途**：
- paddleocr-text-recognition（文字识别）
- 支持快速响应，适合小文件

**获取步骤**：

```
步骤1: 访问PaddleOCR任务页面
→ https://aistudio.baidu.com/paddleocr/task

步骤2: 创建任务（如果没有）
→ 点击"创建任务"
→ 选择"通用OCR"
→ 配置任务参数
→ 保存

步骤3: 获取专属URL
→ 在任务列表中，点击任务的"查看详情"
→ 复制"API调用地址"
→ 例如：https://k358e0c7fbo05ck2.aistudio-app.com/ocr

步骤4: 配置环境变量
→ 添加到 .env 文件
   PADDLEOCR_OCR_API_URL=https://your-instance.aistudio-app.com/ocr
```

**验证配置**：

```bash
# 测试OCR识别
python3 tools/paddleocr-text-recognition/scripts/ocr_caller.py \
  --file-path "test.png" --stdout --pretty

# 期望输出
{
  "success": true,
  "text": "识别的文字内容"
}
```

---

### 4. PADDLEOCR_DOC_PARSING_API_URL（文档解析API - 可选）

**用途**：
- paddleocr-doc-parsing（高级文档解析）
- 支持表格、公式、图表提取

**获取步骤**：

```
步骤1: 访问PaddleOCR任务页面
→ https://aistudio.baidu.com/paddleocr/task

步骤2: 创建文档解析任务
→ 点击"创建任务"
→ 选择"版面分析"
→ 配置任务参数
→ 保存

步骤3: 获取专属URL
→ 复制"API调用地址"
→ 例如：https://c7l9bckah9wdgey8.aistudio-app.com/layout-parsing

步骤4: 配置环境变量
→ 添加到 .env 文件
   PADDLEOCR_DOC_PARSING_API_URL=https://your-instance.aistudio-app.com/layout-parsing
```

**验证配置**：

```bash
# 测试文档解析
python3 tools/paddleocr-doc-parsing/scripts/vl_caller.py \
  --file-path "document.pdf" --file-type 0 --stdout --pretty

# 期望输出
{
  "success": true,
  "pages": [...],
  "tables": [...],
  "formulas": [...]
}
```

---

## 🔧 配置方法

### 方法1：使用.env文件（推荐）

```bash
# 1. 复制模板文件
cp .env.example .env

# 2. 编辑.env文件
nano .env  # 或使用其他编辑器

# 3. 填入你的API Keys
BAIDU_API_KEY=bce-v3/ALTAK-your-token-here
PADDLEOCR_ACCESS_TOKEN=bce-v3/ALTAK-your-token-here
PADDLEOCR_OCR_API_URL=https://your-instance.aistudio-app.com/ocr
PADDLEOCR_DOC_PARSING_API_URL=https://your-instance.aistudio-app.com/layout-parsing

# 4. 保存文件
```

**优点**：
- ✅ 配置集中管理
- ✅ 不会被git提交（已在.gitignore中）
- ✅ 易于维护和更新

### 方法2：系统环境变量

```bash
# 临时设置（当前会话有效）
export BAIDU_API_KEY="bce-v3/ALTAK-your-token-here"
export PADDLEOCR_ACCESS_TOKEN="bce-v3/ALTAK-your-token-here"

# 永久设置（添加到shell配置文件）
echo 'export BAIDU_API_KEY="bce-v3/ALTAK-your-token-here"' >> ~/.bashrc
echo 'export PADDLEOCR_ACCESS_TOKEN="bce-v3/ALTAK-your-token-here"' >> ~/.bashrc

# 重新加载配置
source ~/.bashrc
```

**优点**：
- ✅ 全局可用
- ✅ 适合服务器环境

**缺点**：
- ⚠️ 需要手动管理
- ⚠️ 不易版本控制

---

## ⚠️ 未配置时的行为

### 百度系列工具（无BAIDU_API_KEY）

```
用户: "百度搜索人工智能"
Agent: ⚠️ 百度搜索工具未配置

需要配置 BAIDU_API_KEY 才能使用百度搜索功能。

配置步骤：
1. 访问 https://aistudio.baidu.com/account/accessToken
2. 获取Access Token
3. 配置环境变量：
   export BAIDU_API_KEY="your-token"
   
或添加到 .env 文件：
   BAIDU_API_KEY=your-token

是否需要帮助配置？
```

### PaddleOCR同步API（无专属URL）

```
用户: "识别这张图片中的文字"
Agent: ⚠️ OCR同步API未配置

当前状态：
- paddleocr-async 可用（异步处理，适合大文件）
- paddleocr-text-recognition 不可用（需要配置专属URL）

建议方案：
1. 使用异步API（已可用）：
   → 适合大文件、批量处理
   → 响应时间较长（需轮询）

2. 配置同步API：
   → 适合快速响应
   → 需要获取专属URL
   
是否使用异步API处理？
```

---

## 🔒 安全建议

### 1. 不要提交敏感信息

```bash
# 确保.env在.gitignore中
echo ".env" >> .gitignore

# 检查是否会被提交
git status | grep .env
```

### 2. 定期更新Token

```
建议：每3-6个月更新一次API Token
原因：
- 安全性考虑
- 防止Token泄露
- 保持访问权限有效
```

### 3. 限制Token权限

```
最佳实践：
- 只申请必需的API权限
- 不要共享Token
- 为不同环境使用不同Token
```

---

## 📊 配置验证脚本

创建验证脚本 `scripts/check_api_keys.sh`：

```bash
#!/bin/bash

echo "检查API Keys配置状态..."
echo ""

# 检查BAIDU_API_KEY
if [ -z "$BAIDU_API_KEY" ]; then
    echo "❌ BAIDU_API_KEY: 未配置"
    echo "   → 获取地址: https://aistudio.baidu.com/account/accessToken"
else
    echo "✅ BAIDU_API_KEY: 已配置"
fi

# 检查PADDLEOCR_ACCESS_TOKEN
if [ -z "$PADDLEOCR_ACCESS_TOKEN" ]; then
    echo "❌ PADDLEOCR_ACCESS_TOKEN: 未配置"
else
    echo "✅ PADDLEOCR_ACCESS_TOKEN: 已配置"
fi

# 检查同步API URL
if [ -z "$PADDLEOCR_OCR_API_URL" ]; then
    echo "⚠️  PADDLEOCR_OCR_API_URL: 未配置（可选）"
    echo "   → 获取地址: https://aistudio.baidu.com/paddleocr/task"
else
    echo "✅ PADDLEOCR_OCR_API_URL: 已配置"
fi

if [ -z "$PADDLEOCR_DOC_PARSING_API_URL" ]; then
    echo "⚠️  PADDLEOCR_DOC_PARSING_API_URL: 未配置（可选）"
    echo "   → 获取地址: https://aistudio.baidu.com/paddleocr/task"
else
    echo "✅ PADDLEOCR_DOC_PARSING_API_URL: 已配置"
fi

echo ""
echo "工具可用性："
echo ""

# 工具可用性检查
if [ -n "$BAIDU_API_KEY" ]; then
    echo "✅ baidu-search - 可用"
    echo "✅ baidu-scholar-search - 可用"
    echo "✅ baidu-baike-data - 可用"
    echo "✅ paddleocr-async - 可用"
else
    echo "❌ baidu-search - 需要配置 BAIDU_API_KEY"
    echo "❌ baidu-scholar-search - 需要配置 BAIDU_API_KEY"
    echo "❌ baidu-baike-data - 需要配置 BAIDU_API_KEY"
    echo "❌ paddleocr-async - 需要配置 BAIDU_API_KEY"
fi

if [ -n "$PADDLEOCR_OCR_API_URL" ]; then
    echo "✅ paddleocr-text-recognition - 可用"
else
    echo "⚠️  paddleocr-text-recognition - 需要配置专属URL（可选）"
fi

if [ -n "$PADDLEOCR_DOC_PARSING_API_URL" ]; then
    echo "✅ paddleocr-doc-parsing - 可用"
else
    echo "⚠️  paddleocr-doc-parsing - 需要配置专属URL（可选）"
fi

echo ""
echo "始终可用："
echo "✅ file-reading - 可用（基础功能）"
echo "✅ document-output - 可用"
```

**使用方法**：

```bash
# 赋予执行权限
chmod +x scripts/check_api_keys.sh

# 运行检查
./scripts/check_api_keys.sh
```

---

## 🔗 相关链接

### 百度平台
- [百度AI Studio](https://aistudio.baidu.com/)
- [获取Access Token](https://aistudio.baidu.com/account/accessToken)
- [PaddleOCR任务页面](https://aistudio.baidu.com/paddleocr/task)

### 文档
- [百度API使用文档](https://cloud.baidu.com/doc/ARCH/index.html)
- [PaddleOCR文档](https://github.com/PaddlePaddle/PaddleOCR)

---

## 🆘 故障排除

### 问题1：Token无效

```
错误信息："Invalid token" 或 "Token expired"

解决方案：
1. 重新获取Token
   → 访问 https://aistudio.baidu.com/account/accessToken
   → 复制新的Token

2. 更新配置
   → 更新 .env 文件
   → 或重新设置环境变量

3. 验证配置
   → 运行检查脚本
   → 测试工具调用
```

### 问题2：API URL无法访问

```
错误信息："Connection refused" 或 "Timeout"

解决方案：
1. 检查URL格式
   → 确保包含完整路径
   → 例如：https://xxx.aistudio-app.com/ocr

2. 检查任务状态
   → 访问任务页面确认任务正在运行
   → https://aistudio.baidu.com/paddleocr/task

3. 检查网络连接
   → 确保能访问百度服务
```

### 问题3：权限不足

```
错误信息："Permission denied" 或 "Access denied"

解决方案：
1. 检查账号权限
   → 确认已开通相应服务
   → 检查账号是否通过实名认证

2. 检查Token权限
   → 确认Token包含必需的权限
   → 重新生成Token

3. 联系支持
   → 如仍有问题，联系百度客服
```

---

**文档更新**: 2026-03-14  
**维护者**: SEARCH-R Framework  
**版本**: v1.0
