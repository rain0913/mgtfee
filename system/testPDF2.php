<?php

session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: /login.php");
    exit;
    }



$conn_est = new mysqli('localhost', 'root', 'password', 'Estate')
or die (mysqli_error($conn_est));
$conn_est->query("SET NAMES UTF8");
$str = utf8_decode($str);

require_once __DIR__ . '/vendor/autoload.php';

require('/var/www/html/system/fpdf183/fpdf.php');
// require('/var/www/html/system/tfpdf/tfpdf.php');

class PDF extends FPDF
{
// Page header
function Header()
{
    // Logo

    $this->SetFont('Arial','B',13);
    // Move to the right
    $this->Cell(80);
    // Title
    $this->Cell(80,10,'Estate List',1,0,'C');
    // Line break
    $this->Ln(20);
}

// Page footer
function Footer()
{
    // Position at 1.5 cm from bottom
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Page number
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}
}

//$db = new dbObj();
//$connString = getConnstring();
$display_heading = array('id'=>'ID', 'code'=> 'Code', 'chname'=> '中文','enname'=> 'Estate Name',);

$result = mysqli_query($conn_est, "SELECT id, code, chname, enname FROM List") or die("database error:". mysqli_error($conn_est));
$header = mysqli_query($conn_est, "SHOW columns FROM List");

$pdf = new \Mpdf\Mpdf();
// $pdf = new PDF();
//header
$pdf->AddPage();
//foter page
$pdf->AliasNbPages();
$pdf->SetFont('Arial','B',12);
foreach($header as $heading) {
$pdf->Cell(40,12,$display_heading[$heading['Field']],1);
}
foreach($result as $row) {
$pdf->Write(8,$row);
$pdf->Ln();
foreach($row as $column)
$pdf->Cell(40,12,$column,1);

}
$pdf->Output();
?>
