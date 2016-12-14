<?php
include 'includes/checkInvalidUser.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <title >Phoenix : Dashboard</title>
        <?php require_once 'includes/include.php'; ?>
        <link href="css/profile.css" rel="stylesheet"/>
    </head>
    <body>

        <?php require_once('includes/navbar.php'); 
        $userid = $_SESSION[SESS_LOGIN_ID];
        
        $sql_user_info = "select u.*,r.* from wtfindin_arm.user u inner join wtfindin_arm.role r on u.roleid=r.roleid AND u.userId = :userid";
        $stmt=$DB->prepare($sql_user_info);
        $stmt->bindValue(":userid", $userid);
        $stmt->execute();
        $rows=$stmt->fetch();
        
        //$result_user_info = $mysqli->query($sql_user_info);
        //$rows = $result_user_info->fetch_assoc();
        ?>
        <div class="col-lg-12 container-fluid">
            <div class="row-fluid dashboard">
                <div class="col-md-4  items">
                    <div class="panel panel-default dash-user-info">
                        <div class="panel-heading col-lg-12">
                            <div class="col-md-9" style="padding-left: 0px;">
                                <h3><?php echo $_SESSION[SESS_LOGIN_NAME];?></h3>[ <i style="font-size: 11px;"><?php echo $rows['rolename'];?></i> ]
                            </div>
                            <div class="col-md-3 text-right" style="padding: 0px;">
                                <img class="profile-pic img-thumbnail" id="profilePic" name="profilePic" src="profile-pic/<?php echo $rows['pic']; ?>"/>
                            </div>
                        </div>
                        <div class="panel-body col-lg-12">
                            <table width="100%">
                                <tr><th>Email ID :</th></tr>
                                <tr><td><?php echo $rows['email']; ?></td></tr>
                                <tr><th>Phone Number :</th></tr>
                                <tr><td><?php echo $rows['phone']; ?></td></tr>
                                <tr><th>Address :</th></tr>
                                <tr><td><?php echo $rows['address']; ?></td></tr>
                                <tr><td><?php echo $rows['city'] . ' - ' . $rows['zip']; ?></td></tr>
                                <tr><td><?php echo $rows['state'] . ', ' . $rows['country']; ?></td></tr>
                                <tr><th>Qualification :</th></tr>
                                <tr><td><?php echo $rows['qualification']; ?></td></tr>
                                <tr><th>Profession :</th></tr>
                                <tr><td><?php echo $rows['profession']; ?></td></tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 items">
                    <div class="col-md-3 dash-item items" style="padding-top: 0px;">
                        <div class="panel panel-default dash-sub">
                            <a href="course.php"><div class="panel-body"><i class="fa fa-4x fa-graduation-cap"></i></div></a>
                            <div class="panel-heading">Course</div>
                        </div>
                    </div>
                    <div class="col-md-3 dash-item items" style="padding-top: 0px;">
                        <div class="panel panel-default dash-sub">
                            <a href="subject.php"><div class="panel-body"><i class="fa fa-4x fa-book"></i></div></a>
                            <div class="panel-heading">Subject</div>
                        </div>
                    </div>
                    <div class="col-md-3 dash-item items" style="padding-top: 0px;">
                        <div class="panel panel-default dash-sub">
                            <a href="user.php"><div class="panel-body"><i class="fa fa-4x fa-user"></i></div></a>
                            <div class="panel-heading">User</div>
                        </div>
                    </div>
                    <div class="col-md-3 dash-item items" style="padding-top: 0px;">
                        <div class="panel panel-default dash-sub">
                            <a href="message.php"><div class="panel-body"><i class="fa fa-4x fa-envelope"></i></div></a>
                            <div class="panel-heading">Message</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--body div-->
    </body>
</html>