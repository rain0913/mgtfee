<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
    }

$mysqli = new mysqli('localhost', 'root', 'password', 'Estate')
or die (mysqli_error($mysqli));

$sql1 = "SELECT * FROM List WHERE ps = 1 ORDER BY code ";
$sql2 = "SELECT * FROM List WHERE ps = 2 ORDER BY code ";
$result1 = $mysqli->query($sql1);
$result2 = $mysqli->query($sql2);
?>

<!DOCTYPE html>
<html>
<title>管理費系統</title>
<head>
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
    <a href="main.php" class="btn btn-danger ml-3">主頁</a>
    <a href="management.php" class="btn btn-warning">屋邨管理</a>
    <a href="reset-password.php" class="btn btn-warning">更改密碼</a>
    <a href="logout.php" class="btn btn-danger ml-3">登出</a>
  </div>

<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Menu</span>
<div class="row">
<div class="column">
<table>
  <tr>
    <th>PS1</th>
  </tr>

<?php
    while ($row1 = $result1->fetch_array()) {
    echo  "<td> <a href ='/system/mgtfee.php?est=".$row1['code']."'><input type ='button' class='button1' value='".$row1['code']."' </a> </td>";
    echo "</tr>"; }
?>
</table>
</div>
<div class="column">
<table>
  <tr>
    <th>PS2</th>
  </tr>

<?php
     while ($row2 = $result2->fetch_array()) {
     echo  "<td> <a href ='/system/mgtfee.php?est=".$row2['code']."'><input type ='button' class='button2' value='".$row2['code']."' </a> </td>";
     echo "</tr>"; }

?>
</table>
</div>
</div>
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
