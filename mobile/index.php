<?php
	session_start();
    require_once 'includes/m-html_requireincludes.php';
    require_once 'includes/m-p-html_logincheck.php';
    
    if(isset($_SESSION[SESS_PRACTITIONER_ID]))
    {   // User is already login, redirect to dashboard.php
        //header('Location: m-dashboard.php');
    }
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
		<link rel="stylesheet" href="themes/phoenix.min.css" />
		<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />
        <style>
            .ui-panel-inner {
                padding: 0;
            }
        </style>
        <link rel="stylesheet" href="css/m-dashboard.css" />
        <script src="js/mobile-menu.js"></script>
        <script src="js/symptom-menu.js"></script>
		<link rel="stylesheet" href="css/nav-search.css" />
		<script src="js/m-dashboard.js"></script>
    </head>
    <body>
        <div data-role="page" id="pageone" data-title="Public Page">
            <?php
				require_once('includes/m-header.php');
			?>
          
            <div data-role="main" class="ui-content">
				<!--touch animaion-->
				<img src="images/touch-small.png" alt="touch" class="touchImageAnim" style="display: none;" />
				<img src="images/touch.png" alt="touch" class="touchImageAnimBig" style="display: none;" />
				
				<div class="headingBack">
					<div class="ui-btn-left" id="headBorder">
						<div class="headPrev" data-type="horizontal">
							<!--<i class="fa fa-chevron-left"></i>-->
						</div>
						<div class="headingName" data-type="horizontal" style="text-transform: capitalize;">
							<!--dashboard-->
						</div>
					</div>
                    <!--<div class="ui-btn-right sortPopup" data-type="horizontal" style="text-transform: uppercase;">
						<a href="#popupSort" data-rel="popup" data-position-to="window" data-transition="slideup">
							My dashboard
						</a>
					</div>-->
				</div>
				
				<?php
					require_once('includes/m-error-warning.php');
				?>
				<div class="pracName">
					Welcome Guest
				</div>
				<div class="detailsAllInfo">
					<div class="wrapper">
						<img width="100%" alt="Home Page" src="../images/Website_Landing_evergreenpromotion.jpg" />
					</div> <!--end wrapper separation-->
						
				</div> <!--end div details All-->
				
            </div>
        
		</div>
    </body>
</html>