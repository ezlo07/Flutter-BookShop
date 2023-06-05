<?php
include '../connection.php';

$user_id = $_POST['user_id'];
$serialNo = $_POST['serialNo'];
$ibanNo = $_POST['ibanNo'];


$sqlQuery = "UPDATE `recycle_table` SET `ibanNo`='$ibanNo' 
WHERE `user_id`='$user_id' AND serialNo = '$serialNo'";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery)
{
    echo json_encode(array("success"=>true));
}
else
{
    echo json_encode(array("success"=>false));
}

