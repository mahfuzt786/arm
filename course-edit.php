
<?php
include 'includes/checkInvalidUser.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <title >Phoenix : Course</title>
        <?php require_once 'includes/include.php'; ?>
        <link href="css/profile.css" rel="stylesheet"/>
        <link href="css/course.css" rel="stylesheet"/>
        <link href="css/course-add.css" rel="stylesheet"/>
        <script src="js/course-edit.js"></script>
        <script>
            $(document).ready(function () {
                var options = {
                    valueNames: ['name', 'category', 'fees', 'duration', 'options'],
                    page: 10,
                    plugins: [
                        ListPagination({
                            innerWindow: 3,
                            left: 2,
                            right: 2
                        })
                    ]
                };
                new List('course', options);
                $('[data-toggle="tooltip"]').tooltip({
                    container: 'body'
                });
            });
        </script>
    </head>
    <body>

        <?php require_once('includes/navbar.php'); ?>
        <div class="col-lg-12 container-fluid">
            <div class="row-fluid dashboard">
                <div class="col-md-4  items">
                    <?php include 'includes/menu.php'; ?>
                </div>


                <div class="col-md-8  items">

                    <div class="panel panel-default course-content">
                        <div class="panel-heading">
                            <i class="fa fa-graduation-cap"></i> Edit Course
                            <a href="course.php" style="float: right;"><i class="fa fa-arrow-left"></i> Back</a>
                        </div>

                        <?php
                        $cid = $_GET['id'];
                        $id = base64_decode($cid);
                        $sql = "select course.* from wtfindin_arm.course where courseId = :id";
                        $stmt = $DB->prepare($sql);
                        $stmt->bindValue(":id", $id);
                        $stmt->execute();
                        $rows = $stmt->fetch();
                        ?>

                        <div class="panel-body">
                            <form id="course-add">
                                <div class="inputRow">
                                    <div class="f-h col-md-3">Course Name : <b class="r">*</b></div>
                                    <div class="col-md-9">
                                        <input class="form-control" type="text" id="course_name" name='course_name' placeholder="Course Name" value="<?php echo $rows['courseName']; ?>"/>          
                                    </div>
                                </div>

                                <div class="inputRow">
                                    <div class="f-h col-md-3" style="padding-bottom:10px; padding-top:8px;">Course Category : <b class="r">*</b></div>
                                    <div class="f-h col-md-9" style="padding-bottom:10px; padding-top:8px;">
                                        <?php
                                        $cat = "";
                                        if($rows['courseCategory'] == 'c') {
                                            $cat = 'COACHING';
                                        }else{
                                            $cat = 'TUITION';
                                        }
                                        ?>
                                        <label><?php echo $cat; ?></label>
                                    </div>
                                </div>

                                <div <?php if($rows['courseCategory'] == 't'){echo "style='display: none;'";}?> id="fee-structure">
                                    <div class="inputRow">
                                        <div class="f-h col-md-3">Fees : <b class="r">*</b></div>
                                        <div class="col-md-9">
                                            <input class="form-control" style="width: 200px;" maxlength="6" type="text" id="course_fee" name='course_fee' placeholder="Rupees" value="<?php echo $rows['fees']; ?>"/>          
                                        </div>
                                    </div>

                                    <div class="inputRow">
                                        <div class="f-h col-md-3">Duration : <b class="r">*</b></div>

                                        <div class="col-md-9">
                                            <input class="form-control" style="width: 200px;" maxlength="2" type="text" id="course_duration" name='course_duration' placeholder="Months" value="<?php echo $rows['courseDuration']; ?>"/> 
                                        </div>
                                    </div>
                                </div>


                                <div class="inputRow">
                                    <div class="f-h col-md-3"></div>
                                    <div style="padding-top: 25px;" class="inputRow col-lg-9">
                                        <button style="width: 100px;" type="button" class="btn btn-primary" name="btn-course-edit" id="btn-course-edit">
                                            <span class="fa fa-pencil"></span> Update</button> 
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--body div-->
    </body>
</html>

