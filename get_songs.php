<?php
// get_songs.php
header("Content-Type: application/json");
require_once 'getid3/getid3.php';

$host = "localhost";
$user = "root";
$password = "";
$dbname = "db_music";

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
  die(json_encode(["error" => "Database connection failed"]));
}

$sql = "SELECT title, artist, duration, file_path FROM songs";
$result = $conn->query($sql);

$songs = [];
$getID3 = new getID3();

while ($row = $result->fetch_assoc()) {
  $file = $row['file_path'];
  $coverPath = "uploads/default_cover.jpg"; // Gambar default
  $duration = null; // Inisialisasi durasi sebagai null

  if (file_exists($file)) {
    $fileInfo = $getID3->analyze($file);
    getid3_lib::CopyTagsToComments($fileInfo); // Salin metadata ke format lebih mudah

    // Ambil durasi jika tersedia
    if (!empty($fileInfo['playtime_seconds'])) {
      $seconds = round($fileInfo['playtime_seconds']);
      $minutes = floor($seconds / 60);
      $seconds = $seconds % 60;
      $duration = sprintf("%d:%02d", $minutes, $seconds); // Format MM:SS
    }

    // Ambil cover album jika ada
    if (!empty($fileInfo['comments']['picture'][0]['data'])) {
      $coverData = $fileInfo['comments']['picture'][0]['data'];
      $coverMime = $fileInfo['comments']['picture'][0]['image_mime'];
      $coverPath = "uploads/covers/" . md5($file) . ".jpg";

      // Simpan gambar cover jika belum ada
      if (!file_exists($coverPath)) {
        file_put_contents($coverPath, $coverData);
      }
    }
  }

  $row['duration'] = $duration; // Simpan durasi ke dalam array
  $row['cover'] = $coverPath; // Simpan path cover album
  $songs[] = $row;
}

echo json_encode($songs);
$conn->close();
