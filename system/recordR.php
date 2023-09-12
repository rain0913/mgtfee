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
<style>
table, th, td {
  border: 1px solid black;
}

</style>

<script type="text/javascript">
function totalIt() {
  var input = document.getElementsByName("Amount[]");
  var total = 0;
  for (var i = 0; i < input.length; i++) {
    if (input[i].checked) {
      total += parseFloat(input[i].value);
    }
  }
  document.getElementsByName("total")[0].value = total.toFixed(0);
}
</script>

</head>
<body>
<p>
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

收據編號:
<?php
if (isset($_GET['edit'])){
$r = $_GET['edit'];
echo "$r";

  }
?>
</br>

單位編號:
<?php
if (isset($_GET['edit'])){
$r = $_GET['edit'];
$sql = "SELECT DISTINCT Unit FROM Total WHERE RCode = '$r'";
$result = $mysqli->query($sql);

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    print_r($row["Unit"]);
  }
  }

}
?>
<br>
<div class="row All">
<form name="listForm"
form action="/system/recordP.php?est=<?php echo "$code";?>&edit=<?php echo $_GET['edit'] ;?>" method="POST">
繳交記錄:</br>
<table class="table">
  <thead>
   <tr>
    <th>項目</th>
    <th>金額</th>


   </tr>
  </thead>
<?php

$result3 ='';

if (isset($_GET['edit'])){
$r = $_GET['edit'];

$results = $mysqli->query("SELECT SUM(Paid) AS value_sum FROM Total WHERE RCode = '$r'");
$sumrow = mysqli_fetch_assoc($results);
$sum = $sumrow['value_sum'];

$sqldate = "SELECT DISTINCT ReceivedDate FROM Total WHERE RCode = '$r'";
$rdate = $mysqli->query($sqldate);
$daterow = mysqli_fetch_assoc($rdate);
$date = $daterow['ReceivedDate'];

$sqlbcq = "SELECT DISTINCT BCQ FROM Total WHERE RCode = '$r'";
$rbcq = $mysqli->query($sqlbcq);
$bcqrow = mysqli_fetch_assoc($rbcq);
$bcq = $bcqrow['BCQ'];

$sqlmethod = "SELECT DISTINCT Method FROM Total WHERE RCode = '$r'";
$rmethod = $mysqli->query($sqlmethod);
$methodrow = mysqli_fetch_assoc($rmethod);
$method = $methodrow['Method'];

$sqlunit = "SELECT DISTINCT Unit FROM Total WHERE RCode = '$r'";
$runit = $mysqli->query($sqlunit);
$unitrow = mysqli_fetch_assoc($runit);
$unit = $unitrow['Unit'];

$sql3 = "SELECT * FROM Total WHERE RCode = '$r' ORDER BY ManageFeeDate";
$result3 = $mysqli->query($sql3);

   while ($row = $result3->fetch_array()) {
    echo  "<tr>";
    echo  "<td>".$row['ManageFeeDate']."</td>";
    echo  "<td>".$row['Amount']."</td>";

    ?>


      <?php echo "</tr>"; } ?>
</table>
<br>
<label for="Paid">支付:</label>
<input type="number" id="Paid" name="Paid" min="0" value="<?php echo "$sum";?>" readonly="readonly">
<br> 應付:
<input type="text" name="total" value="<?php echo "$sum";?>" readonly="readonly">
<br>
<label for="Remain">找續:</label>
<input type ="number" output name="x" value="0" for="total Paid"></output>
<br>
收款日期:<input type="date" name="ReceivedDate" required="required" value="<?php   echo $date ; ?>" max="9999-12-31">
 <br>
 <input type="radio" id="cash" name="method" value="cash" <?php if($method == "cash") { echo "checked"; } ?> required>
 <label for="cash">現金</label>
 <input type="radio" id="auto" name="method" value="auto" <?php if($method == "auto") { echo "checked"; } ?>
 <label for="auto">自動轉帳</label>
 <br>
 <input type="radio" id="cheque" name="method" value="cheque" <?php if($method == "cheque") { echo "checked"; } ?>
 <label for="cheque">支票</label>
 <br>
 銀行編號:<input type="number" name="bankcode"  style="width:40px" max="999" value="<?php echo substr($bcq,0,3); ?>">​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
 <br>
 支票編號:<input type="number" name="chequecode" style="width:70px" max="999999" value="<?php echo substr($bcq,3,6); ?>">​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
<p>
<input type="submit" name="submit" value="儲存"/>
<input type="button" class="button" value="返回" onclick="location.href='/system/record.php?est=<?php echo "$code";?>&search=<?php echo $unit ;?>'">
<?php } ?>
</form>
</div>
</body>
</html>
