<?php
include 'db.php'; // Koneksi database

$query = $conn->query("SELECT * FROM lagu ORDER BY id ASC");
$songs = [];

while ($row = $query->fetch_assoc()) {
  $songs[] = [
    'id' => htmlspecialchars($row['id']),
    'title' => htmlspecialchars($row['title']),
    'artist' => htmlspecialchars($row['artist']),
    'cover' => htmlspecialchars($row['cover']),
    'file' => htmlspecialchars($row['file'])
  ];
}

header('Content-Type: application/json');
echo json_encode($songs);
