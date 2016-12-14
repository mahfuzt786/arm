
<?php

error_reporting( E_ALL & ~E_DEPRECATED & ~E_NOTICE );
//ob_start();
session_start();

define('DB_DRIVER', 'mysql');
define('DB_SERVER', 'localhost');
define('DB_SERVER_USERNAME', 'root');
define('DB_SERVER_PASSWORD', '');
define('DB_DATABASE', 'wtfindin_arm');


define('PROJECT_NAME', 'wtfindin_arm demo');
$dboptions = array(
              PDO::ATTR_PERSISTENT => FALSE, 
              PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, 
              PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
              PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
            );

try {
  $DB = new PDO(DB_DRIVER.':host='.DB_SERVER.';dbname='.DB_DATABASE, DB_SERVER_USERNAME, DB_SERVER_PASSWORD , $dboptions);  
   // set the PDO error mode to exception
  //  $DB->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   
  // echo ("success");
 
} catch (Exception $ex) {
   // echo("rupa");
  echo $ex->getMessage();
  die;
}

//require_once 'modulefunction.php';

//get error/success messages
if ($_SESSION["errorType"] != "" && $_SESSION["errorMsg"] != "" ) {
    $ERROR_TYPE = $_SESSION["errorType"];
    $ERROR_MSG = $_SESSION["errorMsg"];
    $_SESSION["errorType"] = "";
    $_SESSION["errorMsg"] = "";
}
?>