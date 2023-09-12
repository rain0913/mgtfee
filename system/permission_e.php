<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
    }

$code = $_GET['est'];

$conn = new mysqli('localhost', 'root', 'password', $code)
  or die (mysqli_error($conn));

$username = $_SESSION["username"];

$sql = "SELECT role FROM Users WHERE username = ?";

$stmt = $conn->stmt_init();
$stmt->prepare($sql);

$stmt->bind_param('s', $username);

$stmt->execute();

$stmt->bind_result($role);

$stmt->fetch();

if ('s'== $role || 'p'== $role || 'n'== $role) {

} else {

  echo 'No permission to visit this page';

  exit;}

?>
