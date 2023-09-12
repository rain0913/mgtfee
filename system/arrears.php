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
<title>Arrears</title>
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

$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");
?>
<p>
欠款報表
<br>
<form id="search-form" onsubmit="return performSearch()">
 <input type="hidden" name="est" value="<?php echo"$code";?>">
 截至日期:
 <input type="date" name="end" max="9999-12-31">
 <input type="submit" class="test" value="尋找" />
 <input type="button" class="button" value="返回" onclick="location.href='/system/report.php?est=<?php echo"$code";?>'">
</form>
<form method="POST" action="arrearsE.php?est=<?php echo"$code";?>&end=<?php echo $_GET['end']; ?>">
 <input type="submit" name="export" class="btn btn-success" value="Excel" />
</form>
<table class="table">
  <thead>
   <tr>
    <th>單位編號</th>
    <th>項目</th>
    <th>金額</th>
   </tr>
  </thead>
<?php

$result ='';

if (isset($_GET['end'])){
$month = $_GET['end'];
$sql = "SELECT * FROM Total WHERE DATE(DemandDate) < '$month' AND (ReceivedDate > '$month' OR ReceivedDate IS NULL ) ORDER BY Unit, ManageFeeDate";
$result = $mysqli->query($sql);

     while ($row = $result->fetch_assoc()): ?>
     <tr>
      <td><?php echo $row['Unit']; ?></td>
      <td><?php echo $row['ManageFeeDate']; ?></td>
      <td><?php echo $row['Amount']; ?></td>
      </tr>
    <?php endwhile; } ?>
</table>
</body>
</html>
