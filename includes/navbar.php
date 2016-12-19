<?php 
include_once 'includes/moduleaccess.php';?>
<div class="se-pre-con"></div>
<nav class="navbar navbar-inverse navbar-fixed-top" id="menu">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#admin-menu">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="color: white; padding: 5px; margin: 0px;"><img src="icon/phoenix-account.png"/></a>
        </div>
        <div class="collapse navbar-collapse" id="admin-menu">
            <ul class="nav navbar-nav navbar-right">
                <li class="listHome"><a href="home.php"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                <li class="listSetting"><a href="setting.php"><i class="fa fa-gears"></i> Setting</a></li>
                <li><a href="includes/logout.php"><i class="fa fa-sign-out"></i> Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
