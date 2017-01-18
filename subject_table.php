<?php
require_once 'includes/include.php';
?>
<link href="css/profile.css" rel="stylesheet"/>
<link href="css/subject.css?v=5" rel="stylesheet"/>
<link href="css/course-add.css" rel="stylesheet"/>
<script src="js/subject.js?v=43"></script>

<div class="col-md-12"  style="padding: 0px;">
    <div class="form-group input-group">
        <span class="input-group-addon"><i class="fa fa-search"></i></span>
        <input class="form-control search" placeholder="Search"/>
    </div>         
</div>
<table class="col-lg-12 table table-striped">  
    <thead class="thead-default">  
        <tr <?php
        if ((isset($_GET['v']) && $_GET['v'] == 'c') || $cat == "c") {
            echo 'style="display : none;"';
        }
        ?> >
            <th class="sort text-center" data-sort="cname" data-toggle="tooltip" data-placement="auto" title="Click to sort by Course Name">Course Name</th>
            <th class="sort text-center" data-sort="sname" data-toggle="tooltip" data-placement="auto" title="Click to sort by Subject Name">Subject Name</th>
            <th class="sort text-center" data-sort="fees" width="15%" data-toggle="tooltip" data-placement="auto" title="Click to sort by Course Fee">Fees</th>
            <th class="text-center" data-toggle="tooltip" width="15%" data-placement="auto" title="Options">Options</th>
        </tr>  
        <tr <?php
        if ((isset($_GET['v']) && $_GET['v'] == 't') || $cat == "t") {
            echo 'style="display : none;"';
        }
        ?>>
            <th class="sort text-center" data-sort="cname" data-toggle="tooltip" data-placement="auto" title="Click to sort by Course Name">Course Name</th>
            <th class="sort text-center" data-sort="sname" data-toggle="tooltip" data-placement="auto" title="Click to sort by Subject Name">Subject Name</th>
            <th class="text-center" data-toggle="tooltip" width="15%" data-placement="auto" title="Options">Options</th>
        </tr> 
    </thead>

    <tbody class="list">
        <?php
        //$mysqli->set_charset("utf8");
        $sql_course = "SELECT wtfindin_arm.course.* FROM course ORDER BY courseId DESC";
        $result_course = $DB->prepare($sql_course);
        $result_course->execute();
        if (($cat == "t" && $cat != null) || $_GET['v'] == 't') {
            while ($rows_course = $result_course->fetch(PDO::FETCH_ASSOC)) {
                //$rows['courseId'];
                echo "<tr>";
                echo"<td class='cname'>" . $rows_course['courseName'] . "</td>";
                echo"<td class='sname'>" . $rows_course['courseCategory'] . "</td>";
                echo"<td class='fees text-center'>" . $rows_course['fees'] . " ₹</td>";
                echo"<td class='text-center'>
                                                        <button id=\"btn-edit-event\"  onclick=\"edit_event('" . $rows_course['courseId'] . "')\"><i style='color:darkgreen;' data-toggle='tooltip' data-placement='auto' title='Edit' class='fa fa-wrench'></i></button>
                                                        &nbsp;
                                                        <button id=\"btn-delete-event\" onclick=\"delete_subject('" . $rows_course['courseId'] . "')\"><i style='color:red;' data-toggle='tooltip' data-placement='auto' title='Delete' class='fa fa-trash'></i></button>
                                                        </td>";
                echo"</tr>";
            }
        } else if (($cat == "c" && $cat != null) || $_GET['v'] == 'c') {
            while ($rows_course = $result_course->fetch(PDO::FETCH_ASSOC)) {
                //$rows['courseId'];
                echo "<tr>";
                echo"<td class='cname'>" . $rows_course['courseName'] . "</td>";
                echo"<td class='sname'>" . $rows_course['courseCategory'] . "</td>";
                echo"<td class='text-center'>
                                                        <button id=\"btn-edit-event\"  onclick=\"edit_event('" . $rows_course['courseId'] . "')\"><i style='color:darkgreen;' data-toggle='tooltip' data-placement='auto' title='Edit' class='fa fa-wrench'></i></button>
                                                        &nbsp;
                                                        <button id=\"btn-delete-event\" onclick=\"delete_subject('" . $rows_course['courseId'] . "')\"><i style='color:red;' data-toggle='tooltip' data-placement='auto' title='Delete' class='fa fa-trash'></i></button>
                                                        </td>";
                echo"</tr>";
            }
        }
        ?>
    </tbody>
</table>
<div class="text-right" style="font-size: 8px;">
    <div class="pagination"></div>
</div> 

