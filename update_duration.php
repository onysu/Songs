<?php
include "db.php"; // Pastikan koneksi ke database

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $id = isset($_POST["id"]) ? intval($_POST["id"]) : 0;
  $duration = isset($_POST["duration"]) ? intval($_POST["duration"]) : 0;

  // Debugging: Cek apakah data diterima oleh server
  file_put_contents("debug.txt", "ID: $id, Duration: $duration\n", FILE_APPEND);

  if ($id > 0 && $duration > 0) {
    $query = "UPDATE lagu SET duration = ? WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ii", $duration, $id);

    if ($stmt->execute()) {
      echo "Success";
    } else {
      echo "Failed: " . $stmt->error;
    }
  } else {
    echo "Invalid data received.";
  }
} else {
  echo "No POST request received.";
}
