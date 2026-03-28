# 🎯 Career Compass — 职场罗盘

> **by Barry** | 一站式求职辅助 Skill

整合简历解析优化、公司调研（就业向）、同城职位搜索、模拟面试四大模块。

**支持平台：** OpenClaw

---

## 功能概览

| 模块 | 依赖 | 说明 |
|------|------|------|
| 📋 **信息收集** | — | 对话引导收集简历/公司/JD |
| 📝 **简历优化** | — | 生成优化方向 + 自检清单 |
| 🏢 **公司调研** | `web_search`/`web_fetch` | 就业视角公司分析 |
| 🔍 **同城职位搜索** | `boss-cli` | BOSS 直聘只读查询 |
| 📄 **PDF 简历解析** | 系统 PDF 工具 | 提取简历文字 |
| 🎤 **模拟面试** | — | 面试练习 + 评分卡 |

---

## 安装方式

### 自动安装（推荐）

下载 `career-compass` 文件夹到 OpenClaw skills 目录后，OpenClaw 会自动执行 `SKILL.md` 中的安装脚本，安装 boss-cli 等所有依赖。

手动触发安装：
```bash
# 在 skill 目录下运行
bash INSTALL.sh   # macOS / Linux
INSTALL.bat       # Windows
```

### boss-cli 手动安装（如自动安装失败）

```bash
# 方式1: uv（推荐）
uv tool install kabi-boss-cli

# 方式2: pipx
pipx install kabi-boss-cli

# 方式3: pip
pip install kabi-boss-cli --user
```

### PDF 工具链（可选，用于解析简历 PDF）

```bash
# macOS
brew install poppler tesseract ghostscript

# Ubuntu/Debian
sudo apt install poppler-utils tesseract-ocr ghostscript

# Windows
# poppler: https://github.com/oschwartz10612/poppler-windows/releases
# tesseract: https://github.com/UB-Mannheim/tesseract/wiki
# ghostscript: https://ghostscript.com/releases/gsdnld.html
```

> 💡 不安装 PDF 工具链也可以使用：直接复制简历内容粘贴给 AI 即可。

---

## BOSS 直聘登录

每个用户需要用自己的 BOSS 账号独立登录一次。

```bash
# 1. 确保浏览器已登录 zhipin.com

# 2. 运行登录
boss login

# 3. 验证
boss status
boss me --json   # 看到名字即成功

# 如自动提取失败
boss login --qrcode
```

Cookie 存在本地（`~/.config/boss-cli/credential.json`），有效期约 7 天。

**本 Skill 仅使用只读查询命令，不涉及投递/打招呼/聊天。**

---

## 快速开始

在 AI 对话中直接说：

```
帮我全面准备面试
我要去XX公司面试，帮我模拟一下
帮我看看简历有哪些可以优化的地方
分析一下XX公司怎么样
帮我搜索XX城市的XX岗位
```

---

## 隐私说明

- boss-cli Cookie 存在用户本地，不上传任何服务器
- PDF 处理在本地完成，不上传文件
- 简历信息仅用于当次对话分析
