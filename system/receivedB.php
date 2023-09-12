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
收款報表(銀行)
<br>
<form id="search-form" onsubmit="return performSearch()">
 <input type="hidden" name="est" value="<?php echo"$code";?>">
 日期由:
 <input type="date" name="start" value="<?php echo isset($_GET['start']) ? htmlspecialchars($_GET['start'], ENT_QUOTES) : ''; ?>" max="9999-12-31"><br>
 日期至:
 <input type="date" name="end" value="<?php echo isset($_GET['end']) ? htmlspecialchars($_GET['end'], ENT_QUOTES) : ''; ?>" max="9999-12-31">
 <input type="submit" value="尋找" />
 <input type="button" class="button" value="返回" onclick="location.href='/system/report.php?est=<?php echo"$code";?>'">
</form>
<form method="POST" action="receivedBE.php?est=<?php echo"$code";?>&start=<?php echo $_GET['start']?>&end=<?php echo $_GET['end']; ?>">
  <input type="submit" name="export" class="btn btn-success" value="Excel" />
</form>

<table class="table">
  <thead>
   <tr>
    <th>存入日期</th>
    <th>收款日期</th>
    <th>單位編號</th>
    <th>項目</th>
    <th>支付金額</th>
    <th>付款方法</th>
    <th>收據編號</th>
    <th>支票號碼</th>
   </tr>
  </thead>
<?php

$result ='';


if (isset($_GET['start'])){
$month1 = $_GET['start'];
{
if (isset($_GET['end'])){
$month2 = $_GET['end'];

$sql = "SELECT BankInDate, RCode, Unit, ReceivedDate, SUM(Paid), Method, BCQ, GROUP_CONCAT(ManageFeeDate) FROM Total WHERE DATE(BankInDate) BETWEEN '$month1' AND '$month2' GROUP BY BankInDate, RCode, Unit, ReceivedDate, Method, BCQ ORDER BY ReceivedDate, RCode";
$result = $mysqli->query($sql);

     while ($row = $result->fetch_assoc()): ?>
     <tr>
      <td><?php echo $row['BankInDate']; ?></td>
      <td><?php echo $row['ReceivedDate']; ?></td>
      <td><?php echo $row['Unit']; ?></td>
      <td style="width:170px"><?php echo $row['GROUP_CONCAT(ManageFeeDate)']; ?></td>
      <td><?php echo $row['SUM(Paid)']; ?></td>
      <td><?php echo $row['Method']; ?></td>
      <td><?php echo $row['RCode']; ?></td>
      <td><?php echo substr($row['BCQ'], 0, 3)."-".substr($row['BCQ'], 3, 6);?></td>
      </tr>
    <?php endwhile; }}} ?>
</table>
</body>
</html>
