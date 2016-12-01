
<?php
include 'includes/checkInvalidUser.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <title >Administrator : Home</title>
        <?php require_once 'includes/include.php'; ?>
        <link href="css/profile.css" rel="stylesheet"/>
        <link href="css/course.css" rel="stylesheet"/>
        <script src="js/course.js"></script>
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

                new List('event', options);
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
                <div class="col-md-4">
                    <?php include 'includes/menu.php'; ?>
                </div>


                <div class="col-md-8">
                    <div class="panel course-content panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-graduation-cap"></i> Course
                            <a href="home.php" style="float: right;"><i class="fa fa-arrow-left"></i> Back</a>
                        </div>
                        <div class="panel-body">
                            <form id="course-add">
                                <div class="inputRow">
                                    <div style="padding-bottom: 5px;">Course Name :</div>
                                </div>

                                <div class="inputRow">
                                    <input class="form-control" type="text" id="course_name" name='course_name' placeholder="Course Name" value=""/>          
                                </div>

                                <div class="inputRow">
                                    <div style="padding-bottom: 5px;">Course Category :</div>
                                </div>

                                <div class="inputRow">
                                    <input class="form-control" type="text" id="course_category" name='course_category' placeholder="Course Category" value=""/>          
                                </div>
                                <div class="inputRow">
                                    <div style="padding-bottom: 5px;">Fees :</div>
                                </div>

                                <div class="inputRow">
                                    <input class="form-control" type="text" id="course_fee" name='course_fee' placeholder="Course Fee" value=""/>          
                                </div>

                                <div class="inputRow">
                                    <div style="padding-bottom: 5px;">Duration :</div>
                                </div>

                                <div class="inputRow">
                                    <input class="form-control" type="text" id="course_duration" name='course_duration' placeholder="Course Duration" value=""/>          
                                </div>

                                <div style="padding-top: 8px;" class="form-group input-group full_width col-lg-12">
                                    <button type="button" class="btn btn-block btn-primary" name="btn-course" id="btn-course">
                                        <span class="fa fa-plus"></span> Add</button>       
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

