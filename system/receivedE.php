<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
    }

require_once('/var/www/html/permission.php');

?>

<?php
$code = $_GET['est'];
header("Content-Type:text/html; charset=utf-8");
$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");



if (isset($_GET['start'])){
$month1 = $_GET['start'];
$month2 = $_GET['end'];
$sql = "SELECT ReceivedDate, Unit, GROUP_CONCAT(ManageFeeDate), SUM(Paid), Method, RCode, BCQ FROM Total WHERE DATE(ReceivedDate) BETWEEN '$month1' AND '$month2' GROUP BY  RCode, Unit, ReceivedDate, Method, BCQ ORDER BY ReceivedDate, RCode";
$setRec = $mysqli->query($sql);
$name="Received Report";
$date="From".$month1."to".$month2;
$columnHeader = '';
$columnHeader = "ReceivedDate" . "\t" . "Unit" . "\t" . "Items" . "\t"."Amount"."\t"."Method"."\t"."RceiptNo."."\t"."ChequeNo.";
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
header("Content-Disposition: attachment; filename=$name $month2.xls");
header("Pragma: no-cache");
header("Expires: 0");

  echo ucwords($name) . "\n" .ucwords($date) . "\n" .ucwords($columnHeader) . "\n" . $setData . "\n";
 }


?>
