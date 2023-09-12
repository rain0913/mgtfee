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
<title>Report</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.button {
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
  width:130px;
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
<input type="button" class="button<?php echo "$button";?>" value="欠款報表"  onclick="location.href='/system/arrears.php?est=<?php echo"$code";?>'">
<input type="button" class="button<?php echo "$button";?>" value="收款報表"  onclick="location.href='/system/received.php?est=<?php echo"$code";?>'">
<input type="button" class="button<?php echo "$button";?>" value="預繳報表"  onclick="location.href='/system/advance.php?est=<?php echo"$code";?>'">
<br>
<input type="button" class="button<?php echo "$button";?>" value="欠款報表(銀行)"  onclick="location.href='/system/arrearsB.php?est=<?php echo"$code";?>'">
<input type="button" class="button<?php echo "$button";?>" value="收款報表(銀行)"  onclick="location.href='/system/receivedB.php?est=<?php echo"$code";?>'">
<input type="button" class="button<?php echo "$button";?>" value="預繳報表(銀行)"  onclick="location.href='/system/advanceB.php?est=<?php echo"$code";?>'">
<br>
<INPUT TYPE="button" class="button<?php echo "$button";?>" VALUE="返回上頁" onClick="location.href='/system/mgtfee.php?est=<?php echo"$code";?>'">

<body>
</body>
</html>
