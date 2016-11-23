<!DOCTYPE html>
<html>
    <head>
        <title>Administrator</title>
        <?php include_once 'includes/include.php'; ?>
        <link href="css/login.css" rel="stylesheet">
        <script src="js/login.js"></script>
    </head>
    <body>
        <div class="body_container">
            <div class="login_box panel panel-default col-md-4" style="margin: 0; padding: 0;">
                <div class="panel-body">
                    <form action="" id="frm-login">
                        <div class="form-group input-group col-lg-12 full_width text-center">
                            <i class="fa fa-4x fa-user-secret"></i>
                            <p><b>A D M I N I S T R A T O R</b></p>        
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control" type="text" id="username" name='username' placeholder="username" value="<?php
        if (isset($_COOKIE['__UserA']))
            echo $_COOKIE['__UserA']; else
            echo '';
        ?>"/>          
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input class="form-control" type="password" id="password" name='password' placeholder="password" value="<?php
                                   if (isset($_COOKIE['__PassA']))
                                       echo $_COOKIE['__PassA']; else
                                       echo '';
        ?>"/>          
                        </div>
                        <div class="form-group input-group">
                            <input type="checkbox" name="rememberMe" id="rememberMe" <?php
                                   if (isset($_COOKIE['rememberMeA']))
                                       echo $_COOKIE['rememberMeA']; else
                                       echo '';
        ?> />
                            <span style="text-align: left;"> Remember Me</span>
                        </div>
                        <div class="form-group input-group full_width col-lg-12">
                            <button type="button" class="btn btn-block btn-default" name="btn-login" id="btn-login">
                                <span class="fa fa-sign-in"></span> Login</button>       
                        </div>
                        <div class="form-group" style="border-top: 1px solid lightgrey; padding: 0px; margin: 0px;">
                            <p style="padding-top: 10px;padding-bottom: -15px; text-align: right; font-size: 11px;">Forget Password?</p>
                        </div>
                    </form>
                </div>
                <div class="panel-heading foot">
                    <?php require_once 'includes/footer.php'; ?>
                </div>
            </div>
        </div>
    </body>
</html>
