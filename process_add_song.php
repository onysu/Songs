<?php
require 'db.php'; // Pastikan ada koneksi database

// Periksa jika form dikirim
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  require_once 'vendor/autoload.php'; // Pastikan getID3 dipanggil dengan Composer
  // require 'getid3/getid3.php'; // Pastikan library getID3 tersedia

  $title = $_POST['title'];
  $artist = $_POST['artist'] ?? "Unknown Artist";

  // Cek jika ada file diunggah
  if (isset($_FILES['file']) && $_FILES['file']['error'] == 0) {
    $fileTmpPath = $_FILES['file']['tmp_name'];
    $fileName = $_FILES['file']['name'];
    $fileExtension = pathinfo($fileName, PATHINFO_EXTENSION);

    if (strtolower($fileExtension) == "mp3") {
      $uploadDir = "uploads/";
      if (!file_exists($uploadDir)) {
        mkdir($uploadDir, 0777, true);
      }

      $newFileName = time() . "_" . basename($fileName);
      $destPath = $uploadDir . $newFileName;

      if (move_uploaded_file($fileTmpPath, $destPath)) {
        // Gunakan getID3 untuk mendapatkan metadata lagu
        $getID3 = new getID3();
        $fileInfo = $getID3->analyze($destPath);

        $coverPath = null;
        if (isset($fileInfo['id3v2']['APIC'][0]['data'])) {
          $coverData = $fileInfo['id3v2']['APIC'][0]['data'];
          $coverMime = $fileInfo['id3v2']['APIC'][0]['image_mime'];

          // Simpan gambar cover
          $coverFileName = time() . "_cover.jpg";
          file_put_contents($uploadDir . $coverFileName, $coverData);
          $coverPath = $uploadDir . $coverFileName;
        }

        // Simpan ke database
        $stmt = $conn->prepare("INSERT INTO lagu (title, artist, cover, file) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $title, $artist, $coverPath, $destPath);

        if ($stmt->execute()) {
          echo "<script>alert('Lagu berhasil ditambahkan!'); window.location.href='add_song.php';</script>";
        } else {
          echo "Gagal menyimpan data: " . $stmt->error;
        }
      } else {
        echo "Gagal mengunggah file.";
      }
    } else {
      echo "Format file tidak didukung.";
    }
  } else {
    echo "Harap unggah file lagu.";
  }
}
// Redirect ke index.html jika berhasil
header("Location: index.html");
exit();
$conn->close();
