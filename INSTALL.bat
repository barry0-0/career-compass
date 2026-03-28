@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion

echo.
echo ===========================================
echo   Career Compass 安装向导 (by Barry)
echo ===========================================
echo.

:: Step 1: boss-cli
echo ▶ Step 1 — 安装 boss-cli...
where boss >nul 2>&1
if %errorlevel% equ 0 (
    echo   [OK]  boss-cli 已安装
    boss --version 2>nul || echo   已安装
) else (
    echo   boss-cli 未安装，正在安装...
    where uv >nul 2>&1
    if %errorlevel% equ 0 (
        echo   使用 uv 安装...
        uv tool install kabi-boss-cli 2>nul
    ) else (
        echo   使用 pip 安装...
        pip install kabi-boss-cli --user 2>nul
    )
    where boss >nul 2>&1
    if %errorlevel% equ 0 (
        echo   [OK]  boss-cli 安装成功
    ) else (
        echo   [WARN] 可能需要重启命令提示符后运行 boss login
    )
)

:: Step 2: PDF 工具链
echo.
echo ▶ Step 2 — 检测 PDF 工具链...
where pdftotext >nul 2>&1
if %errorlevel% equ 0 (echo   [OK]  pdftotext 已安装) else (echo   [MISSING] pdftotext 未安装)
where tesseract >nul 2>&1
if %errorlevel% equ 0 (echo   [OK]  tesseract 已安装) else (echo   [MISSING] tesseract 未安装)
where ghostscript >nul 2>&1
if %errorlevel% equ 0 (echo   [OK]  ghostscript 已安装) else (echo   [MISSING] ghostscript 未安装)
echo.
echo   [INFO] PDF 工具链不安装也可使用，直接复制简历内容粘贴给 AI 即可
echo   macOS:   brew install poppler tesseract ghostscript
echo   Ubuntu:  sudo apt install poppler-utils tesseract-ocr ghostscript
echo   Windows: https://github.com/oschwartz10612/poppler-windows/releases

:: Step 3: BOSS 登录
echo.
echo ▶ Step 3 — BOSS 登录状态...
where boss >nul 2>&1
if %errorlevel% neq 0 (
    echo   跳过（boss 未安装）
    goto :done
)
for /f "delims=" %%i in ('boss status --json 2^>nul ^| findstr /c:"\"authenticated\":" ') do set AUTH=%%i
echo !AUTH! | findstr /C:"true" >nul 2>&1
if !errorlevel! equ 0 (
    echo   [OK]  BOSS 直聘已登录！
    for /f "delims=" %%n in ('boss me --json 2^>nul ^| findstr /c:"\"name\":" ') do echo   账号: %%n
) else (
    echo.
    echo   [WARN] 未检测到登录态
    echo.
    echo   1. 确认浏览器已登录 zhipin.com
    echo   2. 运行: boss login
    echo   3. 验证: boss status
)

:done
echo.
echo ===========================================
echo   安装完成！
echo ===========================================
echo.
echo   在 AI 对话中说：
echo      帮我全面准备面试
echo      我要去XX公司面试，帮我模拟一下
echo      帮我看看简历有哪些可以优化的地方
echo.
pause
