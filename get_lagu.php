<?php
header('Content-Type: application/json');
include 'db.php'; // Pastikan file koneksi database tersedia

$sql = "SELECT title, file FROM lagu";
$result = $conn->query($sql);

$songs = [];
while ($row = $result->fetch_assoc()) {
  $songs[] = [
    'title' => $row['title'],
    'file' => $row['file']
  ];
}

echo json_encode($songs);
