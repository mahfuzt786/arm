<?php 
include_once 'includes/moduleaccess.php';?>
<nav class="navbar navbar-inverse navbar-fixed-top" id="menu">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#admin-menu">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="color: white; padding: 5px; margin: 0px;"><img src="icon/phoenix.png"/></a>
        </div>
        <div class="collapse navbar-collapse" id="admin-menu">
            <ul class="nav navbar-nav navbar-right">
                <li class="listHome"><a href="home.php"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                <?php foreach ($_SESSION["access"] as $key => $access) { ?>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-database"></i> <?php echo $access["top_menu_name"]; ?>
                            <span class="caret"></span>
                        </a>
                        <?php
                        echo '<ul class="dropdown-menu">';
                        foreach ($access as $k => $val) {
                            if ($k != "top_menu_name") {
                                echo '<li><a href="' . ($val["page_name"]) . '"><i class="fa fa-forward"></i> ' . $val["menu_name"] . '</a></li>';
                                ?>
                                <?php
                            }
                        }
                        echo '</ul>';
                        ?>
                        <!--<ul class="dropdown-menu">
                            <li class="listCourse"><a href="course.php"><i class="fa fa-graduation-cap"></i> Course</a></li>
                            <li class="listSubject"><a href="subject.php"><i class="fa fa-book"></i> Subject</a></li>
                        </ul>-->
                    </li>
                <?php } ?>
                <li class="listSetting"><a href="setting.php"><i class="fa fa-gears"></i> Setting</a></li>
                <li><a href="includes/logout.php"><i class="fa fa-sign-out"></i> Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
