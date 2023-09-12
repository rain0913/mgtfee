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

if (isset($_GET['add'])){
$Unit = $_GET['add'];
$sql = "SELECT * FROM AllUnits WHERE Unit = '$Unit'";
$result = $mysqli->query($sql);

$month= $_POST['month'];
$sql1="INSERT INTO Total (Unit, Amount)
SELECT AllUnits.Unit, AllUnits.Amount FROM AllUnits WHERE Unit='$Unit'";

$cal1="INSERT INTO Cal (Unit, ManageFee)
SELECT AllUnits.Unit, AllUnits.Amount FROM AllUnits WHERE Unit='$Unit'";

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

header("Location: /system/payment.php?est=$code&search=$Unit");
}




if (isset($_GET['div'])){
$Unit = $_GET['div'];
$ManageFeeDate = $_GET['m'];
$ManageFeeDate2 = $_GET['m']."-apart";
$ManageFeeDate3 = $_GET['m']."-apart-apart";
$Amount = $_POST['Amount'];
$sql = "SELECT * FROM Total WHERE Unit = '$Unit' AND ManageFeeDate = '$ManageFeeDate'";
$nsql = "SELECT * FROM Total WHERE Unit = '$Unit' AND ManageFeeDate = '$ManageFeeDate2'";
//$OAmount ="SELECT Amount FROM Total WHERE Unit = '$Unit' AND ManageFeeDate = '$ManageFeeDate'";

$result = $mysqli->query($sql);
while($row = $result->fetch_assoc()) {
   $OAmount = $row['Amount'];
}
$result2 = $mysqli->query($nsql);
if ($result2){
$row=mysqli_num_rows($result2);
if($row ==0){
$Ddate = substr("$ManageFeeDate", 0, 7);
$sql1="INSERT INTO Total (Unit, Amount, ManageFeeDate, DemandDate) VALUES ('$Unit', '$Amount', '$ManageFeeDate2', '$Ddate-01')";
$sql2="UPDATE Total SET Amount = $OAmount - $Amount WHERE Unit = '$Unit' AND ManageFeeDate = '$ManageFeeDate'";
$sql3="UPDATE Total SET DCode = CONCAT(Total.Unit, Total.ManageFeeDate) WHERE DCode is null";
$sql4="DELETE FROM `Total` WHERE DCode is null";


$mysqli->query($sql1);
$mysqli->query($sql2);
$mysqli->query($sql3);
$mysqli->query($sql4);
}
}
header("Location: /system/payment.php?est=$code&search=$Unit");

}


if (isset($_GET['u'])){
$Unit = $_GET['u'];
$sql = "SELECT * FROM AllUnits WHERE Unit = '$Unit'";
$result = $mysqli->query($sql);
$month= $_POST['month'];

$sql1="INSERT INTO Total (Unit, Amount)
SELECT AllUnits.Unit, AllUnits.Amount FROM AllUnits WHERE Unit='$Unit'";

$sql2="UPDATE Total SET ManageFeeDate = 'deposit-$month', DemandDate = '$month-01' WHERE ManageFeeDate is NULL";

$sql3="UPDATE IGNORE Total SET DCode = CONCAT(Total.Unit, Total.ManageFeeDate) WHERE DCode is null";

$sqlend="DELETE FROM `Total` WHERE DCode is null";

$mysqli->query($sql1);
$mysqli->query($sql2);
$mysqli->query($sql3);
$mysqli->query($sqlend);

header("Location: /system/payment.php?est=$code&search=$Unit");
}
?>
