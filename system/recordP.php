<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: /login.php");
    exit;
    }

require_once('/var/www/html/system/permission_e.php');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
?>
<?php
$code = $_GET['est'];
$Editor = $_SESSION["username"];
$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");

if (isset($_GET['delete'])){
$Unit = $_GET['delete'];
$DCode = $_GET['d'];

$stmt = $mysqli->prepare("INSERT INTO Cancel (Editor, Unit, ManageFeeDate,
  DCode, Amount, Method, BCQ, Paid, RCode, DemandDate, ReceivedDate, BankInDate)
  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

$stmt->bind_param("ssssisssssss", $Editor, $Unit2, $ManageFeeDate2, $DCode2,
$Amount2, $Method2, $BCQ2, $Paid2, $RCode2, $DemandDate2, $ReceivedDate2, $BankInDate2);

$m1 = $mysqli->query("SELECT Total.Unit, Total.ManageFeeDate, Total.DCode, Total.Amount,
  Total.Method, Total.BCQ, Total.Paid, Total.RCode, Total.DemandDate, Total.ReceivedDate,
  Total.BankInDate FROM Total WHERE DCode='$DCode'");

  while ($row = $m1->fetch_assoc()) {
    $Unit2 = $row['Unit'];
    $ManageFeeDate2 = $row['ManageFeeDate'];
    $DCode2 = $row['DCode'];
    $Amount2 = $row['Amount'];
    $Method2 = $row['Method'];
    $BCQ2 = $row['BCQ'];
    $Paid2 = $row['Paid'];
    $RCode2 = $row['RCode'];
    $DemandDate2 = $row['DemandDate'];
    $ReceivedDate2 = $row['ReceivedDate'];
    $BankInDate2 = $row['BankInDate'];
  }

$stmt->execute();

$mysqli->query("DELETE FROM Total WHERE DCode='$DCode'") ;
$mysqli->query("DELETE FROM Receipt WHERE DCode='$DCode'") ;

header("location: /system/payment.php?est=$code&search=$Unit");
}

if (isset($_GET['del'])){
$Unit = $_GET['del'];
$RCode = $_GET['r'];

$stmt = $mysqli->prepare("INSERT INTO Cancel (Editor, Unit, ManageFeeDate,
  DCode, Amount, Method, BCQ, Paid, RCode, DemandDate, ReceivedDate, BankInDate)
  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

$stmt->bind_param("ssssisssssss", $Editor, $Unit2, $ManageFeeDate2, $DCode2, 
$Amount2, $Method2, $BCQ2, $Paid2, $RCode2, $DemandDate2, $ReceivedDate2, $BankInDate2);

$m1 = $mysqli->query("SELECT Total.Unit, Total.ManageFeeDate, Total.DCode, Total.Amount,
  Total.Method, Total.BCQ, Total.Paid, Total.RCode, Total.DemandDate, Total.ReceivedDate,
  Total.BankInDate FROM Total WHERE RCode='$RCode'");

  while ($row = $m1->fetch_assoc()) {
    $Unit2 = $row['Unit'];
    $ManageFeeDate2 = $row['ManageFeeDate'];
    $DCode2 = $row['DCode'];
    $Amount2 = $row['Amount'];
    $Method2 = $row['Method'];
    $BCQ2 = $row['BCQ'];
    $Paid2 = $row['Paid'];
    $RCode2 = $row['RCode'];
    $DemandDate2 = $row['DemandDate'];
    $ReceivedDate2 = $row['ReceivedDate'];
    $BankInDate2 = $row['BankInDate'];
  }

$stmt->execute();

$mysqli->query("UPDATE Total SET Method = NULL, BCQ = NULL, Paid = NULL,
  RCode = NULL, ReceivedDate = NULL WHERE RCode = '$RCode'");


header("location: /system/record.php?est=$code&search=$Unit");
}


if (isset($_GET['edit'])){
$rcode = $_GET['edit'];
$Method = $_POST['method'];
$ReceivedDate = $_POST['ReceivedDate'];
$BCQ = $_POST['bankcode'].$_POST['chequecode'];

$sql = "UPDATE Total SET Method = '$Method', ReceivedDate = '$ReceivedDate', BCQ = '$BCQ' WHERE RCode = '$rcode'";

$mysqli->query($sql);

$sqlunit = "SELECT DISTINCT Unit FROM Total WHERE RCode = '$rcode'";
$runit = $mysqli->query($sqlunit);
$unitrow = mysqli_fetch_assoc($runit);
$unit = $unitrow['Unit'];


header("Location: /system/record.php?est=$code&search=$unit"); }

?>
