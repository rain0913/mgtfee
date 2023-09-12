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
    }
  }
  $conn_est -> close();

  ?>
<p>
<input type="submit" class="button" value="新增" onclick="location.href='/system/UnitDetail.php?est=<?php echo"$code";?>'">
<input type="submit" class="button" value="更改所有管理費" onclick="location.href='/system/editfee.php?est=<?php echo"$code";?>'">
<input type="submit" class="button" value="列印">
<input type="button" class="button" value="返回" onclick="location.href='/system/mgtfee.php?est=<?php echo"$code";?>'">
</p>
<?php require_once '/var/www/html/system/EditDelete.php'; ?>

<?php
if (isset($_SESSION['message'])): ?>
<?php
echo $_SESSION['message'];
unset($_SESSION['message']);
?>
<?php endif ?>

<?php
$code = $_GET['est'];
$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");
$result = $mysqli->query("SELECT * FROM AllUnits ORDER BY Unit") or die ($mysqli->error);
?>


<div class="row All">
 <table class="table">
  <thead>
   <tr>
    <th>單位編號</th>
    <th>層數</th>
    <th>單位</th>
    <th>管理費金額</th>
    <th>業主名稱(中文)</th>
    <th>業主名稱(英文)</th>
    <th clospan"2"></th>
   </tr>
  </thead>
  <?php
   while ($row = $result->fetch_assoc()): ?>
     <tr>
      <td><?php echo $row['Unit']; ?></td>
      <td><?php echo $row['Floor']; ?></td>
      <td><?php echo $row['Un']; ?></td>
      <td><?php echo $row['Amount']; ?></td>
      <td><?php echo $row['ChineseName']; ?></td>
      <td><?php echo $row['EnglishName']; ?></td>
      <td>
       <a href ="/system/UnitDetail.php?est=<?php echo"$code";?>&edit=<?php echo $row['ID']; ?>"> <input type="button" value="修改"></a>
       <a href ="/system/EditDelete.php?est=<?php echo"$code";?>&delete=<?php echo $row['Unit']; ?>"> <input type="button" value="刪除"></a>
      </td>
      </tr>
    <?php endwhile; ?>
 </table>
</div>

</body>
</html>
