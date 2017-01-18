
<?php
include 'includes/checkInvalidUser.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <title >Phoenix : Subject</title>
        <?php
        require_once 'includes/include.php';
        $cat = base64_decode($_GET['c']);
        $name = base64_decode($_GET['n']);
        ?>
        <link href="css/profile.css" rel="stylesheet"/>
        <link href="css/subject.css?v=56" rel="stylesheet"/>
        <link href="css/course-add.css" rel="stylesheet"/>
        <script src="js/subject.js?v=43"></script>
    </head>
    <body>

        <?php require_once('includes/navbar.php'); ?>
        <div class="col-lg-12 container-fluid">
            <div class="row-fluid dashboard">
                <div class="col-md-4  items">
                    <?php include 'includes/menu.php'; ?>
                </div>


                <div class="col-md-8  items">

                    <div class="panel panel-default subject-content">
                        <div class="panel-heading">
                            <i class="fa fa-book"></i> Add Subject 
                            <a href="home.php" style="float: right;"><i class="fa fa-arrow-left"></i> Back</a>
                        </div>
                        <div class="panel-body">


                            <div class="col-md-12">
                                <form id="subject-form">
                                    <div class="inputRow">
                                        <div class="f-h col-md-3 course">Course Name : <b class="r">*</b></div>
                                        <div class="col-md-9" style="padding-bottom: 10px;">

                                            <?php
                                            if ((isset($_GET['c']) && isset($_GET['n'])) || (!empty($_GET['c']) && !empty($_GET['n']))) {
                                                echo '<input type="hidden" id="cate" value="' . $cat . '"/>';
                                                echo "<label style='font-weight : bold; padding : 3px;'>";
                                                echo strtoupper($name);
                                                echo "</label>";
                                            } else {

                                                echo "<select class=\"form-control course\" name=\"course_name\" id=\"course_name\">";
                                                echo "<option value=\"select\">Select Course Name</option>";

                                                $sql = "SELECT courseId,courseName FROM wtfindin_arm.course ORDER BY courseId DESC";
                                                $stmt = $DB->prepare($sql);
                                                $stmt->execute();
                                                $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                                foreach ($results as $rows) {
                                                    if ($name == $rows['courseName']) {
                                                        echo '<option selected="selected" value="' . $rows['courseId'] . ' selected = "' . $selected . '"">' . $rows['courseName'] . '</option>';
                                                    } else {
                                                        echo '<option value="' . $rows['courseId'] . '">' . $rows['courseName'] . '</option>';
                                                    }
                                                }
                                                echo "</select>";
                                            }
                                            ?>
                                        </div>
                                    </div>

                                    <div class="inputRow">
                                        <div class="f-h col-md-3">Subject Name : <b class="r">*</b></div>

                                        <div class="col-md-9">
                                            <div class="col-lg-6" style="padding-left: 0;padding-bottom: 10px;">
                                                <select class="form-control subject-combo" name="subject_name" id="subject_name"> 
                                                    <option value="select">Select Subject Name</option>
                                                    <?php
                                                    $sql_subject = "SELECT subjectId,subjectName FROM wtfindin_arm.subjectmaster ORDER BY subjectId DESC";
                                                    $stmt_subject = $DB->prepare($sql_subject);
                                                    $stmt_subject->execute();
                                                    $results_subject = $stmt_subject->fetchAll(PDO::FETCH_ASSOC);
                                                    foreach ($results_subject as $rows_subject) {
                                                        //if ($name == $rows['courseName']) {
                                                        //    echo '<option selected="selected" value="' . $rows['courseId'] . ' selected = "' . $selected . '"">' . $rows['courseName'] . '</option>';
                                                        //} else {
                                                        echo '<option value="' . $rows_subject['subjectId'] . '">' . $rows_subject['subjectName'] . '</option>';
                                                        //}
                                                    }
                                                    ?>
                                                </select>

                                                <div class="subjectNameTextbox" id="addSubject">
                                                    <div class="input-group">
                                                        <input type="hidden" id="subject_id"/>
                                                        <input class="form-control" placeholder="Subject" type="text" id="subject-textbox" name='subject-textbox'/>
                                                        <span id="remove-textbox" class="input-group-addon remove-textbox">
                                                            <i class="glyphicon glyphicon-remove"></i>
                                                        </span>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="col-lg-6">
                                                <div class="control1 gap" id="control1">
                                                    <span class="add-icon" id="add-icon"><i class="fa fa-1x fa-plus"></i> Add</span>
                                                    <span class="edit-icon" id="edit-icon"><i class="fa fa-1x fa-wrench"></i> Edit</span>
                                                </div>
                                                <div class="control2" id="control2">
                                                    <button style="width: 100px;" type="button" class="btn btn-primary" name="btn-subject-name-update" id="btn-subject-name-update">
                                                        <span class="fa fa-pencil"></span> Update</button> 
                                                    <button style="width: 100px;" type="button" class="btn btn-primary" name="btn-subject-name-delete" id="btn-subject-name-delete">
                                                        <span class="fa fa-trash"></span> Delete</button> 
                                                </div>
                                                <div class="control3" id="control3">
                                                    <button style="width: 100px;" type="button" class="btn btn-primary" name="btn-subject-name-add" id="btn-subject-name-add">
                                                        <span class="fa fa-plus"></span> Add</button> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="inputRow" style="display: <?php
                                    if ($cat == 'c' || $cat == null) {
                                        echo 'none';
                                    }
                                    ?>" id="fee-structure">
                                        <div class="f-h col-md-3 course">Fees : <b class="r">*</b></div>
                                        <div class="col-md-9">
                                            <input class="form-control course" style="width: 245px;" maxlength="6" type="text" id="subject_fee" name='subject_fee' placeholder="Rupees" value=""/>          
                                        </div>
                                    </div>


                                    <div class="inputRow">
                                        <div class="f-h col-md-3"></div>
                                        <div style="padding-top: 10px;" class="inputRow col-lg-9">
                                            <button style="width: 100px;" type="button" class="btn btn-primary course" name="btn-course-add" id="btn-course-add">
                                                <span class="fa fa-plus"></span> Add</button> 

                                            <button style="width: 100px;" type="button" class="btn btn-primary course" name="btn-course-clear" id="btn-course-clear">
                                                <span class="fa fa-refresh"></span> Clear</button> 
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div id="subject" class="subject_form col-lg-12">
                                <div id="subject-table" >
                                    <?php
                                    if (isset($_GET['c'])) {
                                        include_once 'subject_table.php';
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--body div-->
    </body>
</html>

