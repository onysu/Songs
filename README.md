# songs
 Music Player


# Composer
Ketika instal Composer-Setup.exe pada checkbox Developer mode apakah di centang atau dibiarkan kosong?
Q: kosongkan

Pada Choose the command-line PHP you want to use: [Browse]
apa yg harus sy lakukan?
Q: cari file php.exe

Checkbox Add this PHP to your path?
Apakah dicentang atau dibiarkan kosong?
Q: sebaiknya kosongkan

# getID3
Install ulang library getID3:
composer require james-heinrich/getid3

Cek log Composer dengan:
composer diagnose

Pastikan paket james-heinrich/getid3 masih ada di composer.json. Cek dengan:
composer show james-heinrich/getid3

Cek apakah getID3 sudah terinstal dengan Composer:
composer show | findstr getid3

 Update getID3 dengan Composer:
 composer update



