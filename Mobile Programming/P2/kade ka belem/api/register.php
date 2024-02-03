<?php
// include include-an
include 'koneksi.php';
include 'phpqrcode/qrlib.php';

// variabel jeng input input-an
$npm = $decodeData["npm"];
$nama =  $decodeData["nama"];
$prodi =  $decodeData["prodi"];
$email =  $decodeData["email"];
$telp =  $decodeData["telp"];
$username = $decodeData["username"];
$pass =  md5($decodeData["pass"]);
$message = '';
$error = false;

// jeng nga-test inputanna kosong hente?
if($npm == "" || $nama == "" || $prodi == "" || $email == "" || $telp == "" || $username == "" || $pass == "" ){
    $message = "You have to insert all form register";
} else {
    try{
        // validasi ges aya can akunna
        $sqlQuery = "Select * from tbl_user where npm='". $npm . "'";
        $check = $mysqli->query($sqlQuery);
        // ngecek mun aya muncul pesan, mun eweh ngasupken datana ka database 
        if($check->num_rows > 0){
            $message = "Account has been registered!";
        } else {
            // jeng QR Code iye teh nya
            $text = md5($npm);

            // iye jeng ka databasena
            $sqlQuery = "Insert into tbl_user values (null, ".$npm.", '".$prodi."', '".$nama."', '".$email."', '".$telp."', '".$username."', '".$pass."', null, '".$text."')";
            $check = $mysqli->query($sqlQuery);

            // jeng ngachek iyeteh bisa apa hente ka databasena
            if(!$check){
                $message = "Failed";
            } else {
                $message = "Success";
                // iye jeng nyimpen QR Code na diserver
                QRcode::png($text, 'qrcode/' . $text . '.png');
            }
            $mysqli->close();
        }
    } catch (Exception $e){
        $message = $e->getMessage();
        die();
    }
}

echo json_encode($message);
?>