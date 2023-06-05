<?php
include '../connection.php';

$userID = $_POST["user_id"];
$checkID = $userID;
$serialNo = $_POST["serialNo"];
$checkSerial = $serialNo;
$ibanNo = $_POST["ibanNo"];
$dateTime = $_POST["dateTime"]; // Current Time
$cargoNumber = $_POST["cargoNo"];

// Serial No Check
$serialQuery = "SELECT * FROM items_table WHERE serialNo='$serialNo'";
$resultOfSerialQuery = $connectNow->query($serialQuery);

if ($resultOfSerialQuery->num_rows > 0) {
    // DateTime Check
    $oneMonthAgo = date('Y-m-d H:i:s', strtotime('-1 month', strtotime($dateTime)));
    $dateQuery = "SELECT * FROM orders_table WHERE dateTime > '$oneMonthAgo'";
    $resultOfDateQuery = $connectNow->query($dateQuery);

    if ($resultOfDateQuery->num_rows > 0) {

        //Check this recycle already created
        $alreadyQuery = "SELECT * FROM recycle_table WHERE 'serialNo' != '$checkSerial' AND 'user_id'!='$userID'";
        $resultOfAlreadyQuery = $connectNow->query($alreadyQuery);
        if($resultOfAlreadyQuery){
            $recycleQuery = "INSERT INTO recycle_table (user_id, serialNo, ibanNo, dateTime, cargoNo)
                SELECT '$userID', '$serialNo', '$ibanNo', '$dateTime', '$cargoNumber'
                FROM dual
                WHERE NOT EXISTS (
                    SELECT 1
                    FROM recycle_table
                    WHERE serialNo = '$serialNo' AND user_id = '$userID'
                )";
            $resultOfRecycleQuery = $connectNow->query($recycleQuery);
            if ($resultOfRecycleQuery) {
                echo json_encode(array("success" => true));
            } 
            else {
                echo json_encode(array("success" => false));
            }
        }
        else{
            echo json_encode(array("success" => false, "message" => "This Recycle Already Created."));
        }  
    } 
    else {
        echo json_encode(array("success" => false, "message" => "DateTime check failed."));
    }
} 
else {
    echo json_encode(array("success" => false, "message" => "Serial number check failed."));
}

?>