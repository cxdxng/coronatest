<?php

  $id = $_POST['id'];
  $name = $_POST['vornachName']
  if (empty($name)) {
    echo "Name is empty";
  } else {
    echo $id " : " $name;
  }
}
?>