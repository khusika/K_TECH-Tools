@echo off
echo K_TECH TOOLS
echo Signing "%~n1"
java -jar signapk.jar -w platform.x509.pem platform.pk8 "%~dp0\%~n1%~x1" "%~dp0\%~n2%~x2"
echo Signed "%~n2%~x2"