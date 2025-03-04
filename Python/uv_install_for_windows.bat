@echo off
setlocal EnableDelayedExpansion

REM Install uv using PowerShell
powershell -ExecutionPolicy ByPass -Command "irm https://astral.sh/uv/install.ps1 | iex"
if %ERRORLEVEL% neq 0 (
    echo Failed to install uv!
    exit /b 1
)
echo uv installed successfully.

REM Define UV environment variables
set "UV_PYTHON_BIN_DIR=%USERPROFILE%\.uv\python\bin"
set "UV_PYTHON_INSTALL_DIR=%USERPROFILE%\.uv\python"
set "UV_TOOL_BIN_DIR=%USERPROFILE%\.uv\tool\bin"
set "UV_TOOL_DIR=%USERPROFILE%\.uv\tool"

REM Check if UV_TOOL_BIN_DIR is already in PATH
echo %PATH% | find /i "%UV_TOOL_DIR%" >nul
if %ERRORLEVEL% equ 0 (
    echo UV configuration already exists in environment variables.
) else (
    REM Append UV paths to the user PATH environment variable
    setx PATH "%UV_PYTHON_BIN_DIR%;%UV_TOOL_BIN_DIR%;%PATH%" /M

    REM Set additional UV environment variables persistently
    setx UV_PYTHON_BIN_DIR "%UV_PYTHON_BIN_DIR%" /M
    setx UV_PYTHON_INSTALL_DIR "%UV_PYTHON_INSTALL_DIR%" /M
    setx UV_TOOL_BIN_DIR "%UV_TOOL_BIN_DIR%" /M
    setx UV_TOOL_DIR "%UV_TOOL_DIR%" /M

    echo UV configuration added to environment variables.
)

endlocal
exit /b 0