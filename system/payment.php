<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: /login.php");
    exit;
    }

require_once('/var/www/html/system/permission_e.php');

if(isset($_POST['ReceivedDate'])){
  echo $_POST['ReceivedDate'];
}
?>
<!DOCTYPE html>
<html>
<title>Payment</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
   $('input:checkbox').prop('checked', false);
});
$(document).ready(function() {
  $('input[type=checkbox]').change(function() {
    if (this.checked) {
      $(this).closest('tr').find('input[type=hidden]').prop('disabled', false);
    } else {
      $(this).closest('tr').find('input[type=hidden]').prop('disabled', true);
    }
  });
});
</script>
<script type="text/javascript">
    function selectAll() {
        var items = document.getElementsByName('Amount[]');
        for (var i = 0; i < items.length; i++) {
            if (items[i].type == 'checkbox')
                items[i].checked = true;}
        var items = document.getElementsByName('DCode[]');
        for (var i = 0; i < items.length; i++) {
            if (items[i].type == 'hidden')
                items[i].disabled = false;
        }
    }

    function UnSelectAll() {
        var items = document.getElementsByName('Amount[]');
        for (var i = 0; i < items.length; i++) {
            if (items[i].type == 'checkbox')
                items[i].checked = false;}
        var items = document.getElementsByName('DCode[]');
        for (var i = 0; i < items.length; i++) {
            if (items[i].type == 'hidden')
                items[i].disabled = true;
        }
    }
</script>
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
<script>
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

<script type="text/javascript">
  document.getElementById('ReceivedDate').value = "<?php echo $_GET['ReceivedDate'];?>";
</script>

</script>

<style>

table, th, td {
  border: 1px solid black;
}

</style>
<meta charset="UTF-8">

</head>
<body>
<?php
$code = $_GET['est'];
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
  $mysqli = new mysqli('localhost', 'root', 'password', $code)
  or die (mysqli_error($mysqli));
  $mysqli->query("SET NAMES UTF8");
?>

<form unit method="GET">
 <input type="hidden" name="est" value="<?php echo"$code";?>">
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
 <input type="submit" value="尋找單位" />
  <a href ="/system/record.php?est=<?php echo "$code";?>&search=<?php echo $_GET['search']; ?>"><input type="button" value="繳款記錄" "></a>

<input type="button" class="button" value="返回" onclick="location.href='/system/mgtfee.php?est=<?php echo "$code";?>'">
</form unit>

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


<div class="row All">
<form name="listForm"
form oninput="x.value=parseInt(Paid.value)-parseInt(total.value)"
form action="/system/paymentP.php?est=<?php echo "$code";?>" method="POST">
欠款記錄:</br>
<table class="table">
  <thead>
   <tr>
    <th>項目</th>
    <th>金額</th>
    <th>支付</th>

   </tr>
  </thead>
<?php

$result3 ='';

if (isset($_GET['search'])){
$Unit = $_GET['search'];
$sql3 = "SELECT * FROM Total WHERE Unit = '$Unit' AND (Paid is null OR Paid<Amount) ORDER BY ManageFeeDate";
$result3 = $mysqli->query($sql3);

   while ($row = $result3->fetch_array()) {
    echo  "<tr>";
    echo  "<td>".$row['ManageFeeDate']."</td>";
    echo  "<td>".$row['Amount']."</td>";
    echo  "<td><input type ='hidden' name='DCode[]' value='".$row['DCode']."'disabled /><input type ='checkbox' name='Amount[]' value='".$row['Amount']."' onclick='totalIt()' /></td>";
    ?>

      <td><a href ="/system/divone.php?est=<?php echo "$code";?>&div=<?php echo $_GET['search']; ?>&m=<?php echo $row['ManageFeeDate']; ?>"> <input type="button" value="分割部分"></a></td>
      <td><a href ="/system/recordP.php?est=<?php echo "$code";?>&delete=<?php echo $_GET['search']; ?>&d=<?php echo $row['DCode']; ?>"> <input type="button" value="刪除"></a></td>
      </tr>
      <?php    echo "</tr>"; } ?>
</table>
<br>
<input type="button" onclick='selectAll();totalIt();' value="全付"/>
<input type="button" onclick='UnSelectAll();totalIt();' value="全不付"/>
<br>
<label for="Paid">支付:</label>
<input type="number" id="Paid" name="Paid" min="0" value="" placeholder="0">
<br> 應付:
<input type="text" name="total" value="0" readonly="readonly">
<br>
<label for="Remain">找續:</label>
<input type ="number" output name="x" for="total Paid"></output>
<br>
<?php
$sql_lastdate="SELECT Date FROM Receipt ORDER BY ID DESC LIMIT 1";

$result_lastdate = $mysqli->query($sql_lastdate);

if ($result_lastdate->num_rows > 0) {
  while($row = $result_lastdate->fetch_assoc()) {
    $lastdate = $row["Date"];
  }
}
?>
收款日期:<input type="date" id="ReceivedDate"name="ReceivedDate" required="required" value="<?php echo $lastdate; ?>" max="9999-12-31">


 <br>
 <input type="radio" id="cash" name="method" value="cash" required>
 <label for="cash">現金</label>
 <input type="radio" id="auto" name="method" value="auto">
 <label for="auto">自動轉帳</label>
 <br>
 <input type="radio" id="cheque" name="method" value="cheque">
 <label for="cheque">支票</label>
 <br>
 銀行編號:<input type="text" name="bankcode" style="width:40px" onkeypress="return isNumberKey(event)" maxlength="3">​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
 <br>
 支票編號:<input type="text" name="chequecode" style="width:70px" onkeypress="return isNumberKey(event)" maxlength="6">​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
 <br>
<input type="submit" name="submit" value="繳款"/>
<?php } ?>
</form>
</div>
<p>
<a href ="/system/AddOne.php?est=<?php echo "$code";?>&add=<?php echo $_GET['search']; ?>"> <input type="button" value="建立管理費單"></a>
      <a href ="/system/deposit.php?est=<?php echo "$code";?>&u=<?php echo $_GET['search']; ?>"> <input type="button" value="按金"></a>
<input type="button" class="button" value="一次性收款" >
</body>
</html>
