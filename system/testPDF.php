
<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: /login.php");
    exit;
    }




?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Simple Example of PDF file using PHP and MySQL</title>

</head>
<body>
<div class="container" style="padding-top:50px">
<h2>Generate PDF file from MySQL Using PHP</h2>
<form class="form-inline" method="post" action="testP.php">
<button type="submit" id="pdf" name="generate_pdf" class="btn btn-primary"><i class="fa fa-pdf"" aria-hidden="true"></i>
Generate PDF</button>
</form>
</fieldset>
</div>
</body>
</html>
