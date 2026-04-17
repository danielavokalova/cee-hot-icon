@echo off
setlocal
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $base='%~dp0'; $iconStore='C:\ProgramData\CEE_Client_Widgets\icons'; New-Item -ItemType Directory -Path $iconStore -Force | Out-Null; $icon=Join-Path $iconStore 'cee-hot.ico'; $localIcon=Join-Path $base 'cee-badge.ico'; if (Test-Path $localIcon) { Copy-Item $localIcon $icon -Force } else { try { Invoke-WebRequest -UseBasicParsing -Uri 'https://danielavokalova.github.io/cee-hot-icon/downloads/windows/cee-badge.ico' -OutFile $icon -TimeoutSec 12 } catch {} }; $desktop=[Environment]::GetFolderPath('Desktop'); $shortcut=Join-Path $desktop 'CEE Admin Console.lnk'; $wsh=New-Object -ComObject WScript.Shell; $s=$wsh.CreateShortcut($shortcut); $s.TargetPath=$env:SystemRoot+'\System32\cmd.exe'; $s.Arguments='/c start \"\" \"https://bo.golibe.com/\"'; $s.WorkingDirectory=$desktop; $s.Description='CEE Admin Console'; if (Test-Path $icon) { $s.IconLocation=$icon+',0' } else { $s.IconLocation=$env:SystemRoot+'\System32\shell32.dll,220' }; $s.Save(); Start-Process explorer.exe ('/select,'+$shortcut)"
if errorlevel 1 (
  echo Installation failed.
  echo Please check internet connection and try again.
  pause
  exit /b 1
)
echo Done. CEE icon was created on Desktop.
echo Drag it to taskbar to pin.
pause
