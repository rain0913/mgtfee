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
<title>Receipt</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.button1 {
  background-color: #663399;
  border: none;
  color: white;
  padding: 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  /*width:100px; */
  height:55px;
}
.button2 {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  width:130px;
  height:55px;
}

</style>
</head>
<body>
<?php
$code = $_GET['est'];
$conn_est = new mysqli('localhost', 'root', 'password', 'Estate')
or die (mysqli_error($conn_est));
$sql_est ="SELECT * FROM List Where code = '$code'";
$result_est = $conn_est->query($sql_est);

if ($result_est->num_rows > 0) {
  while($row_est = $result_est->fetch_assoc()) {
    echo $row_est["code"]. " " . $row_est["chname"];
    $button = $row_est["ps"];
  }
}
$conn_est -> close();
?>
<p>
<input type="button" class="button<?php echo "$button";?>" value="加入管理費" onclick="location.href='/system/demand.php?est=<?php echo $code; ?>'">
<input type="button" class="button<?php echo "$button";?>" value="列印管理費單">
<input type="button" class="button<?php echo "$button";?>" value="列印收款單據">
<input type="button" class="button<?php echo "$button";?>" value="返回主目錄" onclick="location.href='/system/mgtfee.php?est=<?php echo $code; ?>'">
</p>
<p>
</body>
</html>
