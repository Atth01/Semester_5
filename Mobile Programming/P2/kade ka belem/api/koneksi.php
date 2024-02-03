<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: PUT, GET, DELETE, POST, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, Accept, x-requested-with');

// Membuat variabel, ubah sesuai dengan nama host dan database pada hosting 
$host = "localhost";
$user = "root";
$pass = "";
$db   = "db_kampus";
 
//Menggunakan objek mysqli untuk membuat koneksi dan menyimpan nya dalam variabel $mysqli 
try{
    $mysqli = new mysqli($host, $user, $pass, $db);
    $encodeData = file_get_contents('php://input');
    $decodeData = json_decode($encodeData, true);
} catch (PDOException $e){
    echo 'Error' . $e->getMessage() . '<br/>';
    die();
}
 
?>