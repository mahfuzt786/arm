
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
                            <i class="fa fa-graduation-cap"></i> Course
                            <a href="home.php" style="float: right;"><i class="fa fa-arrow-left"></i> Back</a>
                        </div>
                        <div class="panel-body">
                            <div id="course">
                                <div class="col-md-12"  style="padding: 0px;">
                                    <div class="col-md-2" style="padding-left: 0px;">
                                        <div class="form-group input-group full_width col-md-12">
                                            <button type="button" class="btn btn-block btn-primary" name="btn-course" id="btn-course">
                                                <span class="fa fa-plus"></span> Add</button> 
                                        </div>
                                    </div>
                                    <div class="col-md-10" style="padding: 0px;">
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                            <input class="form-control search" placeholder="Search"/>
                                        </div>
                                    </div>          
                                </div>
                                <table class="col-lg-12 table table-striped">  
                                    <thead class="thead-default">  
                                        <tr>
                                            <th class="sort text-center" data-sort="name" data-toggle="tooltip" data-placement="auto" title="Click to sort by Course Name">Course Name</th>
                                            <th class="sort text-center" data-sort="category" data-toggle="tooltip" data-placement="auto" title="Click to sort by Course Category">Category</th>
                                            <th class="sort text-center" data-sort="fees" width="15%" data-toggle="tooltip" data-placement="auto" title="Click to sort by Course Fee">Fees</th>
                                            <th class="sort text-center" data-sort="duration"  width="15%" data-toggle="tooltip" data-placement="auto" title="Click to sort by Course Duration">Duration</th>
                                            <th class="text-center" data-toggle="tooltip" width="15%" data-placement="auto" title="Options">Options</th>
                                        </tr>  
                                    </thead>

                                    <tbody class="list">
                                        <?php
                                        //$mysqli->set_charset("utf8");
                                        $sql_course = "SELECT wtfindin_arm.course.*
                                                          FROM course
                                                          ORDER BY courseId DESC";
                                        $result_course = $DB->prepare($sql_course);
                                        $result_course->execute();
                                        while ($rows_course = $result_course->fetch(PDO::FETCH_ASSOC) ) {
                                            //$rows['courseId'];
                                            echo "<tr>";
                                            echo"<td class='name'>" . $rows_course['courseName'] . "</td>";
                                            echo"<td class='category'>" . $rows_course['courseCategory'] . "</td>";
                                            echo"<td class='fees text-center'>" . $rows_course['fees'] . " ₹</td>";
                                            echo"<td class='duration text-center'>" . $rows_course['courseDuration'] . "</td>";
                                            echo"<td class='text-center'>
                                                        <button id=\"btn-edit-event\"  onclick=\"edit_event('" . $rows_course['courseId'] . "')\"><i style='color:darkgreen;' data-toggle='tooltip' data-placement='auto' title='Edit' class='fa fa-wrench'></i></button>
                                                        &nbsp;
                                                        <button id=\"btn-delete-event\" onclick=\"delete_event('" . $rows_course['courseId'] . "')\"><i style='color:red;' data-toggle='tooltip' data-placement='auto' title='Delete' class='fa fa-trash'></i></button>
                                                        </td>";
                                            echo"</tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
                                <div class="text-right">
                                    <div id="course-details" class="pagination"></div>
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

