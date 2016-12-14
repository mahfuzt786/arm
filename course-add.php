
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
        <script src="js/course-add.js"></script>
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
                            <i class="fa fa-graduation-cap"></i> Add Course
                            <a href="course.php" style="float: right;"><i class="fa fa-arrow-left"></i> Back</a>
                        </div>
                        <div class="panel-body">
                            <form id="course-add">
                                <div class="inputRow">
                                    <div class="f-h col-md-3">Course Name : <b class="r">*</b></div>
                                    <div class="col-md-9">
                                        <input class="form-control" type="text" id="course_name" name='course_name' placeholder="Course Name" value=""/>          
                                    </div>
                                </div>

                                <div class="inputRow">
                                    <div class="f-h col-md-3">Course Category : <b class="r">*</b></div>
                                    <div class="col-md-9" style=" padding-bottom: 15px;">

                                        Tuition : <input type="radio" name="course_category" value="t"/>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        Coaching : <input type="radio" name="course_category" value="c"/>
                                    </div>
                                </div>

                                <div style="display: none;" id="fee-structure">
                                    <div class="inputRow">
                                        <div class="f-h col-md-3">Fees : <b class="r">*</b></div>
                                        <div class="col-md-9">
                                            <input class="form-control" style="width: 200px;" maxlength="6" type="text" id="course_fee" name='course_fee' placeholder="Rupees" value=""/>          
                                        </div>
                                    </div>

                                    <div class="inputRow">
                                        <div class="f-h col-md-3">Duration : <b class="r">*</b></div>

                                        <div class="col-md-9">
                                            <input class="form-control" style="width: 200px;" maxlength="2" type="text" id="course_duration" name='course_duration' placeholder="Months" value=""/> 
                                        </div>
                                    </div>
                                </div>


                                <div class="inputRow">
                                    <div class="f-h col-md-3"></div>
                                    <div style="padding-top: 25px;" class="inputRow col-lg-9">
                                        <button style="width: 100px;" type="button" class="btn btn-primary" name="btn-course-add" id="btn-course-add">
                                            <span class="fa fa-plus"></span> Add</button> 

                                        <button style="width: 100px;" type="button" class="btn btn-primary" name="btn-course-clear" id="btn-course-clear">
                                            <span class="fa fa-refresh"></span> Clear</button> 
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

