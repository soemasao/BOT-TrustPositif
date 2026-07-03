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
    echo "[*] Mengaktifkan virtual environment yang baru dibuat..."
    source venv/bin/activate
fi

echo ""
echo "[*] Memeriksa dan memperbarui pip..."
python3 -m pip install --upgrade pip --quiet

echo ""
# Mengecek dan menginstal library
if [ -f "requirements.txt" ]; then
    echo "[*] Memeriksa dan menginstal library dari requirements.txt..."
    pip install -r requirements.txt --quiet
    echo "[*] Selesai menginstal/memeriksa library!"
else
    echo "[!] File requirements.txt tidak ditemukan!"
    echo "[!] Tidak bisa menginstal dependency."
fi

echo ""
echo "[*] Menjalankan file utama bot (main.py)..."
python3 src/main.py