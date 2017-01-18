<?php
    require_once '../includes/constants.php';

    if(!isset($_SESSION[SESS_PRACTITIONER_ID]))
    {
        header('Location: m-login.php');
        //header('Location: http://localhost/kpo/escript/login-failed.php');
    }
    
?>
