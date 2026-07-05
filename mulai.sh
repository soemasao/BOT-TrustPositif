#!/bin/bash
# Pindah ke direktori skrip dijalankan
cd "$(dirname "$0")"

echo "[*] Menjalankan BOT-TrustPositif..."
echo ""

# Mengecek apakah virtual environment sudah ada
if [ -f "venv/bin/activate" ]; then
    echo "[*] Mengaktifkan virtual environment..."
    source venv/bin/activate
else
    echo "[!] Virtual environment tidak ditemukan."
    echo "[*] Membuat virtual environment baru..."
    python3 -m venv venv
    
    # Memberi jeda 1 detik agar macOS selesai menulis file sistem venv
    sleep 1
    
    echo "[*] Mengaktifkan virtual environment yang baru dibuat..."
    source venv/bin/activate
fi

echo ""
echo "[*] Memeriksa dan memperbarui pip..."
# Dipaksa menggunakan python di dalam venv
./venv/bin/python3 -m pip install --upgrade pip --quiet

echo ""
# Mengecek dan menginstal library
if [ -f "requirements.txt" ]; then
    echo "[*] Memeriksa dan menginstal library dari requirements.txt..."
    # Dipaksa menggunakan pip di dalam venv
    ./venv/bin/pip install -r requirements.txt --quiet
    echo "[*] Selesai menginstal/memeriksa library!"
else
    echo "[!] File requirements.txt tidak ditemukan!"
    echo "[!] Tidak bisa menginstal dependency."
fi

echo ""
echo "[*] Menjalankan file utama bot (main.py)..."
# Dipaksa menjalankan bot menggunakan Python milik venv
./venv/bin/python3 src/main.py