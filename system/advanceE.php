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
header("Content-Type:text/html; charset=utf-8");
$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");
$output='';


if (isset($_GET['end'])){
$month = $_GET['end'];
$sql = "SELECT ReceivedDate, Unit, ManageFeeDate, Amount, Method FROM Total WHERE DATE(DemandDate) > '$month' AND ReceivedDate <= '$month' ORDER BY ReceivedDate, Unit, ManageFeeDate";
$setRec = $mysqli->query($sql);
$name="Advance Report";
$date="Due to ".$month;
$columnHeader = '';
$columnHeader = "ReceivedDate" . "\t" . "Unit" . "\t" . "Items" . "\t"."Amount"."\t"."Method";
$setData = '';
  while ($rec = mysqli_fetch_row($setRec)) {

    $rowData = '';
    foreach ($rec as $value) {
        $value = '"' . $value . '"' . "\t";
        $rowData .= $value;
    }
    $setData .= trim($rowData) . "\n";
}

header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=$name $month.xls");
header("Pragma: no-cache");
header("Expires: 0");

  echo ucwords($name) . "\n" .ucwords($date) . "\n" .ucwords($columnHeader) . "\n" . $setData . "\n";
 }
?>
