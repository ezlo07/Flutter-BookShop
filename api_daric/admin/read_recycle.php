<?php
include '../connection.php';

$sqlQuery = "SELECT * FROM recycle_table ORDER BY dateTime DESC";  

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery->num_rows > 0) 
{
    $recycleRecord = array();
    while($rowFound = $resultOfQuery->fetch_assoc())
    {
        $recycleRecord[] = $rowFound;
    }

    echo json_encode(
        array(
            "success"=>true,
            "allRecycleData"=>$recycleRecord,
        )
    );
}
else 
{
    echo json_encode(array("success"=>false));
}


