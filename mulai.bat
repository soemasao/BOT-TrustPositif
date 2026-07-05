@echo off
rem Perintah ini memastikan skrip dijalankan dari direktori yang benar.
cd /d "%~dp0"

echo [*] Menjalankan BOT-TrustPositif...
echo.

rem Perintah ini mengecek apakah virtual environment sudah ada.
IF EXIST "venv\Scripts\activate.bat" (
    echo [*] Mengaktifkan virtual environment...
    call venv\Scripts\activate.bat
) ELSE (
    echo [!] Virtual environment tidak ditemukan.
    echo [*] Membuat virtual environment baru...
    python -m venv venv
    
    rem Memberikan jeda 2 detik agar Windows selesai menulis file venv ke disk
    timeout /t 2 /nobreak >nul
    
    echo [*] Mengaktifkan virtual environment yang baru dibuat...
    call venv\Scripts\activate.bat
)

echo.
rem Memeriksa dan memperbarui pip (Dipaksa pakai Python venv)
echo [*] Memeriksa dan memperbarui pip...
.\venv\Scripts\python.exe -m pip install --upgrade pip --quiet

echo.
rem Perintah ini mengecek dan menginstal library yang dibutuhkan (Dipaksa pakai pip venv)
IF EXIST "requirements.txt" (
    echo [*] Memeriksa dan menginstal library dari requirements.txt...
    .\venv\Scripts\pip.exe install -r requirements.txt --quiet
    echo [*] Selesai menginstal/memeriksa library!
) ELSE (
    echo [!] File requirements.txt tidak ditemukan!
    echo [!] Tidak bisa menginstal dependency.
)

echo.
echo [*] Menjalankan file utama bot (main.py)...
rem Dipaksa menjalankan bot menggunakan Python milik venv
.\venv\Scripts\python.exe src/main.py

echo.
echo [*] Proses selesai. Tekan tombol apa saja untuk keluar...
pause