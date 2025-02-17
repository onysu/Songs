<?php
// Set header untuk JSON output
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *"); // Jika ingin diakses dari domain lain

// Load getID3
require_once __DIR__ . '/getid3/getid3.php';

// Koneksi ke database
$host = "localhost";
$user = "root";
$password = "";
$dbname = "db_music";

$conn = new mysqli($host, $user, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
  http_response_code(500);
  die(json_encode(["error" => "Database connection failed: " . $conn->connect_error]));
}

// Pastikan karakter set menggunakan UTF-8
$conn->set_charset("utf8mb4");

// Query untuk mengambil data lagu
$sql = "SELECT title, artist, file_path FROM songs";
$result = $conn->query($sql);

$songs = [];
$getID3 = new getID3(); // Inisialisasi getID3

if ($result) {
  while ($row = $result->fetch_assoc()) {
    $file_path = __DIR__ . '/' . $row['file_path']; // Path absolut

    if (file_exists($file_path)) {
      // Ambil metadata lagu
      $file_info = $getID3->analyze($file_path);
      $duration = isset($file_info['playtime_string']) ? $file_info['playtime_string'] : null;
    } else {
      $duration = null; // Jika file tidak ditemukan
    }

    $songs[] = [
      "title" => $row["title"],
      "artist" => $row["artist"],
      "duration" => $duration,
      "file_path" => $row["file_path"]
    ];
  }
  $result->free();
}

// Tutup koneksi
$conn->close();

// Output JSON
echo json_encode($songs, JSON_PRETTY_PRINT);
