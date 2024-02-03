<?php
 
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . "libraries/Format.php";
require APPPATH . "libraries/RestController.php";
 
use chriskacerguis\RestServer\RestController;

 
class Profileimage extends RestController{
    public function __construct(){
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: GET, OPTIONS");
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
            die();
        }

        parent::__construct();
    }

    function index_get() {
        $folderPath = './uploads/warga/';
        $requestedFile = isset($_GET['file']) ? $_GET['file'] : '';

        if (!empty($requestedFile) && file_exists($folderPath . $requestedFile)) {
                // Jika file ditemukan, atur header untuk tipe konten dan kirim file
                header('Content-Type: ' . mime_content_type($folderPath . $requestedFile));
                readfile($folderPath . $requestedFile);
            } else {
            $this->response([
                'status' => 'Not Found',
                'message' => 'Picture not found!'
            ], RestController::HTTP_OK);
            }
    }
}

?>