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
<title>管理費系統</title>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Menu style -->
    <style>
    body {
    font-family: "Lato", sans-serif;
  }

  .sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
  }

  .sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
  }

  .sidenav a:hover {
    color: #f1f1f1;
  }

  .sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
  }

  #main {
    transition: margin-left .5s;
    padding: 16px;
  }

  @media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
  }



    * {
      box-sizing: border-box;
    }

    .row {
      display: flex;
      margin-left: 0px;
      margin-right: 0px;
    }

    .column {
      flex: 0%;
      padding: 0px;
    }

    table {
      border-collapse: collapse;
      border-spacing: 00;
      width: 100%;

    }

    th, td {
      text-align: center;
      padding: 10px;

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
      width:100px;
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
      width:100px;
      height:55px;
    }

</style>
</head>
<body>

  <div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="/main.php" class="btn btn-danger ml-3">主頁</a>
    <a href="#">Services</a>
    <a href="#">Clients</a>
    <a href="/management.php" class="btn btn-warning">屋邨管理</a>
    <a href="/reset-password.php" class="btn btn-warning">更改密碼</a>
    <a href="/logout.php" class="btn btn-danger ml-3">登出</a>
  </div>

<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Menu</span>

<p>
<?php
if (isset($_GET['est'])){
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
}
?>
<br>
未存入銀行
<br>
<?php
if (isset($_GET['est'])){
$code = $_GET['est'];

$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");
$sql = "SELECT IFNULL(( SELECT SUM(Paid) FROM Total WHERE Method='cash' AND BankInDate is NULL), 0)AS cash";
$cash = $mysqli->query($sql);
if ($cash->num_rows > 0) {
  while($row = $cash->fetch_assoc()) {
echo "現金:".$row['cash'] . "<br>";}
}

$sql2 = "SELECT IFNULL(( SELECT SUM(Paid) FROM Total WHERE Method='cheque' AND BankInDate is NULL), 0)AS cheque";
$cheque = $mysqli->query($sql2);
if ($cheque->num_rows > 0) {
  while($row = $cheque->fetch_assoc()) {
echo "支票:".$row['cheque'] . "<br>";}
}
$mysqli -> close();
}
?>
<p>
<?php
if (isset($_GET['est'])){
$code = $_GET['est'];
$conn_est = new mysqli('localhost', 'root', 'password', 'Estate')
or die (mysqli_error($conn_est));
$sql_est ="SELECT * FROM List Where code = '$code'";
$result_est = $conn_est->query($sql_est);

if ($result_est->num_rows > 0) {
  while($row_est = $result_est->fetch_assoc()) {
    $button = $row_est["ps"];
  }
}
}
?>
<input type="button" class="button<?php echo "$button";?>" value="繳款" onclick="location.href='/system/payment.php?est=<?php echo"$code"; ?>'">
<input type="button" class="button<?php echo "$button";?>" value="繳款記錄"  onclick="location.href='/system/record.php?est=<?php echo"$code"; ?>'">
<input type="button" class="button<?php echo "$button";?>" value="單位管理" onclick="location.href='/system/UnitInformation.php?est=<?php echo"$code"; ?>'">
</p>
<p>
<input type="button" class="button<?php echo "$button";?>" value="管理費單" onclick="location.href='/system/receipt.php?est=<?php echo"$code"; ?>'">
<input type="button" class="button<?php echo "$button";?>" value="報表" onclick ="location.href='/system/report.php?est=<?php echo"$code"; ?>'">
<input type="button" class="button<?php echo "$button";?>" value="存入銀行" onclick ="location.href='/system/bankin.php?est=<?php echo"$code"; ?>'">
</p>

</div>
<script>
  function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    }

  function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    }
</script>

</body>
</html>
