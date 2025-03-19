@echo off
echo ==== Starting ResumeAI ATS Checker ====

REM Check if Ollama server is running
curl -s http://localhost:11434/api/health >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] Ollama server is running
) else (
    echo [ERROR] Ollama server is not running
    echo    Please start Ollama server in a separate command window with:
    echo    ollama serve
    echo.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

REM Check if nomic-embed-text model exists
ollama list | findstr "nomic-embed-text" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] nomic-embed-text model is installed
) else (
    echo [WARN] nomic-embed-text model is not installed
    echo    Downloading now (this might take a while)...
    ollama pull nomic-embed-text
    
    if %ERRORLEVEL% EQU 0 (
        echo [OK] nomic-embed-text model downloaded successfully
    ) else (
        echo [ERROR] Failed to download the model
        echo    Please run: ollama pull nomic-embed-text
        echo.
        echo Press any key to exit...
        pause >nul
        exit /b 1
    )
)

echo Starting ATS checker...
echo ==========================================
node ats-checker.js

echo.
echo ATS checker finished. Press any key to exit...
pause >nul 