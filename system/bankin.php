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
<title>Payment</title>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script data-require="jquery@2.0.3" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
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
<script type="text/javascript">
    function selectAll() {
        var items = document.getElementsByName('Amount[]');
        for (var i = 0; i < items.length; i++) {
            if (items[i].type == 'checkbox')
                items[i].checked = true;}
        var items = document.getElementsByName('RCode[]');
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
        var items = document.getElementsByName('RCode[]');
        for (var i = 0; i < items.length; i++) {
            if (items[i].type == 'hidden')
                items[i].disabled = true;
        }
    }

    $(document).ready(function(){

        $(".grid thead td").click(function(){
          showFilterOption(this);
        });

    });

    var arrayMap = {};

    function showFilterOption(tdObject){
      var filterGrid = $(tdObject).find(".filter");

      if (filterGrid.is(":visible")){
        filterGrid.hide();
        return;
      }

      $(".filter").hide();

      var index = 0;
      filterGrid.empty();
      var allSelected = true;
      filterGrid.append('<div><input id="all" type="checkbox" checked>Select All</div>');

      var $rows = $(tdObject).parents("table").find("tbody tr");


      $rows.each(function(ind, ele){
        var currentTd = $(ele).children()[$(tdObject).attr("index")];
        var div = document.createElement("div");
        div.classList.add("grid-item")
        var str = $(ele).is(":visible") ? 'checked' : '';
        if ($(ele).is(":hidden")){
          allSelected = false;
        }
        div.innerHTML = '<input type="checkbox" '+str+' >'+currentTd.innerHTML;
        filterGrid.append(div);
        arrayMap[index] = ele;
        index++;
      });

      if (!allSelected){
        filterGrid.find("#all").removeAttr("checked");
      }

      filterGrid.append('<div><input id="close" type="button" value="Close"/><input id="ok" type="button" value="Ok"/></div>');
      filterGrid.show();

      var $closeBtn = filterGrid.find("#close");
      var $okBtn = filterGrid.find("#ok");
      var $checkElems = filterGrid.find("input[type='checkbox']");
      var $gridItems = filterGrid.find(".grid-item");
      var $all = filterGrid.find("#all");

      $closeBtn.click(function(){
        filterGrid.hide();
        return false;
      });

      $okBtn.click(function(){
        filterGrid.find(".grid-item").each(function(ind,ele){
          if ($(ele).find("input").is(":checked")){
            $(arrayMap[ind]).show();
          }else{
            $(arrayMap[ind]).hide();
          }
        });
        filterGrid.hide();
        return false;
      });

      $checkElems.click(function(event){
        event.stopPropagation();
      });

      $gridItems.click(function(event){
        var chk = $(this).find("input[type='checkbox']");
        $(chk).prop("checked",!$(chk).is(":checked"));
      });

      $all.change(function(){
        var chked = $(this).is(":checked");
        filterGrid.find(".grid-item [type='checkbox']").prop("checked",chked);
      })

      filterGrid.click(function(event){
        event.stopPropagation();
      });

      return filterGrid;
    }
</script>
<style>

table thead tr td{
  background-color : gray;
  min-width : 100px;
  position: relative;
}

.filter{
  position:absolute;
  border: solid 1px;
  top : 20px;
  background-color : white;
  width:100px;
  right:0;
  display:none;
}

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
未存入銀行
<br>
<?php
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
?>
<br>
<form action="/system/bankinP.php?est=<?php echo "$code";?>" method="POST">
金額:<input type="text" name="total" value="0" readonly="readonly" style="width:70px">
日期:<input type="date" name="BankInDate" required="required" value="<?php echo date("Y-m-d"); ?>">
<input type="submit" name="submit" value="存入" >
<input type="button" class="button" value="返回" onclick="location.href='/system/mgtfee.php?est=<?php echo "$code";?>'">
<br>
<input type="button" onclick='selectAll();totalIt()' value="全選"/>
<input type="button" onclick='UnSelectAll();totalIt()' value="不全選"/>
<table class="grid">
  <thead>
   <tr>
    <th>收款日期</th>
     <div class="filter"></div>
    <th>單位編號</th>
     <div class="filter"></div>
    <th>項目</th>
     <div class="filter"></div>
    <th>支付金額</th>
     <div class="filter"></div>
    <th>付款方法</th>
     <div class="filter"></div>
    <th>收據編號</th>
     <div class="filter"></div>
    <th>存入</th>
     <div class="filter"></div>
   </tr>
  </thead>
<?php

$result3 ='';

$sql3 = "SELECT RCode, Unit, ReceivedDate, SUM(Paid), Method, GROUP_CONCAT(ManageFeeDate) FROM Total WHERE Paid IS NOT NULL AND BankInDate IS NULL GROUP BY RCode, Unit, ReceivedDate, Method ORDER BY ReceivedDate DESC, RCode DESC";
$result3 = $mysqli->query($sql3);

     while ($row = $result3->fetch_assoc()): ?>
     <tr>
      <td><?php echo $row['ReceivedDate']; ?></td>
      <td><?php echo $row['Unit']; ?></td>
      <td style="width:170px"><?php echo $row['GROUP_CONCAT(ManageFeeDate)']; ?></td>
      <td><?php echo $row['SUM(Paid)']; ?></td>
      <td><?php echo $row['Method']; ?></td>
      <td><?php echo $row['RCode']; ?></td>
      <td><input type ="hidden" name="RCode[]" value="<?php echo $row['RCode']; ?>" disabled /><input type ="checkbox" name="Amount[]" value="<?php echo $row['SUM(Paid)']; ?>" onclick="totalIt()" /></td>
      </tr>
     <?php endwhile;
?>
</table>
</form>
</body>
</html>
