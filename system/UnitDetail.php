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
<title>Unit Information</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

table, th, td {
  border: 1px solid black;
}

br {
 display: block;
 margin-bottom: 2px;
 font-size:2px;
 line-height: 2px;
}
</style>
</head>
<body>
<?php require_once '/var/www/html/system/EditDelete.php';

$code = $_GET['est'];
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

?>
<p>
<?php
$code = $_GET['est'];
$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");


if (isset($_GET['edit'])){
$ID = $_GET['edit'];
$sql = "SELECT * FROM AllUnits WHERE ID = '$ID'";
$result = $mysqli->query($sql);


}
?>
</p>

<form action="/system/EditDelete.php?est=<?php echo "$code";?>" method="POST">
<input type="hidden" name="est" value="<?php echo $code; ?>">
<input type="hidden" name="ID" value="<?php echo $ID; ?>">
<table>
 <tr>
   <th>單位編號</th>
   <td><input type="text" name="Unit" value="<?php echo $Unit; ?>">(*必須填妥)</td>
 </tr>
 <tr>
   <th>層數</th>
   <td><input type="text" name="Floor" value="<?php echo $Floor; ?>"></td>
 </tr>
 <tr>
   <th>單位</th>
   <td><input type="text" name="Un" value="<?php echo $Un; ?>"></td>
 </tr>
 <tr>
   <th>管理費金額</th>
   <td><input type="number" name="Amount" value="<?php echo $Amount; ?>">(*必須填妥)</td>
 </tr>
 <tr>
   <th>往戶名稱(中文)</th>
   <td><input type="text" name="ChineseName" value="<?php echo $ChineseName; ?>"></td>
 </tr>
 <tr>
   <th>往戶名稱(英文)</th>
   <td><input type="text" name="EnglishName" value="<?php echo $EnglishName; ?>"></td>
 </tr>
</table>

</p>
<?php if ($update ==true):
?>
  <button type="submit" name="update">更改</button>
<?php else: ?>
  <button type="submit" name="save">儲存</button>
<?php endif; ?>
<input type="button" class="button" value="返回" onclick="location.href='/system/UnitInformation.php?est=<?php echo"$code";?>'">
</form>
</body>
</html>
