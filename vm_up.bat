@echo off
echo "Booting up UbuntuDatabase VM"
cd Vagrant/UbuntuDatabase
vagrant up
echo "Opening SSH Connection to UbuntuDatabase VM"
start cmd /k "vagrant ssh"

cd ../..

echo "Booting up UbuntuServer VM"
cd Vagrant/UbuntuServer
vagrant up
echo "Opening SSH Connection to UbuntuServer VM"
start cmd /k "vagrant ssh"

echo "Using Python to create environment for Ansible"

:: Check if Python is installed
where python >nul 2>nul
if %errorlevel% == 0 (
    echo Python is installed.
    python --version
) else (
    echo Python is not installed.
    echo Please setup Ansible manually
    goto :exit
)

if not defined PYTHON (set PYTHON=python)
if not defined VENV_DIR (set "VENV_DIR=%~dp0%venv")

for /f "delims=" %%i in ('CALL %PYTHON% -c "import sys; print(sys.executable)"') do set PYTHON_FULLNAME="%%i"

if not exist "%VENV_DIR%" (
    echo Creating virtual environment...
    %PYTHON_FULLNAME% -m venv %VENV_DIR%
) else (
    echo Virtual environment already exists.
)

set PYTHON="%VENV_DIR%\Scripts\Python.exe"
%PYTHON% -m pip install -r requirements.txt
%PYTHON% init.py

:exit