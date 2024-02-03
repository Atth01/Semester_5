<?php
// include include-an
include 'koneksi.php';

// input input-an
$username = $decodeData["username"];
$pass =  md5($decodeData["pass"]);
$message = '';
$error = false;
$array = array();

// nyobaan get datana
try{
    $sqlQuery = "Select * from tbl_user where username='". $username . "' and password='". $pass ."'";
    $check = $mysqli->query($sqlQuery);

    // mun eweh berarti salah akunna, mun bener datana dikirim json
    if($check->num_rows > 0){
        $array = $check->fetch_assoc();
        if($pass != $array['password']){
            $message = "You insert wrong password";
            $error = true;
            $array = null;
        }
    } else {
        $message = "No account yet";
        $error = true;
        $array = null;
    }
} catch (Exception $e){
    $message = $e->getMessage();
}

$result = [
    'message' => $message, 
    'result' => $array, 
    'error' => $error
];
echo json_encode($result);
?>