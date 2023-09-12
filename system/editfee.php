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
  <script type="text/javascript">
      function change() {
        for (var i = 0; i < document.getElementsByName('oldfee[]').length; i++)
        if (document.getElementsByName('oldfee[]')[i].value == document.getElementsByName('o')[0].value ) {
            document.getElementsByName('newfee[]')[i].value = document.getElementsByName('n')[0].value;}
          }
          </script>

<style>

table, th, td {
  border: 1px solid black;
}

input[type='number']{
    width: 80px;
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

<?php
$mysqli = new mysqli('localhost', 'root', 'password', $code)
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");
$result = $mysqli->query("SELECT * FROM AllUnits ORDER BY Unit") or die ($mysqli->error);
?>
<div class="row All">
 <form action="editfeeP.php?est=<?php echo "$code";?>" method="POST">
 <table class="table">
  <thead>
   <tr>
    <th>單位編號</th>
    <th>原管理費</th>
    <th>新管理費</th>
    </tr>
  </thead>
  <?php
   while ($row = $result->fetch_array()) {
    echo  "<tr>";
    echo  "<td><input type ='hidden' name='unit[]' value='".$row['Unit']."'/>".$row['Unit']."</td>";
    echo  "<td><input type ='hidden' name='oldfee[]' value='".$row['Amount']."'/>".$row['Amount']."</td>";
    echo  "<td><input type ='number' name='newfee[]' value='".$row['Amount']."' style='width:60px'/></td>";
    echo "</tr>"; } ?>

 </table>
 <br>
    原管理費:<input type ="number" name="o", value="" > =>
    新管理費:<input type ="number" name="n", value="" >
    <input id="button" type="button" value="轉換" onclick="change()">
<br>

    <?php
    if (isset($_GET['change'])){
    $value1=$_POST['o'];
    $value2=$_POST['n'];
    'newfee[]'->$value2;
    }

    ?>
    <br>
    <input type='submit' name='submit' value='確定'>
    <input type='button' name='button' value='返回' onclick="location.href='/system/UnitInformation.php?est=<?php echo "$code";?>'">
    </form>

</div>
</body>
</html>
