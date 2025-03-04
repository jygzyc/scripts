@echo off

winget install Schniz.fnm
pause "Continue..."

@REM Add next line to the end of profile
@REM fnm env --use-on-cd --shell power-shell | Out-String | Invoke-Expression
notepad $profile