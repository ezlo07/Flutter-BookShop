<?php
include '../connection.php';

$user_id = $_POST['user_id'];
$serialNo = $_POST['serialNo'];
$ibanNo = $_POST['ibanNo'];

$stmt = $connectNow->prepare("SELECT cargoNo FROM recycle_table WHERE user_id = ? AND serialNo = ? AND ibanNo = ?");
$stmt->bind_param("sss", $user_id, $serialNo, $ibanNo);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $cargoNo = $row['cargoNo'];

    // Return the cargoNo as the response
    echo $cargoNo;
} else {
    // Handle the case when the checks fail
    echo json_encode(array("Please fill in the blanks."));
}

$stmt->close();
$connectNow->close();
?>
