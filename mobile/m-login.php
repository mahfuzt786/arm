<?php
	session_start();
    require_once 'includes/m-html_requireincludes.php';
	require_once 'includes/m-p-html_logincheck.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="msapplication-tap-highlight" content="no" />
		<!-- WARNING: for iOS 7, remove the width=device-width and height=device-height attributes. See https://issues.apache.org/jira/browse/CB-4323 -->
		<meta name="viewport" content="width=device-width, height=device-height, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, target-densitydpi=medium-dpi" />
	
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="//code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/jquery.mobile-1.4.5.min.js"></script>
		<link rel="stylesheet" href="css/main.css" />
        <style>
            .ui-panel-inner {
                padding: 0;
            }
        </style>
		<link rel="stylesheet" href="css/nav-search.css" />
		<script src="js/mobile-menu.js"></script>
        <script src="js/symptom-menu.js"></script>
		<script src="js/jqm.autoComplete-1.5.2.js"></script>
        <link rel="stylesheet" href="css/login.css" />
        <script src="js/login.js"></script>
    </head>
    <body>
        <div data-role="page" id="pageone" data-title="Login">
            <!--<div data-role="header" id="customHeader" data-position="fixed" data-tap-toggle="false" data-transition="none">
                <div class="ui-btn-left ui-controlgroup ui-controlgroup-vertical ui-corner-all" type="horizontal" data-role="controlgroup" style="line-height: 3.3em;">
				</div>
				<h1 style="margin: 0;">
					<a href="m-public.php" rel="external" style="width: 100%; float: left;">
						<img src="images/kamwo-logo.png" width="80em;" />
					</a>
				</h1>
            </div>-->
			
			<?php
				require_once('includes/m-header.php');
			?>
          
            <div data-role="main" class="ui-content">
				<!--touch animaion-->
				<img src="images/touch-small.png" alt="touch" class="touchImageAnim" style="display: none;" />
				<img src="images/touch.png" alt="touch" class="touchImageAnimBig" style="display: none;" />
				
				<div data-role="popup" class="ui-content" id="popupAlert" data-overlay-theme="b" data-theme="a">
                    <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
                    <div data-role="header" class="ui-content" id="sortHeader">
                        <h1>Alert</h1>
                    </div>
                    <div role="main" class="ui-content" style="background-color: #FFF;">
                        <p id="alertMessagez"></p>
                        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-rel="back" style="margin-left: 40%;">Ok</a>
                    </div>
                </div>
		
				<div class="loginHeadMsg">
					Log into <b>Kamwo E-Script</b> with your Email below
				</div>
				
				<div class="loginErrorMsg" id="loginErrorMsg">
					<?php
						require_once('includes/m-error-warning.php');
						
						if(isset($_SESSION[SESS_LOGIN_MSG]))
						{
							echo $_SESSION[SESS_LOGIN_MSG];
							$_SESSION[SESS_LOGIN_MSG]='';
						}
					?>
				</div>
				
				<div class="loginBoxes">
					<div class="inputRow">
						<input type="text" id="loginTxtEmail" name="loginTxtEmail" class="loginTxt" placeholder="Email" autocomplete="off" autofocus required="true" value="<?php if(isset($_COOKIE['__UserM'])) echo $_COOKIE['__UserM']; else echo ''; ?>" />
					</div>
					
					<div class="inputRow">
						<input type="password" id="loginTxtPass" name="loginTxtPass" class="loginTxt" placeholder="Password" autocomplete="off" required="true" value="<?php if(isset($_COOKIE['__PassM'])) echo $_COOKIE['__PassM']; else echo ''; ?>" />
					</div>
					
					<div class="inputRow">
						<input type="checkbox" name="rememberMe" id="rememberMe" <?php if(isset($_COOKIE['rememberMeM'])) echo $_COOKIE['rememberMeM']; else echo ''; ?> />
						<span style="float: right; margin-left: 0;">Remember Me</span>
					</div>
					
					<div class="inputRow">
						<a id="loginBtnSubmit" href="#">Sign In</a>
					</div>
					
				</div>
				
				<div class="loginForgotPassword" style="height: 3em;">
					<div class="inputRowMed" style="min-height: 2em;">
						<span style="line-height: 20px;">New User?
							<a href="m-practitioner-registration.php" rel="external">Register Here</a>
							or
						</span>
						<span style="line-height: 20px;">
							<a href="m-public.php" rel="external">View as Guest</a>
						</span>
					</div>
				</div>
				
				<div class="loginForgotPassword">
					<div class="inputRowMed" style="height: 2em;">
						<span>Forgot password?</span>
					</div>
					
					<div class="inputRowMed">
						<input type="text" id="reclaimAccount" name="reclaimAccount" class="loginTxt" placeholder="Email" autocomplete="off" />
					</div>
					
					<div class="inputRowMed">
						<a id="mailPassWord" href="#">Send Password to my Email</a>
					</div>
				</div>
				
				<!-- login loader-->                    
				<div id="submitting">
					<div id="upsProcessing">
						<img id="bottom" src="../images/process-bottom.png"/>
						<img id="fill" src="../images/process-fill.png"/>
						<img id="top" src="../images/login-anim.png"/>
					</div>
				</div>                    
				<!--end loader-->
		
            </div>
        </div>
        
    </body>
</html>