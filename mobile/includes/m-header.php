<?php    
    require_once '../includes/constants.php';
	$guestSet = '0';
	if($_SESSION[SESS_USER_TYPE] == 'Guest')
	{
		$guestSet = '1';
	}
?>
<div data-role="header" id="customHeader" data-position="fixed" data-tap-toggle="false" data-transition="none">
    <div class="ui-btn-left ui-controlgroup ui-controlgroup-vertical ui-corner-all" type="horizontal" data-role="controlgroup" style="line-height: 4em;">
        <div class="ui-controlgroup-controls ">
            <a href="#panelMainMenu" class="ui-link"><i class="floatRight cursorPointer fa fa-bars fa-3x"></i></a>
        </div>
    </div>
    
    <h1 style="margin: 0 15%;">
        <!--<a href="m-login-success.php" rel="external"> <img src="images/phoenix-account.png" width="80em;" /> </a>-->
		<div id="search_bar">
			<div class="nav-searchbar-inner" id="nav-searchbar">
				<a href="#" id="searchGo">
					<div class="nav-submit-button nav-sprite" id="goBorderTap">
						<input type="submit" title="Search" class="nav-submit-input" value="">
					</div>
				</a>
				
				<div class="nav-searchfield-width">
					<div id="nav-iss-attach">
						<!--<input type="text" data-no-match="no matching data found" data-theme="b" data-highlight='ui-btn-up-a' data-minlen="1" placeholder="start typing" id="search_box" name="field" data-role="autocomplete" data-url="../service/search.php?action=getSuggest,searchText={val}" onfocus="this.select()" autofocus>-->
						<!--<input type="text" autocomplete="off" name="search_box" placeholder="E-SCRIPT" value="" title="Search For" id="search_box" class="search_box" />-->
						<ul id="search_box" data-role="listview" data-inset="true" data-filter="true" data-filter-reveal="true" data-filter-placeholder="E-SCRIPT" data-filter-theme="a">
						
						</ul>
						<span class="icon_clear">x</span>
						
					</div>
				</div>
			</div>
		</div>
    </h1>
    
    <div class="ui-btn-right ui-controlgroup ui-controlgroup-vertical ui-corner-all" type="horizontal" data-role="controlgroup" style="margin-left: 0px; margin-right: 0px;" id="cartIconHead">
        <div class="ui-controlgroup-controls ">
            <!--<a href="m-search-product.php" rel="external" class="ui-link"><i class="fa fa-2x fa-search"></i></a>-->
            <?php
				if($guestSet == '1')
				{
				?>
					<a href="m-login.php" rel="external" class="ui-link" id="btnCartIcon">
						<img src="images/icon_signin.png" alt="sign in" title="sign in" height="25px" />
					</a>
				<?php
				}
				else {
					?>
					<a href="m-cart-view.php" rel="external" class="ui-link" id="btnCartIcon"><i class="fa fa-3x fa-shopping-cart" style="font-size: 2.5em;"></i>
						<span id="cartQuantity">
							<?php
								$userId=$_SESSION[SESS_PRACTITIONER_ID];
							
								$totalCart='0';
								$sql="SELECT quantity FROM kpo.cartitem JOIN kpo.product
										ON product.productID = cartitem.productId 
										WHERE userId = '$userId' AND isInCart = 'Y'";
								
								$arRes = $mysqli->query($sql);
								if (!$arRes)
								{
									throw new Exception($mysqli->error);
								}
								if ( empty($arRes) ) {            
									echo "0";
								}
								while($row = $arRes->fetch_object())
								{
									$totalCart+=$row->quantity;
								}
								$_SESSION['CART_ITEMS']=$totalCart;
								echo $totalCart;
							?>
						</span>
					</a>
					<?php
				}
			?>
            <!--<a href="#" class="ui-link"><i class="fa fa-2x fa-suitcase"></i></a>-->
        </div>
    </div>
</div>

