@ECHO OFF
cd /d "%~dp0"
java -jar baksmali-2.0.3.jar -o classout/ classes.dex