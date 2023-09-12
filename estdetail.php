<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
    }

?>

<!DOCTYPE html>
<html>
<title>Estate Detail</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

table, th, td {
  border: 1px solid black;

</style>
</head>
<body>
<?php require_once 'estdetailP.php'; ?>
<?php
$mysqli = new mysqli('localhost', 'root', 'password', 'Estate')
or die (mysqli_error($mysqli));
$mysqli->query("SET NAMES UTF8");


if (isset($_GET['edit'])){
$id = $_GET['edit'];
$sql = "SELECT * FROM List WHERE id = '$id'";
$result = $mysqli->query($sql);
}

?>
<form action="estdetailP.php" method="POST">
<input type="hidden" name="id" value="<?php echo $id; ?>">

<table>
 <tr>
   <th>Ｃode</th>
   <td><input type="text" name="code" value="<?php echo $code; ?>"></td>
 </tr>
 <tr>
   <th>屋邨名稱</th>
   <td><input type="text" name="chname" value="<?php echo $chname; ?>"></td>
 </tr>
 <tr>
   <th>Estate Name</th>
   <td><input type="text" name="enname" value="<?php echo $enname; ?>"></td>
 </tr>
 <tr>
   <th>PS</th>
   <td>
   <select name="ps">
   <option value="1" <?php if($ps=="1") echo 'selected="selected"'; ?> >1</option>
   <option value="2" <?php if($ps=="2") echo 'selected="selected"'; ?> >2</option>
   </td>
 </tr>
 <tr>
   <th>合約狀態:</th>
   <td>
   <select name="status">
   <option value="Under" <?php if($status=="Under") echo 'selected="selected"'; ?> >Under</option>
   <option value="End" <?php if($status=="End") echo 'selected="selected"'; ?> >End</option>
   </select>

   </td>
 </tr>
 <tr>
   <th>負責人</th>
   <td><input type="text" name="puser" value="<?php echo $puser; ?>"></td>
 </tr>
 <tr>
   <th>可使用者</th>
   <td><input type="text" name="nuser" value="<?php echo $nuser; ?>"></td>
 </tr>

</table>

<?php if ($update ==true):
?>
  <button type="submit" name="update">更改</button>
<?php else: ?>
  <button type="submit" name="save">儲存</button>
<?php endif; ?>
<input type="button" class="button" value="返回" onclick="location.href='management.php'">
</form>
</body>
</html>
