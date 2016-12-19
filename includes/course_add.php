<?php

//ob_start();
session_start();

require_once 'constants.php';
require_once 'config.php'; /* Database Settings */
require_once 'util.php';


/*  When a user click the login button */
$action = $_REQUEST['action']; //Calling program must pass action

if ($action == "checkCourseName") {
    //confirmLogin($mysqli);
    checkCourseName($DB);
} else if ($action == "courseAdd") {
    //confirmLogin($mysqli);
    courseAdd($DB);
} else {
    throw new Exception("Unknown Action: " + $action);
}

function checkCourseName($DB) {
    $coursename = getRequestPostDefault('coursename', 'null');
    $sql = "SELECT courseName FROM wtfindin_arm.course WHERE courseName = ?";

    $query = $DB->prepare($sql);
    $query->bindValue(1, $coursename);
    $query->execute();
    if ($query->rowCount() > 0) { # If rows are found for query
        echo 0;
    } else {
        echo 1;
    }
}

function courseAdd($DB) {
    $coursename = getRequestPostDefault('coursename', 'null');
    $coursecategory = getRequestPostDefault('coursecategory', 'null');
    $coursefee = getRequestPostDefault('coursefee', 'null');
    $courseduration = getRequestPostDefault('courseduration', 'null');

    if ($coursefee == '' && $courseduration == '') {
        $coursefee = '-';
        $courseduration = 1;
    }
    try {
        $sql = "INSERT INTO wtfindin_arm.course(courseName,courseCategory,fees,courseDuration) VALUES (?,?,?,?)";

        $query = $DB->prepare($sql);

        $query->bindValue(1, $coursename);
        $query->bindValue(2, $coursecategory);
        $query->bindValue(3, $coursefee);
        $query->bindValue(4, $courseduration);

        $query->execute();
        echo 0;
    } catch (Exception $ex) {
        echo "Error: " . $ex->getMessage();
    }
}

?>