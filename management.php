<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
    }

require_once('permission.php');

?>

<!DOCTYPE html>
<html>
<title>屋邨管理</title>
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

table, th, td {
  border: 1px solid black;
}
 </style>
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
<p>
<input type="submit" class="button" value="新增屋邨" onclick="location.href='estdetail.php'">
<?php
      $mysqli = new mysqli('localhost', 'root', 'password', 'Estate')
      or die (mysqli_error($mysqli));

      $sql1 = "SELECT * FROM List  ORDER BY status DESC, code ";
      $mysqli->query("SET NAMES UTF8");
      $result1 = $mysqli->query($sql1) or die ($mysqli->error);

?>
<table style="width:90%">
  <tr>
    <th>Ｃode</th>
    <th>屋邨名稱</th>
    <th>Estate Name</techo $_SESSION["username"];h>
    <th>PS</th>
    <th>合約狀態</th>
    <th>負責人</th>
    <th>可使用者</th>
    <th></th>
  </tr>
  <?php
      while ($row1 = $result1->fetch_array()) {
      echo  "<td>".$row1['code']."</td>";
      echo  "<td>".$row1['chname']."</td>";
      echo  "<td>".$row1['enname']."</td>";
      echo  "<td>".$row1['ps']."</td>";
      echo  "<td>".$row1['status']."</td>";
      echo  "<td>".$row1['puser']."</td>";
      echo  "<td>".$row1['nuser']."</td>";
      echo  "<td> <a href ='estdetail.php?edit=".$row1['id']."' ><input type ='button' class='button2' value='修改' </a> </td>";
      echo "</tr>"; }
  ?>

</table>


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
