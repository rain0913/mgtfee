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


$Paid = $_POST['Paid'];
$tamount = $_POST['total'];

$ac=$mysqli->query("SELECT IFNULL( MAX(RCode) , 0)+1 FROM Receipt");

if ($ac->num_rows > 0) {
  while($rac = $ac->fetch_assoc()) {
    $rrac = $rac['IFNULL( MAX(RCode) , 0)+1'];
  }
  }


if($Paid==$tamount&&$tamount>0){

if(isset($_POST['submit'])){
    $total = count($_POST['DCode']);

    $dcode_arr = $_POST['DCode'];
    $amount_arr = $_POST['Amount'];

    for($i = 0; $i < $total; $i++){
        $dcode = $dcode_arr[$i];
        $amount = $amount_arr[$i];

$sql = "UPDATE Total SET Paid = '$amount' WHERE DCode = '$dcode'";
$mysqli->query($sql);

$Method = $_POST['method'];
$ReceivedDate = $_POST['ReceivedDate'];
$BCQ = $_POST['bankcode'].$_POST['chequecode'];


$sql2 = "UPDATE Total SET Method = '$Method', ReceivedDate = '$ReceivedDate', BCQ = '$BCQ', RCode = '$rrac' WHERE DCode = '$dcode'";


$sql3 = "INSERT INTO Receipt (RCode, DCode, Paid, Date) VALUES ('$rrac', '$dcode', '$amount', '$ReceivedDate')";
//$RCode = "UPDATE Total INNER JOIN Receipt SET Total.RCode = Receipt.RCode WHERE Receipt.DCode = Total.DCode";


$mysqli->query($sql2);
$mysqli->query($sql3);
//$mysqli->query($RCode);

$back ="SELECT * FROM Total WHERE DCode = '$dcode'";
$result = $mysqli->query($back);
while($row = $result->fetch_assoc()) {
   $Unit = $row['Unit'];
header("Location: /system/payment.php?est=$code&search=$Unit");

}
}
}
}else{
echo "<script>
alert('銀碼錯誤');
  window.history.back();
</script>";
}

?>
