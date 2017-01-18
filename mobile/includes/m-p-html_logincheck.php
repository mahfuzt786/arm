<?php
       
    if (session_status() !== PHP_SESSION_ACTIVE)
    {
        session_start();
    }

    if(!isset($_SESSION[SESS_PRACTITIONER_ID]))
    {
        /**
        *  Guess user, initialize params
        **/
       $_SESSION[SESS_USER_TYPE]        = 'Guest';
       $_SESSION[SESS_ACCESS_LEVEL]     = 3;
    }
    
?>
