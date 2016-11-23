
<?php
include 'includes/checkInvalidUser.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <title >Administrator : Home</title>
        <?php require_once 'includes/include.php'; ?>
        <link href="css/profile.css" rel="stylesheet"/>
        <link href="css/event.css" rel="stylesheet"/>
        <script src="js/event.js"></script>
        <script>
            $(document).ready(function() {
                var options = {
                    valueNames: [ 'id', 'name','date', 'desc', 'options' ],
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
                    container : 'body'
                });  
            });
        </script>
    </head>
    <body>

        <?php require_once('includes/navbar.php'); ?>
        <div class="event-content panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-tags"></i> Event
                <a href="home.php" style="float: right;"><i class="fa fa-arrow-left"></i> Back</a>
            </div>
            <div class="panel-body">
                <div id="event">
                    <div class="col-md-2 head_event">
                        <button type="button" data-toggle="modal" data-target="#event-add" class="btn btn-block btn-primary">
                            <span class="fa fa-plus"></span> Add Event</button> 
                    </div>
                    <div class="col-md-4 text-center"><p style="margin: 10px;">*** click on column header to sort ***</p></div>
                    <div class="col-md-6 form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-search"></i></span>
                        <input class="form-control search" placeholder="Search"/>          
                    </div>
                    <table class="col-lg-12 table table-striped">  
                        <thead class="thead-default">  
                            <tr>
                                <th class="sort text-center" data-sort="id" data-toggle="tooltip" data-placement="auto" title="Sort by event ID">ID</th>
                                <th class="sort text-center" data-sort="name" data-toggle="tooltip" data-placement="auto" title="Sort by event name">Name</th>
                                <th class="sort text-center" data-sort="date" width="10%" data-toggle="tooltip" data-placement="auto" title="Sort by event date">Date</th>
                                <th class="sort text-center" data-sort="desc" data-toggle="tooltip" data-placement="auto" title="Sort by event description">Description</th>
                                <th class="text-center" data-toggle="tooltip" width="20%" data-placement="auto" title="Options">Options</th>
                            </tr>  
                        </thead>

                        <tbody class="list">
                            <?php
                            /*$mysqli->set_charset("utf8");
                            $sql_drugs = "SELECT wtfindin_admin.event.*
                                                          FROM event
                                                          ORDER BY id DESC";
                            $result = $mysqli->query($sql_drugs);
                            while ($rows = $result->fetch_assoc()) {
                                //$rows['drugs_cat_id'];
                                echo "<tr>";
                                echo"<td class='id text-center'>" . $rows['id'] . "</td>";
                                echo"<td class='name'>" . $rows['name'] . "</td>";
                                $date = new DateTime($rows['date']);
                                $formated_date = $date->format('j-M-Y');
                                echo"<td class='date text-center'>" . $formated_date . "</td>";
                                echo"<td class='desc'>" . $rows['desc'] . "</td>";
                                echo"<td class='text-center'>
                                                        <button id=\"btn-edit-event\"  onclick=\"edit_event('" . $rows['id'] . "')\"><i style='color:darkgreen;' data-toggle='tooltip' data-placement='auto' title='Edit' class='fa fa-wrench'></i></button>
                                                        &nbsp;
                                                        <button id=\"btn-delete-event\" onclick=\"delete_event('" . $rows['id'] . "')\"><i style='color:red;' data-toggle='tooltip' data-placement='auto' title='Delete' class='fa fa-trash'></i></button>
                                                        </td>";
                                echo"</tr>";
                            }*/
                            ?>
                        </tbody>
                    </table>
                    <div class="text-right">
                        <div id="drug" class="pagination"></div>
                    </div>
                </div>  
            </div>
        </div>
        <!--body div-->

        <div class="footer-account">
            <?php require_once 'includes/footer.php'; ?>
        </div>

        <!--add EVENT Modal -->
        <div class="modal fade" id="event-add" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><span class="fa fa-plus"></span> Add Event</h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <form action="" id="frm-add-event">
                                <div class="form-group ">
                                    <input class="form-control" type="text" id="name" name='name' autocomplete="off" placeholder="Event Name"/>  
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input class="form-control" type="text" readonly id="event-date" name='event-date' autocomplete="off" placeholder="Event Date"/>  
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" type="text" id="desc" name='desc' placeholder="Event Description"></textarea>
                                </div>
                                <div class="form-group input-group col-md-12">
                                    <button type="button" class="btn btn-block btn-primary" name="btn-add-event" id="btn-add-event">
                                        <span class="fa fa-plus"></span> Add Event</button>       
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!--end of add drugs modal-->
    </body>
</html>

