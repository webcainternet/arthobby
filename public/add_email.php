<?php

include 'config.php';

$emailadd = $_POST["add"];

$mysqli = new mysqli(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

if (mysqli_connect_errno()) {
	printf("Connect failed: %s\n", mysqli_connect_error());
exit();
}

$sql = "insert into wca_newsletter (email) values ('$emailadd')";

$result = $mysqli->query($sql);
?>