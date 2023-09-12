<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: /login.php");
    exit;
    }

require_once('/var/www/html/system/permission_e.php');

?>

<?php

session_start();

$code = $_GET['est'];

$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");

$update = false;
$Unit ='';
$Floor ='';
$Un = '';
$Amount='';
$ChineseName='';
$EnglishName='';

if (isset($_POST['save'])){
    $Unit = $_POST['Unit'];
    $Floor = $_POST['Floor'];
    $Un = $_POST['Un'];
    $Amount = $_POST['Amount'];
    $ChineseName = $_POST['ChineseName'];
    $EnglishName = $_POST['EnglishName'];
    $mysqli->query("INSERT INTO AllUnits(Unit, Floor, Un, Amount, ChineseName, EnglishName) VALUES('$Unit', '$Floor', '$Un', '$Amount', '$ChineseName', '$EnglishName')");

    header("location: /system/UnitInformation.php?est=$code");
}


if (isset($_GET['delete'])){
    $Unit = $_GET['delete'];
    $sql="SELECT * FROM Total WHERE Unit='$Unit' AND ReceivedDate IS NULL";
    $result = $mysqli->query($sql);
    if ($result->num_rows==0){

    $mysqli->query("DELETE FROM AllUnits WHERE Unit='$Unit'") ;

$_SESSION['message'] = "$Unit" . "資料己除刪";
header("location: /system/UnitInformation.php?est=$code");
} else {
echo "<script>
alert('尚有欠款未消');
  window.history.back();
</script>";
}}


if (isset($_GET['edit'])){
$ID = $_GET['edit'];
$update = true;
$sql = "SELECT * FROM AllUnits WHERE ID = '$ID'";
$result = $mysqli->query($sql);

 if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
  $Unit = $row['Unit'];
  $Floor= $row['Floor'];
  $Un = $row['Un'];
  $Amount = $row['Amount'];
  $ChineseName = $row['ChineseName'];
  $EnglishName = $row['EnglishName'];
  }
 }
}


if (isset($_POST['update'])){
$ID = $_POST['ID'];
$Unit = $_POST['Unit'];
$Floor = $_POST['Floor'];
$Un = $_POST['Un'];
$Amount = $_POST['Amount'];
$ChineseName = $_POST['ChineseName'];
$EnglishName = $_POST['EnglishName'];

$OUnit ="SELECT * FROM AllUnits WHERE ID = '$ID'";
$Oresult = $mysqli->query($OUnit);
while($row = $Oresult->fetch_assoc()) {
   $OOUnit = $row['Unit'];

$sql="SELECT * FROM Total WHERE Unit='$OOUnit' AND ReceivedDate IS NULL";
    $result = $mysqli->query($sql);
    if ($result->num_rows==0){

$mysqli->query("UPDATE AllUnits SET Unit='$Unit', Floor='$Floor', Un='$Un', Amount='$Amount', ChineseName='$ChineseName', EnglishName='$EnglishName' WHERE ID='$ID'");

header("location: /system/UnitInformation.php?est=$code");
} else {

$mysqli->query("UPDATE AllUnits SET Floor='$Floor', Un='$Un', Amount='$Amount', ChineseName='$ChineseName', EnglishName='$EnglishName' WHERE ID='$ID'");

header("location: /system/UnitInformation.php?est=$code");}}}
?>
