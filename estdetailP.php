<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
    }

$update = false;
$code ='';
$chname ='';
$enname = '';
$ps='';
$status='';
$puser='';
$nuser='';

if (isset($_POST['save'])){

  $code = $_POST['code'];
  $conn = new mysqli('localhost', 'root', 'password')
  or die (mysqli_error($mysqli));

 $conn->query("CREATE DATABASE IF NOT EXISTS `$code`");

 $sqlt1="CREATE TABLE IF NOT EXISTS `AllUnits` (
  `ID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Unit` varchar(256) NOT NULL UNIQUE,
  `Floor` varchar(255) DEFAULT NULL,
  `Un` varchar(255) DEFAULT NULL,
  `Amount` int NOT NULL,
  `ChineseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnglishName` text);";

 $sqlt2="CREATE TABLE IF NOT EXISTS `Cal` (
  `ID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Unit` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `ManageFee` int DEFAULT NULL,
  `AmountPaid` int DEFAULT NULL,
  `Remain` int DEFAULT NULL);";

 $sqlt3="CREATE TABLE IF NOT EXISTS `Cancel` (
  `ID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Editor` varchar(255) DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` varchar(255) DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL,
  `Comment` varchar(535) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Delete_at` DATETIME DEFAULT CURRENT_TIMESTAMP);";

 $sqlt4="CREATE TABLE IF NOT EXISTS `Receipt` (
    `ID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `RCode` int DEFAULT NULL,
    `DCode` varchar(255) NOT NULL,
    `Paid` int DEFAULT NULL,
    `Date` date DEFAULT NULL);";

$sqlt5="CREATE TABLE IF NOT EXISTS `Total` (
  `ID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Unit` varchar(255) NOT NULL,
  `ManageFeeDate` varchar(255) DEFAULT NULL,
  `DCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL UNIQUE,
  `Amount` int NOT NULL,
  `Method` varchar(255) DEFAULT NULL,
  `BCQ` varchar(255) DEFAULT NULL,
  `Paid` varchar(255) DEFAULT NULL,
  `RCode` int DEFAULT NULL,
  `DemandDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `BankInDate` date DEFAULT NULL);";

  $sqlt6="CREATE TABLE IF NOT EXISTS `Users` (
    `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` varchar(255) NOT NULL,
    `role` varchar(255) NOT NULL);";



$mysqli2 = new mysqli('localhost', 'root', 'password', $code)
  or die (mysqli_error($mysqli));
 $mysqli2->query($sqlt1);
 $mysqli2->query($sqlt2);
 $mysqli2->query($sqlt3);
 $mysqli2->query($sqlt4);
 $mysqli2->query($sqlt5);
 $mysqli2->query($sqlt6);


 $mysqli = new mysqli('localhost', 'root', 'password', 'Estate')
 or die (mysqli_error($mysqli));

    $code = $_POST['code'];
    $chname = $_POST['chname'];
    $enname = $_POST['enname'];
    $ps = $_POST['ps'];
    $status = $_POST['status'];
    $puser = $_POST['puser'];
    $nuser = $_POST['nuser'];


    $mysqli->query("INSERT INTO List(code, chname, enname, ps, status, puser, nuser)
    VALUES('$code', '$chname', '$enname', '$ps', '$status', '$puser', '$nuser')");

$mysqli3 = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));

$mysqli3->query("INSERT INTO Users(username, role)
VALUES('$puser', 's')");
$mysqli3->query("INSERT INTO Users(username, role)
VALUES('$nuser', 's')");


    header("location: management.php");
}


if (isset($_GET['edit'])){

  $mysqli = new mysqli('localhost', 'root', 'password', 'Estate')
  or die (mysqli_error($mysqli));
  $mysqli->query("SET NAMES UTF8");

$id = $_GET['edit'];
$update = true;
$sql = "SELECT * FROM List WHERE id = '$id'";
$result = $mysqli->query($sql);

 if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
  $code = $row['code'];
  $chname= $row['chname'];
  $enname = $row['enname'];
  $ps = $row['ps'];
  $status = $row['status'];
  $puser = $row['puser'];
  $nuser = $row['nuser'];
  }
 }
}


if (isset($_POST['update'])){

  $mysqli = new mysqli('localhost', 'root', 'password', 'Estate')
  or die (mysqli_error($mysqli));
  $mysqli->query("SET NAMES UTF8");

$id = $_POST['id'];
$code = $_POST['code'];
$chname = $_POST['chname'];
$enname = $_POST['enname'];
$ps = $_POST['ps'];
$status = $_POST['status'];
$puser = $_POST['puser'];
$nuser = $_POST['nuser'];

$Ocode ="SELECT * FROM List WHERE id = '$id'";
$Oresult = $mysqli->query($Ocode);
while($row = $Oresult->fetch_assoc()) {
   $OOcode = $row['code'];

$sql="SELECT * FROM Total WHERE code='$OOcode' AND ReceivedDate IS NULL";
    $result = $mysqli->query($sql);
    if ($result->num_rows==0){

$mysqli->query("UPDATE List SET code='$code', chname='$chname', enname='$enname', ps='$ps', status='$status', puser='$puser', nuser='$nuser' WHERE id='$id'");

$mysqli3 = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));

$mysqli3->query("UPDATE Users SET username ='$puser' WHERE id='1'");
$mysqli3->query("UPDATE Users SET username ='$nuser' WHERE id='2'");

header("location: management.php");
} else {

$mysqli->query("UPDATE List SET chname='$chname', enname='$enname', ps='$ps', status='$status', puser='$puser', nuser='$nuser' WHERE id='$id'");

header("location: managemant.php");}}}
?>
