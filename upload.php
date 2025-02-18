<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_music";

// Buat koneksi ke database
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi database
if ($conn->connect_error) {
  die("Koneksi gagal: " . $conn->connect_error);
}

// Debug: Lihat data yang dikirim
if ($_SERVER["REQUEST_METHOD"] === "POST") {
  echo "<pre>";
  print_r($_FILES);
  print_r($_POST);
  echo "</pre>";
}

// Periksa apakah request adalah POST dan file diunggah
if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_FILES["song"])) {
  // Tangkap data input
  $title = isset($_POST["title"]) ? $conn->real_escape_string($_POST["title"]) : "";
  $artist = isset($_POST["artist"]) ? $conn->real_escape_string($_POST["artist"]) : "";

  // Pastikan ada judul dan artis
  if (empty($title) || empty($artist)) {
    die("Judul dan artis harus diisi.");
  }

  // Pastikan folder uploads ada
  $targetDir = "uploads/";
  if (!file_exists($targetDir)) {
    mkdir($targetDir, 0777, true);
  }

  // Tangkap informasi file
  $fileName = basename($_FILES["song"]["name"]);
  $fileTmpPath = $_FILES["song"]["tmp_name"];
  $fileSize = $_FILES["song"]["size"];
  $fileError = $_FILES["song"]["error"];
  $fileType = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
  $targetFilePath = $targetDir . time() . "_" . $fileName;

  // Debug: Lihat informasi file
  echo "<br>Nama File: $fileName";
  echo "<br>Lokasi Sementara: $fileTmpPath";
  echo "<br>Ukuran File: $fileSize";
  echo "<br>Error Code: $fileError";
  echo "<br>Ekstensi File: $fileType";

  // Periksa apakah file benar-benar dikirim
  if ($fileError !== 0) {
    die("<br>Terjadi error saat upload! Kode error: $fileError");
  }

  // Cek ekstensi yang diperbolehkan
  $allowedTypes = ["mp3", "wav", "ogg"];
  if (!in_array($fileType, $allowedTypes)) {
    die("<br>Format file tidak didukung.");
  }

  // Pindahkan file ke folder uploads
  if (move_uploaded_file($fileTmpPath, $targetFilePath)) {
    // Debug: Konfirmasi penyimpanan file
    echo "<br>File berhasil dipindahkan ke: $targetFilePath";

    // Simpan ke database
    $sql = "INSERT INTO songs (title, artist, file_path) VALUES ('$title', '$artist', '$targetFilePath')";
    if ($conn->query($sql) === TRUE) {
      echo "<br>File berhasil disimpan ke database!";
    } else {
      echo "<br>Gagal menyimpan ke database: " . $conn->error;
    }
  } else {
    die("<br>Gagal menyimpan file ke folder uploads.");
  }
} else {
  die("<br>Tidak ada file yang diunggah.");
}
// Redirect ke index.html jika berhasil
header("Location: index.html");
exit();
$conn->close();
