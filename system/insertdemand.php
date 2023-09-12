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

$month = $_POST['month'];


$sql1="INSERT INTO Total (Unit, Amount)
SELECT AllUnits.Unit, AllUnits.Amount FROM AllUnits ORDER BY AllUnits.Unit";

$cal1="INSERT INTO Cal (Unit, ManageFee)
SELECT AllUnits.Unit, AllUnits.Amount FROM AllUnits ORDER BY AllUnits.Unit";

$sql2="UPDATE Total SET ManageFeeDate = '$month', DemandDate = '$month-01' WHERE ManageFeeDate is NULL";

$cal2="UPDATE Cal SET ManageFeeDate = '$month', DemandDate = '$month-01'";

$sql3="UPDATE IGNORE Total SET DCode = CONCAT(Total.Unit, Total.ManageFeeDate) WHERE DCode is null";

$cal3="UPDATE  Cal SET DCode = CONCAT(Cal.Unit, Cal.ManageFeeDate)";

$cal4="UPDATE Cal INNER JOIN Total SET Cal.AmountPaid = Total.Paid WHERE Total.DCode = Cal.DCode";

$cal5="UPDATE Cal SET Remain=(ManageFee-AmountPaid)";

$cal6="UPDATE Cal SET DCode = CONCAT(Cal.DCode, '-adv'), ManageFeeDate = CONCAT(Cal.ManageFeeDate, '-adv') ";

$cal7="INSERT IGNORE INTO Total (Unit, ManageFeeDate, DCode, Amount, DemandDate)
SELECT Cal.Unit, Cal.ManageFeeDate, Cal.DCode, Cal.Remain, Cal.DemandDate FROM Cal WHERE Cal.Remain >0";

$sqlend="DELETE FROM `Total` WHERE DCode is null";

$calend="TRUNCATE TABLE Cal";

$mysqli->query($sql1);
$mysqli->query($cal1);
$mysqli->query($sql2);
$mysqli->query($cal2);
$mysqli->query($sql3);
$mysqli->query($cal3);
$mysqli->query($cal4);
$mysqli->query($cal5);
$mysqli->query($cal6);
$mysqli->query($cal7);
$mysqli->query($sqlend);
$mysqli->query($calend);

//$sql5="SELECT * FROM Total WHERE ManageFeeDate = '$month'";
//$adv= "-adv";
//$sql6="INSERT INTO Total "


header("Location: /system/receipt.php?est=$code");

?>
