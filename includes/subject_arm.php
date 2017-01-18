<?php

//ob_start();
session_start();

require_once 'constants.php';
require_once 'config.php'; /* Database Settings */
require_once 'util.php';


/*  When a user click the login button */
$action = $_REQUEST['action']; //Calling program must pass action

if ($action == "checkSubjectName") {
    checkSubjectName($DB);
} else if ($action == "subjectmaster") {
    subjectmaster($DB);
} else if ($action == "subjectmasterupdate") {
    subjectmasterupdate($DB);
} else if ($action == "subjectmasterdelete") {
    subjectmasterdelete($DB);
} else if ($action == "checkCourseCategory") {
    checkCourseCategory($DB);
} else {
    throw new Exception("Unknown Action: " + $action);
}

function checkSubjectName($DB) {
    $subjectname = getRequestPostDefault('subjectname', 'null');
    $sql = "SELECT subjectName FROM wtfindin_arm.subjectmaster WHERE subjectName = ?";

    $query = $DB->prepare($sql);
    $query->bindValue(1, $subjectname);
    $query->execute();
    if ($query->rowCount() > 0) { # If rows are found for query
        echo 0;
    } else {
        echo 1;
    }
}
function checkCourseCategory($DB) {
    $courseid = getRequestPostDefault('courseid', 'null');
    $sql = "SELECT courseCategory FROM wtfindin_arm.course WHERE courseId = ?";

    $query = $DB->prepare($sql);
    $query->bindValue(1, $courseid);
    $query->execute();
    $rows = $query->fetch();
    if ($query->rowCount() > 0) { # If rows are found for query
        if($rows['courseCategory'] == 'c'){
            echo 1;
        }else if($rows['courseCategory'] == 't'){
            echo 2;
        }
    } else {
        echo 0;
    }
}

function subjectmaster($DB) {
    $subjectname = getRequestPostDefault('subjectname', 'null');

    try {
        $sql = "INSERT INTO wtfindin_arm.subjectmaster(subjectName) VALUES (?)";

        $query = $DB->prepare($sql);

        $query->bindValue(1, $subjectname);

        $query->execute();
        echo 0;
    } catch (Exception $ex) {
        echo "Error: " . $ex->getMessage();
    }
}

function subjectmasterdelete($DB) {
    $id = getRequestPostDefault('id', 'null');
    $subjectid = base64_decode($id);
    try {
        $sql = "DELETE FROM wtfindin_arm.subjectmaster WHERE subjectId = ?";

        $query = $DB->prepare($sql);
        $query->bindValue(1, $subjectid);
        $query->execute();
        echo 0;
    } catch (Exception $ex) {
        echo "Error: " . $ex->getMessage();
    }
}
function subjectmasterupdate($DB) {
    $id = getRequestPostDefault('subjectid', 'null');
    $name = getRequestPostDefault('subjectname', 'null');
    $subjectid = base64_decode($id);
    try {
        $sql = "UPDATE wtfindin_arm.subjectmaster SET subjectName = ? WHERE subjectId = ?";

        $query = $DB->prepare($sql);
        $query->bindValue(1, $name);
        $query->bindValue(2, $subjectid);
        $query->execute();
        echo 0;
    } catch (Exception $ex) {
        echo "Error: " . $ex->getMessage();
    }
}

?>