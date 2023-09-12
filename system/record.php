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
<title>Record</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table, th, td {
  border: 1px solid black;
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
  }
}
$conn_est -> close();

$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");
?>

<form id="search-form" onsubmit="return performSearch()">
<input type="hidden" name="est" value="<?php echo $code; ?>">
<?php
$sql = "SELECT * FROM AllUnits ORDER BY Unit";
$result = $mysqli->query($sql);
$search = "search";
$searchid = "searchid";
  echo "<input id=".$search." name=".$search." list=".$searchid." > <datalist id=".$searchid." >";
    while ($row = $result->fetch_assoc()){
  echo "<option value=".$row['Unit']."></option>";
}
echo "</datalist>";
?>
   <input type="submit" value="尋找單位"/>
   <a href ="/system/payment.php?est=<?php echo "$code";?>&search=<?php echo $_GET['search']; ?>">
   <input type="button" value="繳款"></a>
   <input type="button" class="button" value="返回" onclick="location.href='/system/mgtfee.php?est=<?php echo "$code";?>'">
</form>

單位編號:
<?php
if (isset($_GET['search'])){
$Unit = $_GET['search'];
$sql = "SELECT * FROM AllUnits WHERE Unit = '$Unit'";
$result = $mysqli->query($sql);

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    echo $row["Unit"];
  }
  }

}
?>
</br>
業主名稱:
<?php
if (isset($_GET['search'])){
$Unit = $_GET['search'];

$sql2 = "SELECT * FROM AllUnits WHERE Unit = '$Unit'";
$result2 = $mysqli->query($sql2);

if ($result2->num_rows > 0) {
  while($row = $result2->fetch_assoc()) {
    echo $row["ChineseName"];
  }
  }
  }
?>
</br>

付款記錄:</br>
<table class="table">
  <thead>
   <tr>
    <th>收款日期</th>
    <th>單位編號</th>
    <th>項目</th>
    <th>支付金額</th>
    <th>付款方法</th>
    <th>收據編號</th>
   </tr>
  </thead>
<?php

$result3 ='';

if (empty($_GET['search'])){

$sql3 = "SELECT * FROM Total WHERE Paid IS NOT NULL ORDER BY ReceivedDate DESC, RCode DESC";
$result3 = $mysqli->query($sql3);

     while ($row = $result3->fetch_assoc()): ?>
     <tr>
      <td><?php echo $row['ReceivedDate']; ?></td>
      <td><?php echo $row['Unit']; ?></td>
      <td><?php echo $row['ManageFeeDate']; ?></td>
      <td><?php echo $row['Paid']; ?></td>
      <td><?php echo $row['Method']; ?></td>
      <td><?php echo $row['RCode']; ?></td>
      <td><a href ="/system/recordR.php?est=<?php echo "$code";?>&edit=<?php echo $row['RCode']; ?>"> <input type="button" value="修改"></a></td>
      <td><a href ="/system/recordP.php?est=<?php echo "$code";?>&del=<?php echo $_GET['search']; ?>&r=<?php echo $row['RCode']; ?>"> <input type="button" value="刪除"></a></td>
      </tr>
    <?php endwhile;
} else {


if (isset($_GET['search'])){
$Unit = $_GET['search'];
$sql3 = "SELECT * FROM Total WHERE Unit = '$Unit' AND Paid IS NOT NULL ORDER BY ReceivedDate DESC, RCode DESC";
$result3 = $mysqli->query($sql3);

     while ($row = $result3->fetch_assoc()): ?>
     <tr>
      <td><?php echo $row['ReceivedDate']; ?></td>
      <td><?php echo $row['Unit']; ?></td>
      <td><?php echo $row['ManageFeeDate']; ?></td>
      <td><?php echo $row['Paid']; ?></td>
      <td><?php echo $row['Method']; ?></td>
      <td><?php echo $row['RCode']; ?></td>
      <td><a href ="/system/recordR.php?est=<?php echo "$code";?>&edit=<?php echo $row['RCode']; ?>"> <input type="button" value="修改"></a></td>
      <td><a href ="/system/recordP.php?est=<?php echo "$code";?>&del=<?php echo $_GET['search']; ?>&r=<?php echo $row['RCode']; ?>"> <input type="button" value="刪除"></a></td>
      </tr>
    <?php endwhile; }} ?>
</table>
<br>
刪除記錄:</br>
<table class="table">
  <thead>
   <tr>
    <th>修改者</th>
    <th>刪除時間</th>
    <th>收款日期</th>
    <th>單位編號</th>
    <th>項目</th>
    <th>支付金額</th>
    <th>付款方法</th>
    <th>收據編號</th>
   </tr>
  </thead>
<?php
if (empty($_GET['search'])){

$sql4 = "SELECT * FROM Cancel ORDER BY Delete_at DESC, RCode DESC";
$result4 = $mysqli->query($sql4);

     while ($row = $result4->fetch_assoc()): ?>
     <tr>
      <td><?php echo $row['Editor']; ?></td>
      <td><?php echo $row['Delete_at']; ?></td>
      <td><?php echo $row['ReceivedDate']; ?></td>
      <td><?php echo $row['Unit']; ?></td>
      <td><?php echo $row['ManageFeeDate']; ?></td>
      <td><?php echo $row['Paid']; ?></td>
      <td><?php echo $row['Method']; ?></td>
      <td><?php echo $row['RCode']; ?></td>
      </tr>
    <?php endwhile;
} else {

if (isset($_GET['search'])){
$Unit = $_GET['search'];
$sql3 = "SELECT * FROM Cancel WHERE Unit = '$Unit' ORDER BY Delete_at DESC, RCode DESC";
$result3 = $mysqli->query($sql3);

     while ($row = $result3->fetch_assoc()): ?>
     <tr>
      <td><?php echo $row['Editor']; ?></td>
      <td><?php echo $row['Delete_at']; ?></td>
      <td><?php echo $row['ReceivedDate']; ?></td>
      <td><?php echo $row['Unit']; ?></td>
      <td><?php echo $row['ManageFeeDate']; ?></td>
      <td><?php echo $row['Paid']; ?></td>
      <td><?php echo $row['Method']; ?></td>
      <td><?php echo $row['RCode']; ?></td>
          <?php endwhile; }}
?>
</table>
<input type="button" class="button" value="返回" onclick="location.href='/system/mgtfee.php?est=<?php echo "$code";?>'">

</body>
</html>
