@ECHO OFF
SET FILENAME=AACACM.inf
TITLE AAC ACM Codec 32-bit
ECHO Installing...

REM Workaround for the lost current dir while using "Run as Administrator"
SETLOCAL ENABLEEXTENSIONS
IF EXIST "%~dp0" cd /D "%~dp0"

IF NOT EXIST %FILENAME% GOTO FILE_MISSING

IF "%PROCESSOR_ARCHITECTURE%"=="" GOTO INSTALL_X86
IF %PROCESSOR_ARCHITECTURE%==x86 GOTO INSTALL_X86

"%SystemRoot%\SysWOW64\rundll32.exe" setupapi.dll,InstallHinfSection DefaultInstall 132 .\%FILENAME%
GOTO End

:INSTALL_X86
rundll32.exe setupapi.dll,InstallHinfSection DefaultInstall 132 .\%FILENAME%
GOTO End

:FILE_MISSING
ECHO The file %FILENAME% is missing!
pause > nul

:End
