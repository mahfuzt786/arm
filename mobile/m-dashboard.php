<?php
    session_start();
	require_once 'includes/m-html_requireincludes.php';
    require_once 'includes/m-html_logincheck.php';
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
        <!-- <link rel="stylesheet" href="//code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        <script src="//code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->
		<link rel="stylesheet" href="//code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/jquery.mobile-1.4.5.min.js"></script>
        <link rel="stylesheet" href="css/main.css" />
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
        <div data-role="page" id="pageone" data-title="Dashboard">
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
							dashboard
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
					$userId = $_SESSION[SESS_PRACTITIONER_ID];
				?>
				<div class="pracName">
					Welcome <?php echo ((strlen($_SESSION[SESS_LOGIN_NAME]) > 25) ? substr($_SESSION[SESS_LOGIN_NAME],0,25).'...' : $_SESSION[SESS_LOGIN_NAME]); ?>
				</div>
				<div class="detailsAllInfo">
					<?php
						/** to display retainer section **/
						$isRetainer 			= '';
						$totalUnpaid			= '';
						$reportName			 	= '';
						$totalReportRetainer 	= '';
						$totalPaidRetainer		= '';
        
						$sql="SELECT isRetainer
								FROM kpo.user
							   WHERE userId = '$userId'";
						$arRes = $mysqli->query($sql);
						if (!$arRes)
						{
							echo "Error in retrieving retainer details -> ". $mysqli->error;
						}
						
						if ( empty( $arRes ) ) {
							return null;
						}
						
						$arRow = $arRes->fetch_object();
						{
							$isRetainer = $arRow->isRetainer;
						}
						
						$sqlUn="SELECT 'Unpaid', sum(orderRetainer) totalUnpaid 
								FROM kpo.storeorder
										   JOIN kpo.patient on patient.patientId = storeorder.patientId
								WHERE status           = 'complete'
									 AND checkoutType     = 'retainer'
									 AND retainerReportId = '1'
									 AND storeorder.userId = '$userId'
								 ORDER BY storeOrderId";
						$arResUn = $mysqli->query($sqlUn);
						if (!$arResUn)
						{
							echo "Error in retrieving retainer details -> ". $mysqli->error;
						}
						
						if ( empty( $arResUn ) ) {
							return null;
						}
						
						$arRowUn = $arResUn->fetch_object();
						{
							$totalUnpaid = $arRowUn->totalUnpaid;
						}
						
						$sqlRep="SELECT reportName, SUM(orderRetainer) totalReportRetainer
									FROM kpo.storeorder S
											   JOIN kpo.retainerreport R on R.retainerReportId = S.retainerReportId
								   WHERE S.userId = '$userId'
									   AND S.retainerReportId = (SELECT MAX(retainerReportId)
																	FROM kpo.retainerreport)
									 GROUP BY reportName;";
						$arResRep = $mysqli->query($sqlRep);
						if (!$arResRep)
						{
							echo "Error in retrieving retainer details -> ". $mysqli->error;
						}
						
						if ( empty( $arResRep ) ) {
							return null;
						}
						if(mysqli_num_rows($arResRep) > 0)
						{
							$arRowRep = $arResRep->fetch_object();
							{
								$reportName			 = $arRowRep->reportName;
								$totalReportRetainer = $arRowRep->totalReportRetainer;
							}
						}
						
						$sqlPaid="SELECT 'Paid 2016', SUM(orderRetainer) totalPaidRetainer
									FROM kpo.storeorder S
											  JOIN kpo.retainerreport R on R.retainerReportId = S.retainerReportId
								   WHERE S.userId = '$userId'
									 AND S.retainerReportId > 22;";
						$arResPaid = $mysqli->query($sqlPaid);
						if (!$arResPaid)
						{
							echo "Error in retrieving retainer details -> ". $mysqli->error;
						}
						
						if ( empty( $arResPaid ) ) {
							return null;
						}
						if(mysqli_num_rows($arResPaid) > 0)
						{
							$arRowPaid = $arResPaid->fetch_object();
							{
								$totalPaidRetainer = $arRowPaid->totalPaidRetainer;
							}
						}
					?>
					
					<div class="wrapper" <?php if(strtoupper($isRetainer) !== 'Y') echo ' style="display: none;"'; ?>>
						<div class="outsideDetailsAll dispRetainer">
							<span class="info">
								retainer
							</span>
							<span class="edit">
								<a href="#" class="ui-btn" id="btnDisplay"> <i class="fa fa-plus"></i> </a>
								<a href="#" class="ui-btn" id="btnDisplayNo" style="display: none;"> <i class="fa fa-minus"></i> </a>
							</span>
						</div>
						<div class="insideDetailsAll" id="secRetainer" style="display: none;">
							<div class="descriptionShort">
								<div class="headRetainer">
									<span>unpaid</span>
									<span <?php if($reportName == '') echo ' style="display: none;"'; ?>><?php echo $reportName;?></span>
									<span>paid 2016</span>
								</div>
								<div class="priceRetainer">
									<span><a href="#" class="ui-btn">$<?php echo number_format($totalUnpaid,2); ?></a></span>
									<span <?php if($reportName == '') echo ' style="display: none;"'; ?>><a href="#" class="ui-btn">$<?php echo number_format($totalReportRetainer,2); ?></a></span>
									<span><a href="#" class="ui-btn">$<?php echo number_format($totalPaidRetainer,2); ?></a></span>
								</div>
							</div>
						</div> <!--end inside detail div-->
					</div> <!--end wrapper separation-->
					
					<div class="wrapper">
						<div class="outsideDetailsAll dispOffice">	
							<span class="info">
								office orders
							</span>
							<span class="edit">
								<a href="#" class="ui-btn" id="btnDisplayOf"> <i class="fa fa-plus"></i> </a>
								<a href="#" class="ui-btn" id="btnDisplayOfNo" style="display: none;"> <i class="fa fa-minus"></i> </a>
							</span>
						</div>
						<div class="insideDetailsAll" id="secOffice" style="padding:0; width: 100%; display: none;">
							<?php
								$statusLabel = '';
								$sqlOf="SELECT orderSubmitDate, P.lastName, P.firstName,
												storeOrderId, status, externalComment
									 FROM kpo.storeorder S
												JOIN kpo.patient P ON P.patientId = S.patientId 
									WHERE S.userid = '$userId'
										AND isPractitioner = 'Y'
									ORDER BY storeOrderId DESC
									   LIMIT  5";
								$arResOf = $mysqli->query($sqlOf);
								if (!$arResOf)
								{
									echo "Error in retrieving retainer details -> ". $mysqli->error;
								}
								
								if ( empty( $arResOf ) ) {
									return null;
								}
								
								while($arRowOf = $arResOf->fetch_object())
								{
									$statusLabel    = getStatusLabel($arRowOf->status);
									if($statusLabel=='Ready for ship/pickup')
									{
										$statusLabel = 'Ship/pickup';
									}
									if($statusLabel=='Order received')
									{
										$statusLabel = 'Received';
									}
									if($statusLabel=='Order Expired after payment')
									{
										$statusLabel = 'Expired';
									}
									if($statusLabel=='Waiting for patient checkout')
									{
										$statusLabel = 'Waiting';
									}
							?>
									<div class="descriptionOrder">
										<a href="m-patient-order-items.php?ordertId=<?php echo $arRowOf->storeOrderId;?>&patientName=<?php echo $arRowOf->lastName.', '.$arRowOf->firstName;?>" rel="external" id="btnOfficeClick">
											<div class="orderHead">
												<span style="width: 26%;"><?php echo date('M j, Y', strtotime($arRowOf->orderSubmitDate)); ?></span>
												<span><?php echo $arRowOf->lastName; ?></span>
												<span>#<?php echo $arRowOf->storeOrderId; ?></span>
												<span><?php echo $statusLabel; ?></span>
												<span style="width: 8%; background: #C0C0C0;"><i class="fa fa-chevron-right"></i></span>
											</div>
										</a>
									<?php
										if($statusLabel == 'On hold')
										{
									?>
											<div class="orderDesc">
												<?php echo $arRowOf->externalComment; ?>
											</div>
									<?php
										}
									?>
									</div>
							<?php
								}
							?>
							
						</div> <!--end inside detail div-->
					</div> <!--end wrapper separation-->
					
					<div class="wrapper">
						<div class="outsideDetailsAll dispLast">
							<span class="info">
								last 5 orders
							</span>
							<span class="edit">
								<a href="#" class="ui-btn" id="btnDisplayLast"> <i class="fa fa-plus"></i> </a>
								<a href="#" class="ui-btn" id="btnDisplayLastNo" style="display: none;"> <i class="fa fa-minus"></i> </a>
							</span>
						</div>
						<div class="insideDetailsAll" id="secLast" style="padding: 0; width: 100%; display: none;">
							
							<?php
								$statusLabelLast = '';
								$sqlLast="SELECT orderSubmitDate, P.lastName, P.firstName,
												storeOrderId, status, externalComment
									 FROM kpo.storeorder S
												JOIN kpo.patient P ON P.patientId = S.patientId 
									WHERE S.userid = '$userId'
									ORDER BY storeOrderId DESC
									   LIMIT  5";
								$arResLast = $mysqli->query($sqlLast);
								if (!$arResLast)
								{
									echo "Error in retrieving retainer details -> ". $mysqli->error;
								}
								
								if ( empty( $arResLast ) ) {
									return null;
								}
								
								while($arRowLast = $arResLast->fetch_object())
								{
									$statusLabelLast    = getStatusLabel($arRowLast->status);
									if($statusLabelLast=='Ready for ship/pickup')
									{
										$statusLabelLast = 'Ship/pickup';
									}
									if($statusLabelLast=='Order received')
									{
										$statusLabelLast = 'Received';
									}
									if($statusLabelLast=='Order Expired after payment')
									{
										$statusLabelLast = 'Expired';
									}
									if($statusLabelLast=='Waiting for patient checkout')
									{
										$statusLabelLast = 'Waiting';
									}
							?>
									<div class="descriptionOrder">
										<a href="m-patient-order-items.php?ordertId=<?php echo $arRowLast->storeOrderId;?>&patientName=<?php echo $arRowLast->lastName.', '.$arRowLast->firstName;?>" rel="external" id="btnLastClick">
											<div class="orderHead">
												<span style="width: 26%;"><?php echo date('M j, Y', strtotime($arRowLast->orderSubmitDate)); ?></span>
												<span><?php echo $arRowLast->lastName; ?></span>
												<span>#<?php echo $arRowLast->storeOrderId; ?></span>
												<span><?php echo $statusLabelLast; ?></span>
												<span style="width: 8%; background: #C0C0C0;"><i class="fa fa-chevron-right"></i></span>
											</div>
										</a>
									<?php
										if($statusLabelLast == 'On hold')
										{
									?>
											<div class="orderDesc">
												<?php echo $arRowLast->externalComment; ?>
											</div>
									<?php
										}
									?>
									</div>
							<?php
								}
							?>
							
						</div> <!--end inside detail div-->
					</div> <!--end wrapper separation-->
						
				</div> <!--end div details All-->
				
            </div>
        
		</div>
    </body>
</html>