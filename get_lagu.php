<?php
header("Content-Type: application/json");
require_once 'vendor/autoload.php'; // Pastikan getID3 dipanggil dengan Composer

$host = "localhost";
$user = "root";
$password = "";
$dbname = "db_music";

$conn = new mysqli($host, $user, $password, $dbname);
if ($conn->connect_error) {
  die(json_encode(["error" => "Database connection failed"]));
}

// Ambil semua lagu dari database
$sql = "SELECT id, title, artist, cover, file FROM lagu";
$result = $conn->query($sql);
$lagu = [];

$getID3 = new getID3();

while ($row = $result->fetch_assoc()) {
  $file = realpath($row['file']); // Pastikan path absolut
  $coverPath = $row['cover'] ?: "uploads/default_cover.png"; // Gunakan cover dari database atau default
  $duration = null;

  if ($file && file_exists($file)) {
    $fileInfo = $getID3->analyze($file);
    getid3_lib::CopyTagsToComments($fileInfo);

    // Ambil durasi
    if (!empty($fileInfo['playtime_seconds'])) {
      $seconds = round($fileInfo['playtime_seconds']);
      $minutes = floor($seconds / 60);
      $seconds = $seconds % 60;
      $duration = sprintf("%d:%02d", $minutes, $seconds); // Format MM:SS
    }

    // Ambil cover dari metadata
    if (empty($row['cover']) && !empty($fileInfo['comments']['picture'][0]['data'])) {
      $coverData = $fileInfo['comments']['picture'][0]['data'];
      $coverMime = $fileInfo['comments']['picture'][0]['image_mime'];
      $coverExt = str_replace('image/', '', $coverMime);
      $coverPath = "uploads/" . md5($file) . ".$coverExt";

      // Simpan cover jika belum ada
      if (!file_exists($coverPath)) {
        file_put_contents($coverPath, $coverData);

        // Update database dengan cover baru
        $stmt = $conn->prepare("UPDATE lagu SET cover = ? WHERE id = ?");
        $stmt->bind_param("si", $coverPath, $row['id']);
        $stmt->execute();
      }
    }
  }

  $row['duration'] = $duration;
  $row['cover'] = $coverPath;
  $lagu[] = $row;
}

echo json_encode($lagu);
$conn->close();
