<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: /login.php");
    exit;
    }

require_once('/var/www/html/system/permission_e.php');

?>

<?php
$code = $_GET['est'];
$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");

$tamount = $_POST['total'];

if($tamount>0){
if(isset($_POST['submit'])){

$bankindate = $_POST['BankInDate'];
    $total = count($_POST['RCode']);

    $rcode_arr = $_POST['RCode'];
  //  $amount_arr = $_POST['Amount'];

    for($i = 0; $i < $total; $i++){
        $rcode = $rcode_arr[$i];
  //      $amount = $amount_arr[$i];


$sql = "UPDATE Total SET BankInDate = '$bankindate' WHERE RCode = '$rcode'";
$mysqli->query($sql);
header("Location: /system/bankin.php?est=$code");
}
}
} else {
header("Location: /system/bankin.php?est=$code");}
?>
