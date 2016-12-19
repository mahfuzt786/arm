
<?php
include 'includes/checkInvalidUser.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <title >Phoenix : Subject</title>
        <?php
        require_once 'includes/include.php';
        $cat = $_GET['n'];
        ?>
        <link href="css/profile.css" rel="stylesheet"/>
        <link href="css/subject.css" rel="stylesheet"/>
        <link href="css/course-add.css" rel="stylesheet"/>
        <script src="js/subject.js"></script>
        <script>
            $(document).ready(function () {
                var options = {
                    valueNames: ['name', 'category', 'fees', 'duration', 'options'],
                    page: 3,
                    plugins: [
                        ListPagination({
                            innerWindow: 3,
                            left: 2,
                            right: 2
                        })
                    ]
                };

                new List('subject', options);
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

                    <div class="panel panel-default subject-content">
                        <div class="panel-heading">
                            <i class="fa fa-book"></i> Subject
                            <a href="home.php" style="float: right;"><i class="fa fa-arrow-left"></i> Back</a>
                        </div>
                        <div class="panel-body">


                            <div class="col-md-12">
                                <form id="subject-form">
                                    <div class="inputRow">
                                        <div class="f-h col-md-3">Course Name : <b class="r">*</b></div>
                                        <div class="col-md-9"style="padding-bottom: 10px;">
                                            <select class="form-control" name="course_name" id="course_name"> 
                                                <option value="select">Select Course Name</option>
                                                <?php
                                                $selected = '';
                                                $sql = "SELECT courseId,courseName FROM wtfindin_arm.course ORDER BY courseId DESC";
                                                $stmt = $DB->prepare($sql);
                                                $stmt->execute();
                                                $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                                foreach ($results as $rows) {
                                                    if ($cat == $rows['courseName']) {
                                                        echo '<option selected="selected" value="' . $rows['courseId'] . ' selected = "' . $selected . '"">' . $rows['courseName'] . '</option>';
                                                    } else {
                                                        echo '<option value="' . $rows['courseId'] . '">' . $rows['courseName'] . '</option>';
                                                    }
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="inputRow">
                                        <div class="f-h col-md-3">Subject Name : <b class="r">*</b></div>

                                        <div class="col-md-9">
                                            <input class="form-control" type="text" id="subject_name" placeholder="Subject Name" name='Subject Name' value=""/> 
                                        </div>
                                    </div>

                                    <div style="display: <?php
                                         if ($cat == 'c' || $cat == null) {
                                             echo 'none';
                                         }
                                         ?>" id="fee-structure">
                                        <div class="inputRow">
                                            <div class="f-h col-md-3">Fees : <b class="r">*</b></div>
                                            <div class="col-md-9">
                                                <input class="form-control" style="width: 200px;" maxlength="6" type="text" id="subject_fee" name='subject_fee' placeholder="Rupees" value=""/>          
                                            </div>
                                        </div>
                                    </div>


                                    <div class="inputRow">
                                        <div class="f-h col-md-3"></div>
                                        <div style="padding-top: 10px;" class="inputRow col-lg-9">
                                            <button style="width: 100px;" type="button" class="btn btn-primary" name="btn-course-add" id="btn-course-add">
                                                <span class="fa fa-plus"></span> Add</button> 

                                            <button style="width: 100px;" type="button" class="btn btn-primary" name="btn-course-clear" id="btn-course-clear">
                                                <span class="fa fa-refresh"></span> Clear</button> 
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div id="subject" class="subject_form col-lg-12">
                                <div class="col-md-12"  style="padding: 0px;">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                        <input class="form-control search" placeholder="Search"/>
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
                                        while ($rows_course = $result_course->fetch(PDO::FETCH_ASSOC)) {
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
                                <div class="text-right" style="font-size: 8px;">
                                    <div class="pagination"></div>
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

