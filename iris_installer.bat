
echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 0c
    echo Starte die Datei als Administrator neu...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
cls
winget install Oracle.JDK.22
cd /d "%~dp0"
cls
echo Java is installed.
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/IrisShaders/Iris-Installer/releases/download/3.2.1/Iris-Installer-3.2.1.jar', 'iris.jar')"
powershell -Command "Invoke-WebRequest https://github.com/IrisShaders/Iris-Installer/releases/download/3.2.1/Iris-Installer-3.2.1.jar -OutFile iris.jar"
cls
echo Java is installed.
echo Iris Shaders are downloaded.
java -jar iris.jar
cls
timeout /t 2
del iris.jar
cls
echo.
echo - - - Iris Installer by einfachniemmand (0.0.3) - - -
echo.
echo    Iris should be installed.
echo    Check your launcher for an Installiation called "Paper" or "Iris"!
timeout /t 30
        