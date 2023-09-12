<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: /login.php");
    exit;
    }

require_once('/var/www/html/system/permission_e.php');

?>

<!DOCTYPE html>
<html>
<title>AddOne</title>
<head>
</head>
<body>
<?php
$code = $_GET['est'];
if (isset($_GET['est'])){
$conn_est = new mysqli('localhost', 'root', 'password', 'Estate')
or die (mysqli_error($conn_est));
$sql_est ="SELECT * FROM List Where code = '$code'";
$result_est = $conn_est->query($sql_est);

if ($result_est->num_rows > 0) {
  while($row_est = $result_est->fetch_assoc()) {
    echo $row_est["code"]. " " . $row_est["chname"];
  }
}
$conn_est -> close();
}

$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");
?>
<br>
單位編號:
<?php
if (isset($_GET['add'])){
$Unit = $_GET['add'];
$sql = "SELECT * FROM AllUnits WHERE Unit = '$Unit'";
$result = $mysqli->query($sql);

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    echo $row["Unit"];
  }
  }
}
?>
<form action="/system/insertone.php?est=<?php echo "$code";?>&add=<?php echo $_GET['add']?>" method="POST">
    <p>
        <label for="month">年份/月份:</label>
        <input type="month" name="month">
    </p>


<input type="submit" class="button" value="加入">
<input type="button" class="button" value="取消" onclick="history.back()">
</form>

</body>
</html>
