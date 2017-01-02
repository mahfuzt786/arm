
<?php
include 'includes/checkInvalidUser.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <title >Phoenix : Course</title>
        <?php require_once 'includes/include.php'; ?>
        <link href="css/profile.css?v=3" rel="stylesheet"/>
        <link href="css/course.css" rel="stylesheet"/>
        <script src="js/course.js?v=3"></script>
        <script>
            $(document).ready(function () {
                var options = {
                    valueNames: ['name', 'category', 'fees', 'duration', 'options'],
                    page: 9,
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
            function delete_course(id){
                Lobibox.confirm({
                    msg: "Are you sure you want to delete this Course?",
                    callback: function ($this, type, ev) {
                        //Your code goes here
                        if(type=='yes'){
                            $.ajax({
                                url: "includes/course_arm.php",
                                type: "POST",
                                data: {
                                    action: 'delete_course',
                                    id: id
                                },
                                success: function(result){
                                    if(result==0) {
                                        Lobibox.alert("success",
                                        {
                                            msg: 'Course Successfully Deleted ',
                                            callback: function ($this, type, ev) {
                                                if(type=='ok'){
                                                    location.replace('course.php');}
                                            }
                                        });
                                    }
                                    else {
                                        Lobibox.alert("error",
                                        {
                                            msg: result
                                        });
                                    }
                                }
                            });
                        }
                    }
                });
            }
        </script>
    </head>
    <body>

        <?php require_once('includes/navbar.php'); ?>
        <div class="col-lg-12 container-fluid">
            <div class="row-fluid dashboard">
                <div class="col-md-4 items">
                    <?php include 'includes/menu.php'; ?>
                </div>


                <div class="col-md-8  items">

                    <div class="panel panel-default course-content overflow-control">
                        <div class="panel-heading">
                            <i class="fa fa-graduation-cap"></i> Course
                            <a href="home.php" style="float: right;"><i class="fa fa-arrow-left"></i> Back</a>
                        </div>
                        <div class="panel-body">
                            <div id="course">
                                <div class="col-md-12"  style="padding: 0px;">

                                    <?php
                                    $width = '';
                                    if ($_SESSION['rights']["COURSE"]["madd"] == "1") {
                                        echo "<div class='col-md-2' style='padding-left: 0px;'>
                                        <div class='form-group input-group full_width col-md-12'>
                                            <button type='button' class='btn btn-block btn-primary' name='btn-course' id='btn-course'>
                                                <span class='fa fa-plus'></span> Add</button> 
                                        </div>
                                    </div>";
                                        $width = 'col-md-12';
                                    } else {
                                        $width = 'col-md-10';
                                    }
                                    ?>
                                    <div class="<?php
                                    echo $width;
                                    echo 'full_width';
                                    ?>" style="padding: 0px;">
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
                                        $butt = "";
                                        $redirect = "";
                                        $flag = "";
                                        //b - both
                                        //e - edit
                                        //d - delete
                                        //n - none
                                        if ($_SESSION['rights']["COURSE"]["medit"] == "1" && $_SESSION['rights']["COURSE"]["mdelete"] == "1") {
                                            $flag = 'b';
                                            $redirect = 'y';
                                        } else if ($_SESSION['rights']["COURSE"]["medit"] == "1") {
                                            $flag = 'e';
                                            $redirect = 'y';
                                        } else if ($_SESSION['rights']["COURSE"]["mdelete"] == "1") {
                                            $flag = 'd';
                                            $redirect = 'n';
                                        } else {
                                            $redirect = 'n';
                                        }

                                        while ($rows_course = $result_course->fetch(PDO::FETCH_ASSOC)) {
                                            //$rows['courseId'];
                                            echo "<tr>";
                                            $cat = base64_encode($rows_course['courseCategory']);
                                            $name = base64_encode($rows_course['courseName']);
                                            if ($redirect == 'y') {
                                                echo"<td class='name'><a style='font-weight : bold;' href='subject.php?c=" . $cat . "&n=" . $name . "'>" . $rows_course['courseName'] . "</a></td>";
                                            } else {
                                                echo"<td class='name'>" . $rows_course['courseName'] . "</td>";
                                            }if ($rows_course['courseCategory'] == 'c') {
                                                $category = 'Coaching';
                                            } else {
                                                $category = 'Tuition';
                                            }
                                            echo"<td class='category'>" . $category . "</td>";
                                            echo"<td class='fees text-center'>" . $rows_course['fees'] . " ₹</td>";
                                            echo"<td class='duration text-center'>" . $rows_course['courseDuration'] . "</td>";
                                            if ($flag == "b") {
                                                echo "<td class='text-center'>
                                                        <button id='btn-edit-course' onclick=\"window.location='course-edit.php?id=" . base64_encode($rows_course['courseId']) . "'\"><i style='color:darkgreen;' data-toggle='tooltip' data-placement='auto' title='Edit' class='fa fa-wrench'></i></button>
                                                        &nbsp;
                                                        <button id='btn-delete-course' onclick=\"delete_course('" . base64_encode($rows_course['courseId']) . "')\"><i style='color:red;' data-toggle='tooltip' data-placement='auto' title='Delete' class='fa fa-trash'></i></button>
                                                    </td>";
                                            } else if ($flag == "e") {
                                                echo "<td class='text-center'>
                                                        <button id='btn-edit-course' onclick=\"window.location='course-edit.php?id=" . base64_encode($rows_course['courseId']) . "'\"><i style='color:darkgreen;' data-toggle='tooltip' data-placement='auto' title='Edit' class='fa fa-wrench'></i></button>
                                                        &nbsp;
                                                    </td>";
                                            } else if ($flag == "d") {
                                                echo "<td class='text-center'>
                                                        <button id='btn-delete-course' onclick=\"delete_course('" . base64_encode($rows_course['courseId']) . "')\"><i style='color:red;' data-toggle='tooltip' data-placement='auto' title='Delete' class='fa fa-trash'></i></button>
                                                    </td>";
                                            } else {
                                                echo "<td class='text-center'>
                                                        View Only
                                                    </td>";
                                            }
                                            echo"</tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
                                <div class="text-right" style="font-size: 8px;" >
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

