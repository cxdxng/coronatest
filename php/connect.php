<?php

$db_name="id16373974_eskdata";
$mysql_username="id16373974_root";
$mysql_password="H_Y@pDjdN6=Os(=s";
$server_name="localhost";

$conn = mysqli_connect($server_name, $mysql_username, $mysql_password, $db_name);

if($conn){
echo "Connection success!"."<br>";}
else{
	echo"Fail";
}

$sql = "SELECT * FROM Personen";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
      echo "id: " . $row["id"]. " name: ". $row["vornachname"]. "<br>";
    }
  } else {
    echo "0 results";
  }
  $conn->close();

?>