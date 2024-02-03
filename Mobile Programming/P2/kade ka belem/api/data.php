<?php
require_once 'koneksi.php';

try{
    if(empty($_GET)){
        $query = mysqli_query($mysqli, "Select * from tbl_user");

        $result = array();
        while($row = mysqli_fetch_object($query)){
            $result[]=$row;
        };
    }else{
        $query = mysqli_query($mysqli, "Select * from tbl_user where id=". $_GET['id']."");

        $result = array();
        while($row = mysqli_fetch_object($query)){
            $result[]=$row;
        };
    }
} catch (Exception $e){
    $message = $e->getMessage();
}

echo json_encode($result);
?>