<div data-role="panel" id="panelMainMenu" data-display="overlay" data-position-fixed="true">
    <ul data-role="listview" data-inset="true" data-divider-theme="a">
        <li data-icon="false">
			<?php
				if($guestSet == '1')
				{
				?>
					<a href="m-login.php" rel="external" class="menuLinks">Sign In</a>
				<?php
				}
				else {
				?>
					<a href="m-dashboard.php" rel="external" class="menuLinks">My Dashboard</a>
				<?php
				}
			?>
		</li>
        <li data-icon="false"><a href="#popupClinic" class="menuLinks">Shop</a></li>
        <li data-icon="false"><a href="#popupBrand" class="menuLinks">Brand</a></li>
        <li data-icon="false"><a href="#popupSymptom" class="menuLinks">Sx & Disorders</a></li>
        <li data-icon="false">
			<?php
				if($guestSet == '1')
				{
				?>
					<a href="#popupSignIn" data-rel="popup" data-position-to="window" data-transition="slideup" class="menuLinks" style="background: #dedede;">
						Custom Granule
					</a>
				<?php
				}
				else {
				?>
					<a href="m-custom-granule.php" rel="external" class="menuLinks">Custom Granule</a>
				<?php
				}
			?>
		</li>
        <li data-icon="false">
			<?php
				if($guestSet == '1')
				{
				?>
					<a href="#popupSignIn" data-rel="popup" data-position-to="window" data-transition="slideup" class="menuLinks" style="background: #dedede;">
						Custom Raw Herb/ Vaccum Pack
					</a>
				<?php
				}
				else {
				?>
					<a href="m-custom-raw-herb.php" rel="external" class="menuLinks">Custom Raw Herb/ Vaccum Pack</a>
				<?php
				}
			?>
		</li>
        <li data-role="list-divider" class="listHeader"><span style="width: 95%; float: left;">MY ACCOUNT</span><!--<i class="faHeader fa fa-chevron-right"></i>--></li>
		<li data-icon="false">
			<?php
				if($guestSet == '1')
				{
				?>
					<a href="#popupSignIn" data-rel="popup" data-position-to="window" data-transition="slideup" class="menuLinks" style="background: #dedede;">
						Patient
					</a>
				<?php
				}
				else {
				?>
					<a href="#popupPatientz" class="menuLinks">Patient</a>
				<?php
				}
			?>
		</li>
		<li data-icon="false">
			<?php
				if($guestSet == '1')
				{
				?>
					<a href="#popupSignIn" data-rel="popup" data-position-to="window" data-transition="slideup" class="menuLinks" style="background: #dedede;">
						Practitioner
					</a>
				<?php
				}
				else {
				?>
					<a href="#popupPractitioner" class="menuLinks">Practitioner</a>
				<?php
				}
			?>
		</li>
		<?php
			if($guestSet !== '1')
			{
			?>
				<li data-icon="false">
					<a class="menuLinks" id="SignOut" name="SignOut" href="#" rel="external" data-transition="none">Sign Out</a>
				</li>
			<?php
			}
		?>
		<li data-icon="false">
			<a class="menuLinks" href="../m-herb/m-guide-herbs.html" rel="external" target="_self">Go To Herb Guide</a>
		</li>
        <li data-icon="false">
			<?php
				if($guestSet == '1')
				{
				?>
					<a href="../p-public.php" rel="external" class="menuLinks" target="_self">Desktop View</a>
				<?php
				}
				else {
				?>
					<a href="../login-success.php" rel="external" class="menuLinks" target="_self">Desktop View</a>
				<?php
				}
			?>
		</li>
    </ul>
</div><!-- /popup -->

<div data-role="panel" id="popupClinic" data-display="overlay" data-position-fixed="true">
    <ul data-role="listview" data-inset="true" data-divider-theme="a">
        <li data-icon="false"><a href="#panelMainMenu" class="menuLinks"><i class="fa fa-chevron-left"></i>  Back</a></li>
        <li data-role="list-divider" class="listHeader"><span style="width: 95%; float: left;">Shop</span></li>
        <!--<li data-icon="false"><a href="#" class="menuLinks">Blue Poppy</a></li>-->
    </ul>
