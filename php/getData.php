<?php

$db_name="id16373974_eskdata";
$mysql_username="id16373974_root";
$mysql_password="H_Y@pDjdN6=Os(=s";
$server_name="localhost";

$conn = mysqli_connect($server_name, $mysql_username, $mysql_password, $db_name);

$sth = mysqli_query($conn, "SELECT * FROM Personen");

$rows = array();
while($r = mysqli_fetch_assoc($sth)) {
    $rows[] = $r;
}
echo json_encode($rows);
  
$conn->close();

?>