<?php
//ob_start();
session_start();

require_once 'constants.php';
require_once 'config.php'; /* Database Settings */
require_once 'util.php';


/*  When a user click the login button */
$action = $_REQUEST['action']; //Calling program must pass action

if ($action == "confirmLogin") {
    //confirmLogin($mysqli);
    confirmLogin($DB);
    
}else {
    throw new Exception("Unknown Action: " + $action);
}

function confirmLogin($DB) {
    $error = 'false';
    $erroremail = '';

    //$emailId= trim(stripslashes($_POST['email']));
    //$pass= trim(stripslashes($_POST['password']));

    $emailId = getRequestPostDefault('email', 'null');
    $pass = getRequestPostDefault('password', 'null');

    if (isValidIdPassword($emailId, $pass,$DB)) {
        echo 1;
       // redirect("home.php");
    } else {
        echo 'Invalid username or password.' . "<br/>" .
        'If you do not know the password, Contact us at customerservice@wtf.ind.in';
    }
}
function isValidIdPassword($loginId, $password,$DB) {

    if (!filter_var($loginId, FILTER_VALIDATE_EMAIL)) {
        return false;
    }

    
     $sql = "SELECT * FROM user WHERE loginId= :uname AND password = :upass ";

        try {
            $stmt = $DB->prepare($sql);
            // echo "in try1";
           
            // bind the values
            $stmt->bindValue(":uname", $loginId);
            $stmt->bindValue(":upass", $password);
            
            // execute Query
            $stmt->execute();
            //echo $loginId. $password;
            
            $results = $stmt->fetchAll();
           
            //echo count($results);
            if (count($results) > 0) {
                
                $_SESSION["errorType"] = "success";
                $_SESSION["errorMsg"] = "You have successfully logged in.";

                $_SESSION[SESS_LOGIN_ID] = $results[0]["userId"];
                $_SESSION[SESS_LOGIN_NAME] = $results[0]["firstName"]. ' ' .$results[0]["lastName"] ;
                $_SESSION[SESS_ROLE_ID] = $results[0]["roleid"];
                 $remote_addr = $_SERVER['REMOTE_ADDR'];
                // echo $_SESSION[SESS_LOGIN_NAME];
                 $sql = "INSERT 		INTO wtfindin_arm.userlogin 
							 (userId,remoteAddr)
					   VALUE (:lid,:r)";
                 
                 $stmt = $DB->prepare($sql);

            // bind the values
            $stmt->bindValue(":lid", $_SESSION[SESS_LOGIN_ID] );
            $stmt->bindValue(":r",  $remote_addr);

            // execute Query
            $stmt->execute();
            return true;
       
              } else {
               return false;
               
              }
        } catch (Exception $ex) {

            $_SESSION["errorType"] = "danger";
            $_SESSION["errorMsg"] = $ex->getMessage();
        }
    
   
   
    
    
}

?>