</div>

<div data-role="panel" id="popupBrand" data-display="overlay" data-position-fixed="true">
    <ul data-role="listview" data-inset="true" data-divider-theme="a">
        <li data-icon="false"><a href="#panelMainMenu" class="menuLinks"><i class="fa fa-chevron-left"></i>  Back</a></li>
        <li data-role="list-divider" class="listHeader"><span style="width: 95%; float: left;">Brand</span></li>
        <!--<li data-icon="false"><a href="#" class="menuLinks">Blue Poppy</a></li>-->
    </ul>
</div>

<div data-role="panel" id="popupSymptom" data-display="overlay" data-position-fixed="true">
    <ul data-role="listview" data-inset="true" data-divider-theme="a">
        <li data-icon="false"><a href="#panelMainMenu" class="menuLinks"><i class="fa fa-chevron-left"></i>  Back</a></li>
        <li data-role="list-divider" class="listHeader"><span style="width: 95%; float: left;">Sx & DISORDERS</span></li>
        <!--<li data-icon="false"><a href="#" class="menuLinks">A - Z</a></li>-->
    </ul>
</div>

<div data-role="panel" id="popupPractitioner" data-display="overlay" data-position-fixed="true">
    <ul data-role="listview" data-inset="true" data-divider-theme="a">
        <li data-icon="false"><a href="#panelMainMenu" class="menuLinks"><i class="fa fa-chevron-left"></i>  Back</a></li>
        <li data-role="list-divider" class="listHeader"><span style="width: 95%; float: left;">Practitioner</span></li>
		<li data-icon="false"><a href="m-practitioner-orders.php" rel="external" class="menuLinks">Recent Orders</a></li>
        <li data-icon="false"><a href="m-practitioner-details.php" rel="external" class="menuLinks">My Profile</a></li>
		<li data-icon="false"><a href="m-retainer.php" rel="external" class="menuLinks">Retainer</a></li>
		<li data-icon="false"><a href="m-formula-templates.php" rel="external" class="menuLinks">My Formula Templates</a></li>
    </ul>
</div>

<div data-role="panel" id="popupPatientz" data-display="overlay" data-position-fixed="true">
    <ul data-role="listview" data-inset="true" data-divider-theme="a">
        <li data-icon="false"><a href="#panelMainMenu" class="menuLinks"><i class="fa fa-chevron-left"></i>  Back</a></li>
        <li data-role="list-divider" class="listHeader"><span style="width: 95%; float: left;">Patient</span></li>
		<li data-icon="false"><a href="m-patient-details-add.php" rel="external" class="menuLinks">Add Patient</a></li>
        <li data-icon="false"><a href="m-patient-history.php" rel="external" class="menuLinks">Patient Profile/ Order</a></li>
    </ul>
</div>

<div data-role="popup" class="ui-content" id="popupSignIn" data-overlay-theme="b" data-theme="a">
	<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	<div data-role="header" class="ui-content" id="successHeader">
		<h1>LOG IN / REGISTER</h1>
	</div>
	<div role="main" class="ui-content" style="background-color: #FFF;">
		<div class="successImgWrapper">
            <img src="images/PleaseLogin_icon.jpg" class="imgLogin" />
        </div>
        
        <p class="confirmMessage">
			Please <strong>Sign In</strong> or <strong>Register</strong> to access all <strong>E-Script Features</strong>
		</p>
	</div>
	<div data-role="footer" class="ui-content">
        <a href="m-login.php" rel="external" class="ui-btn ui-corner-all ui-shadow ui-btn-inline btnYes">Sign In</a>
        <a href="m-practitioner-registration.php" rel="external" class="ui-btn ui-corner-all ui-shadow ui-btn-inline btnNo" >Register</a>
    </div>
</div>
