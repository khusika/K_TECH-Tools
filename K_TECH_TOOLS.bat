@echo OFF
setlocal enabledelayedexpansion
color 0b

:restart
set menunr=GARBAGE

cls
echo ------------------------------------------------------------------------------
echo ---------------------------------K_TECH TOOLS---------------------------------
echo ------------------------------------------------------------------------------
echo Enter commands by typing numbers below :
echo 0. About
echo 1. Choose Apktool Version
echo 2. Install framework-res.apk
echo 3. Decompile apk
echo 4. Build apk
echo 5. Sign apk
echo 6. Baksmali
echo 7. Smali
echo 8. CleanUp
echo 9. Exit

SET /P menunr=Choose number : 
IF %menunr%==9 (GOTO Out)
IF %menunr%==8 (GOTO CleanUp)
IF %menunr%==7 (GOTO Smali)
IF %menunr%==6 (GOTO Baksmali)
IF %menunr%==5 (GOTO Signapk)
IF %menunr%==4 (GOTO BuildApk)
IF %menunr%==3 (GOTO DecompileApk)
IF %menunr%==2 (GOTO Install)
IF %menunr%==1 (GOTO ApkToolVersion)
IF %menunr%==0 (GOTO About)
goto restart 

:About
echo -----
echo About
echo -----
echo Made by :
echo K_TECH @ xda-developers
echo -----
echo Tool version :
echo In Test
echo -----
echo Apktool version :
echo 1.5.2 and 2.0.0-RC3
echo -----
echo Baksmali and Smali version :
echo 2.0.3
echo -----
PAUSE
goto restart

:ApkToolVersion
echo 1.	apktool_1.5.2
echo 2.	apktool_2.SlimRoms
echo 3.	2.0.0-RC3
SET /P menunr=Please make your decision: 
IF %menunr%==1 (goto 1xx)
IF %menunr%==2 (goto 2xx)
IF %menunr%==3 (goto 3xx)
goto restart
:1xx
if exist "%~dp0\apktool.jar" del /s /q "%~dp0\apktool.jar"
copy "%~dp0\tools\apktool\apktool_1.5.2.jar" "%~dp0\"
rename "%~dp0\apktool_1.5.2.jar" "apktool.jar"
echo Installed
PAUSE
goto restart
:2xx
if exist "%~dp0\apktool.jar" del /s /q "%~dp0\apktool.jar"
copy "%~dp0\tools\apktool\apktool_2.SlimRoms.jar" "%~dp0\"
rename "%~dp0\apktool_2.SlimRoms.jar" "apktool.jar"
echo Installed
PAUSE
goto restart
:3xx'
if exist "%~dp0\apktool.jar" del /s /q "%~dp0\apktool.jar"
copy "%~dp0\tools\apktool\apktool_2.0.0rc3.jar" "%~dp0\"
rename "%~dp0\apktool_2.0.0rc3.jar" "apktool.jar"
echo Installed
PAUSE
goto restart

:Install
echo 1.	framework-res.apk
echo 2.	twframework-res.apk
SET /P menunr=Please make your decision: 
IF %menunr%==1 (goto framework)
IF %menunr%==2 (goto twframework)
goto restart
:framework
echo Installing framework-res.apk
java -jar apktool.jar if "%~dp0\input\framework-res.apk"
PAUSE
if errorlevel 1 (
echo "An Error Occured, Please Check Your File"
PAUSE
)
goto restart
:twframework
echo Installing twframework-res.apk
java -jar apktool.jar if "%~dp0\input\twframework-res.apk"
PAUSE
if errorlevel 1 (
echo "An Error Occured, Please Check Your File"
PAUSE
)
goto restart

:DecompileApk
if exist input\*.apk java -jar apktool.jar d -f input\%1*.apk -o "%~dp0\output\%1"
PAUSE
if errorlevel 1 (
echo "An Error Occured, Please Check Your File"
PAUSE
)
goto restart

:BuildApk
echo Building Apk
java -jar apktool.jar b "%~dp0\work"
move "%~dp0\work\dist\SystemUI.apk" "%~dp0\output"
PAUSE
if errorlevel 1 (
echo "An Error Occured, Please Check Your File"
PAUSE
)
goto restart

:Signapk
echo Signing Apk
java -jar signapk.jar -w platform.x509.pem platform.pk8 "%~dp0\output\SystemUI.apk" "%~dp0\signed\SystemUI_signed.apk"
echo Done
PAUSE
if errorlevel 1 (
echo "An Error Occured, Please Check Your File"
PAUSE
)
goto restart

:Baksmali
if errorlevel 1 (
echo "An Error Occured, Please Check Your File"
PAUSE
)
goto restart

:Smali
if errorlevel 1 (
echo "An Error Occured, Please Check Your File"
PAUSE
)
goto restart

:CleanUp
echo Are you sure want to clean your work ?
echo 1.	Yes
echo 2.	No
SET /P menunr=Please make your decision: 
IF %menunr%==1 (goto del)
IF %menunr%==2 (goto restart)
goto restart
:del
echo Clearing Directories
if exist "%userprofile%\apktool" rmdir /S /Q %userprofile%\apktool > nul
if exist "%~dp0\input" rmdir /S /Q input > nul
if exist "%~dp0\output" rmdir /S /Q output > nul
if exist "%~dp0\work" rmdir /S /Q work > nul
if exist "%~dp0\signed" rmdir /S /Q signed > nul
mkdir "%~dp0\input"
mkdir "%~dp0\output"
mkdir "%~dp0\work"
mkdir "%~dp0\signed"
echo Done
PAUSE
goto restart

:ListFiles
call :ChangeTitle
set WhereFrom=%1
set FileCounter=0
set AvailableFilename106=0

:Out
echo Are you sure want to close ?
echo 1.	Yes
echo 2.	No
SET /P menunr=Please make your decision: 
IF %menunr%==1 (goto Exit)
IF %menunr%==2 (goto restart)
goto restart
:Exit
echo Thanks for using this tool
echo Don't forget to press thanks button
echo Happy theming ;)
PAUSE
exit