@echo off
setlocal
cd /d "%~dp0"

set ELECTRON_ENABLE_LOGGING=1
set ELECTRON_ENABLE_STACK_DUMPING=1

echo Starting Auto Price Guard Windows preview...
echo Project: %CD%
echo.

if not exist "node_modules\.bin\electron.CMD" (
  echo Electron is not installed. Run npm install or pnpm install first.
  pause
  exit /b 1
)

call "node_modules\.bin\electron.CMD" . 1>preview-startup.log 2>&1

echo.
echo App exited. See preview-startup.log for details.
pause
