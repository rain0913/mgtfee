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


if(isset($_POST['submit'])){
    $total = count($_POST['newfee']);
    $unit_arr = $_POST['unit'];
    $newfee_arr = $_POST['newfee'];
    for($i = 0; $i < $total; $i++){
        $unit = $unit_arr[$i];
        $newfee = $newfee_arr[$i];
        $query = "UPDATE AllUnits SET `Amount`= '".$newfee."' WHERE `Unit`= '".$unit."'";
        $mysqli->query($query);
    }
header("location: /system/editfee.php?est=$code");
}

?>
