<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
    }

$conn = new mysqli('localhost', 'root', 'password', 'Estate')
  or die (mysqli_error($mysqli));

$username = $_SESSION["username"];

$sql = "SELECT role FROM users WHERE username = ?";

$stmt = $conn->stmt_init();
$stmt->prepare($sql);

$stmt->bind_param('s', $username);

$stmt->execute();

$stmt->bind_result($role);

$stmt->fetch();

if ('s'== $role || 'p'== $role) {

} else {

  echo 'No permission to visit this page';
  exit;}

?>
