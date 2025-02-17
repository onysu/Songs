<?php
header("Content-Type: application/json");
$conn = new mysqli("localhost", "root", "", "db_music");

if ($conn->connect_error) {
  die(json_encode(["error" => "Database connection failed"]));
}

$result = $conn->query("SELECT * FROM songs");
$songs = [];

while ($row = $result->fetch_assoc()) {
  $songs[] = $row;
}

echo json_encode($songs);
$conn->close();
