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
        <link rel="stylesheet" href="css/m-practitioner-registration.css" />
		<script src="js/mobile-menu.js"></script>
        <script src="js/symptom-menu.js"></script>
		<script src="js/jqm.autoComplete-1.5.2.js"></script>
		<script src="js/m-practitioner-registration.js"></script>
    </head>
    <body>
        <div data-role="page" id="pageone" data-title="Registration">
			<?php
				require_once('includes/m-header.php');
			?>
          
            <div data-role="main" class="ui-content">
				<div class="headingBack">
					<div class="ui-btn-left" id="headBorder">
						<div class="headPrev" data-type="horizontal">
							<i class="fa fa-chevron-left"></i>
						</div>
						<div class="headingName" data-type="horizontal">
							<a href="#" data-rel="back">register</a>
						</div>
					</div>
                    <div class="ui-btn-right sortPopup" data-type="horizontal">
												
					</div>
                </div>
				
				<?php
					require_once('includes/m-error-warning.php');
				?>
				<form name="frmRegister" id="frmRegister" action="<?php $_SERVER["PHP_SELF"];?>" method="post" enctype="multipart/form-data">
					<input type="hidden" id="action" name="action" value="register" />
					
					<div class="detailsAllInfo">
						<span>practitioner name</span>
						<div class="insideDetailsAll">
							<div class="descriptionShort">
								<span class="txtTitle">First Name</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" id="fname" name="fname" value="" required />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">last name</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" id="lname" name="lname" value="" required />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">Company</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" id="company" name="company" value="" required />
								</span>
							</div>
						</div>
						
						<span>contact information</span>
						<div class="insideDetailsAll">
							<div class="descriptionShort">
								<span class="txtTitle">email address</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" id="email" name="email" value="" />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">mobile number</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" id="phone" name="phone" value="" />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">phone number</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" id="phone2" name="phone2" value="" />
								</span>
							</div>
						</div>
						
						<span>office address</span>
						<div class="insideDetailsAll">
							<div class="descriptionShort">
								<span class="txtTitle">Address</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" id="address1" name="address1" value="" />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">city</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" id="city" name="city" value="" />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">state/Region/Prov.</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" id="state" name="state" value="" />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">zip/ postal code</span>
								<span class="txtDesc">
									<input type="number" class="txtInput" id="zip" name="zip" value="" />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">country</span>
								<span class="txtDesc">
									<select class="selectControl" id="country" name="country" data-native-menu="false">
										<option value="American Samoa">American Samoa</option>
										<option value="Angola">Angola</option>
										<option value="Anguilla">Anguilla</option>
										<option value="Antigua">Antigua</option>
										<option value="Argentina">Argentina</option>
										<option value="Armenia">Armenia</option>
										<option value="Aruba">Aruba</option>
										<option value="Australia">Australia</option>
										<option value="Austria">Austria</option>
										<option value="Azerbaijan">Azerbaijan</option>
										<option value="Azores (Portugal)">Azores (Portugal)</option>
										<option value="Bahamas">Bahamas</option>
										<option value="Bahrain">Bahrain</option>
										<option value="Bangladesh">Bangladesh</option>
										<option value="Barbados">Barbados</option>
										<option value="Barbuda">Barbuda</option>
										<option value="Belarus">Belarus</option>
										<option value="Belgium">Belgium</option>
										<option value="Belize">Belize</option>
										<option value="Benin">Benin</option>
										<option value="Bermuda">Bermuda</option>
										<option value="Bhutan">Bhutan</option>
										<option value="Bolivia">Bolivia</option>
										<option value="Bonaire">Bonaire</option>
										<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
										<option value="Botswana">Botswana</option>
										<option value="Brazil">Brazil</option>
										<option value="Brunei">Brunei</option>
										<option value="Bulgaria">Bulgaria</option>
										<option value="Burkina Faso">Burkina Faso</option>
										<option value="Burundi">Burundi</option>
										<option value="Cambodia">Cambodia</option>
										<option value="Cameroon">Cameroon</option>
										<option value="Canada">Canada</option>
										<option value="Cape Verde">Cape Verde</option>
										<option value="Cayman Islands">Cayman Islands</option>
										<option value="Chad">Chad</option>
										<option value="Chile">Chile</option>
										<option value="China">China</option>
										<option value="Colombia">Colombia</option>
										<option value="Congo">Congo</option>
										<option value="Cook Islands">Cook Islands</option>
										<option value="Costa Rica">Costa Rica</option>
										<option value="Croatia">Croatia</option>
										<option value="Curacao">Curacao</option>
										<option value="Cyprus">Cyprus</option>
										<option value="Czech Republic">Czech Republic</option>
										<option value="Denmark">Denmark</option>
										<option value="Djibouti">Djibouti</option>
										<option value="Dominica">Dominica</option>
										<option value="Dominican Republic">Dominican Republic</option>
										<option value="Ecuador">Ecuador</option>
										<option value="Egypt">Egypt</option>
										<option value="El Salvador">El Salvador</option>
										<option value="Eritrea" >Eritrea</option>
										<option value="Estonia">Estonia</option>
										<option value="Ethiopia">Ethiopia</option>
										<option value="Faroe Islands">Faroe Islands</option>
										<option value="Fiji Islands">Fiji Islands</option>
										<option value="Finland">Finland</option>
										<option value="France">France</option>
										<option value="French Guiana">French Guiana</option>
										<option value="French Polynesia">French Polynesia</option>
										<option value="Gabon">Gabon</option>
										<option value="Gambia">Gambia</option>
										<option value="Georgia">Georgia</option>
										<option value="Germany">Germany</option>
										<option value="Ghana">Ghana</option>
										<option value="Gibraltar">Gibraltar</option>
										<option value="Greece">Greece</option>
										<option value="Greenland">Greenland</option>
										<option value="Grenada">Grenada</option>
										<option value="Guadeloupe">Guadeloupe</option>
										<option value="Guam">Guam</option>
										<option value="Guatemala">Guatemala</option>
										<option value="Guinea">Guinea</option>
										<option value="Guyana">Guyana</option>
										<option value="Haiti">Haiti</option>
										<option value="Honduras">Honduras</option>
										<option value="Hong Kong">Hong Kong</option>
										<option value="Hungary">Hungary</option>
										<option value="Iceland">Iceland</option>
										<option value="India">India</option>
										<option value="Indonesia">Indonesia</option>
										<option value="Ireland, Republic of">Ireland, Republic of</option>
										<option value="Israel">Israel</option>
										<option value="Italy">Italy</option>
										<option value="Ivory Coast">Ivory Coast</option>
										<option value="Jamaica">Jamaica</option>
										<option value="Japan">Japan</option>
										<option value="Jordan">Jordan</option>
										<option value="Kazakhstan">Kazakhstan</option>
										<option value="Kenya">Kenya</option>
										<option value="Korea, Republic of">Korea, Republic of</option>
										<option value="Kuwait">Kuwait</option>
										<option value="Kyrgyzstan">Kyrgyzstan</option>
										<option value="Laos">Laos</option>
										<option value="Latvia">Latvia</option>
										<option value="Lebanon">Lebanon</option>
										<option value="Lesotho">Lesotho</option>
										<option value="Liberia">Liberia</option>
										<option value="Liechtenstein">Liechtenstein</option>
										<option value="Lithuania">Lithuania</option>
										<option value="Luxembourg">Luxembourg</option>
										<option value="Macau">Macau</option>
										<option value="Macedonia">Macedonia</option>
										<option value="Madagascar">Madagascar</option>
										<option value="Madeira (Portugal)">Madeira (Portugal)</option>
										<option value="Malawi">Malawi</option>
										<option value="Malaysia">Malaysia</option>
										<option value="Maldives">Maldives</option>
										<option value="Mali">Mali</option>
										<option value="Malta">Malta</option>
										<option value="Marshall Islands">Marshall Islands</option>
										<option value="Martinique">Martinique</option>
										<option value="Mauritania">Mauritania</option>
										<option value="Mauritius">Mauritius</option>
										<option value="Mexico">Mexico</option>
										<option value="Micronesia">Micronesia</option>
										<option value="Moldova">Moldova</option>
										<option value="Monaco">Monaco</option>
										<option value="Mongolia">Mongolia</option>
										<option value="Montenegro, Republica of">Montenegro, Republica of</option>
										<option value="Montserrat">Montserrat</option>
										<option value="Morocco">Morocco</option>
										<option value="Mozambique">Mozambique</option>
										<option value="Namibia">Namibia</option>
										<option value="Nepal">Nepal</option>
										<option value="Netherlands, The">Netherlands, The</option>
										<option value="New Caledonia">New Caledonia</option>
										<option value="New Zealand">New Zealand</option>
										<option value="Nicaragua">Nicaragua</option>
										<option value="Niger">Niger</option>
										<option value="Nigeria">Nigeria</option>
										<option value="Norway">Norway</option>
										<option value="Oman">Oman</option>
										<option value="Pakistan">Pakistan</option>
										<option value="Palau">Palau</option>
										<option value="Panama">Panama</option>
										<option value="Papua New Guinea">Papua New Guinea</option>
										<option value="Paraguay">Paraguay</option>
										<option value="Peru">Peru</option>
										<option value="Philippines">Philippines</option>
										<option value="Poland">Poland</option>
										<option value="Portugal">Portugal</option>
										<option value="Puerto Rico">Puerto Rico</option>
										<option value="Qatar">Qatar</option>
										<option value="Reunion Island">Reunion Island</option>
										<option value="Romania">Romania</option>
										<option value="Rwanda">Rwanda</option>
										<option value="Saipan">Saipan</option>
										<option value="Saudi Arabia">Saudi Arabia</option>
										<option value="Scotland (U.K)">Scotland (U.K)</option>
										<option value="Senegal">Senegal</option>
										<option value="Serbia, Republic of">Serbia, Republic of</option>
										<option value="Seychelles">Seychelles</option>
										<option value="Singapore">Singapore</option>
										<option value="Slovakia">Slovakia</option>
										<option value="Slovenia">Slovenia</option>
										<option value="South Africa">South Africa</option>
										<option value="Spain">Spain</option>
										<option value="Sri Lanka">Sri Lanka</option>
										<option value="St. Barthelemy">St. Barthelemy</option>
										<option value="St. Croix">St. Croix</option>
										<option value="St. Eustatius">St. Eustatius</option>
										<option value="St. John">St. John</option>
										<option value="St. Kitts">St. Kitts</option>
										<option value="St. Lucia">St. Lucia</option>
										<option value="St. Maarten">St. Maarten</option>
										<option value="St. Thomas">St. Thomas</option>
										<option value="St. Vincent">St. Vincent</option>
										<option value="Suriname">Suriname</option>
										<option value="Swaziland">Swaziland</option>
										<option value="Sweden">Sweden</option>
										<option value="Switzerland">Switzerland</option>
										<option value="Taiwan">Taiwan</option>
										<option value="Tanzania">Tanzania</option>
										<option value="Thailand">Thailand</option>
										<option value="Togo">Togo</option>
										<option value="Tonga">Tonga</option>
										<option value="Trinidad and Tobago">Trinidad and Tobago</option>
										<option value="Tunisia">Tunisia</option>
										<option value="Turkey">Turkey</option>
										<option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
										<option value="Uganda">Uganda</option>
										<option value="United Arab Emirates">United Arab Emirates</option>
										<option value="United Kingdom">United Kingdom</option>
										<option value="USA" selected>USA</option>
										<option value="Uruguay">Uruguay</option>
										<option value="Uzbekistan">Uzbekistan</option>
										<option value="Vanuatu">Vanuatu</option>
										<option value="Venezuela">Venezuela</option>
										<option value="Vietnam">Vietnam</option>
										<option value="Virgin Islands (BR)">Virgin Islands (BR)</option>
										<option value="Virgin Islands (US)">Virgin Islands (US)</option>
										<option value="Wales (U.K.)">Wales (U.K.)</option>
										<option value="Western Samoa">Western Samoa</option>
										<option value="Zambia">Zambia</option>
										<option value="Zimbabwe">Zimbabwe</option>
									</select>
								</span>
							</div>
						</div>
						
						<span>my profession</span>
						<div class="insideDetailsAll">
							<div class="descriptionShort descriptionAllergy">
								<span class="txtAllergyName" style="width: 100%;">
									<input class="radioProfession" type="radio" name="profession" id="practitioner" value="practitioner" checked />
									I am a practitoner
								</span>
								
								<span class="txtAllergyName" style="width: 100%;">
									<input class="radioProfession" type="radio" name="profession" id="student" value="student" />
									i am a student
								</span>							
							</div>
							
							<div id="practitionerBlock">
								<div class="descriptionShort">
									<span class="txtTitle">Profession</span>
									<span class="txtDesc">
										<input type="text" class="txtInput" id="txtprofession" name="txtprofession" value="" />
									</span>
								</div>
								<div class="descriptionShort">
									<span class="txtTitle">License Number</span>
									<span class="txtDesc">
										<input type="text" class="txtInput" id="license" name="license" value="" />
									</span>
								</div>
								<div class="descriptionShort">
									<span class="txtTitle">State Issued</span>
									<span class="txtDesc">
										<select class="selectControl" id="licenseState" name="licenseState" data-native-menu="false">
											<option value="none" selected>Select State</option>
											<option value="AL">Alabama</option>
											<option value="AK">Alaska</option>
											<option value="AZ">Arizona</option>
											<option value="AR">Arkansas</option>
											<option value="CA">California</option>
											<option value="CO">Colorado</option>
											<option value="CT">Connecticut</option>
											<option value="DE">Delaware</option>
											<option value="DC">District of Columbia</option>
											<option value="FL"> Florida</option>
											<option value="GA">Georgia</option>
											<option value="HI">Hawaii</option>
											<option value="ID">Idaho</option>
											<option value="IL">Illinois</option>
											<option value="IN">Indiana</option>
											<option value="IA">Iowa</option>
											<option value="KS">Kansas</option>
											<option value="KY">Kentucky</option>
											<option value="LA">Louisiana</option>
											<option value="ME">Maine</option>
											<option value="MD">Maryland</option>
											<option value="MA">Massachusetts</option>
											<option value="MI">Michigan</option>
											<option value="MN">Minnesota</option>
											<option value="MS">Mississippi</option>
											<option value="MO">Missouri</option>
											<option value="MT">Montana</option>
											<option value="NE">Nebraska</option>
											<option value="NV">Nevada</option>
											<option value="NH">New Hampshire</option>
											<option value="NJ">New Jersey</option>
											<option value="NM">New Mexico</option>
											<option value="NY">New York</option>
											<option value="NC">North Carolina</option>
											<option value="ND">North Dakota</option>
											<option value="OH">Ohio</option>
											<option value="OK">Oklahoma</option>
											<option value="OR">Oregon</option>
											<option value="PA">Pennsylvania</option>
											<option value="RI">Rhode Island</option>
											<option value="SC">South Carolina</option>
											<option value="SD">South Dakota</option>
											<option value="TN">Tennessee</option>
											<option value="TX">Texas</option>
											<option value="UT">Utah</option>
											<option value="VT">Vermont</option>
											<option value="VA">Virginia</option>
											<option value="WA">Washington</option>
											<option value="WV">West Virginia</option>
											<option value="WI">Wisconsin</option>
											<option value="WY">Wyoming</option>
										</select>
									</span>
								</div>
								<div class="descriptionShort">
									<span class="txtDesc txtAllergyHead" style="color: #666;">
										We may ask you for a copy of your licence if we cannot find your licence number online.
									</span>
								</div>
								<div class="descriptionShort">
									<span class="txtTitle">If you have a partnership code, please enter it here</span>
									<span class="txtDesc">
										<input type="text" class="txtInput" id="partnershipP" name="partnershipP" value="" />
									</span>
								</div>
							</div>  <!--end practitioner block-->
							
							<div id="studentBlock" style="display: none;">
								<div class="descriptionShort">
									<span class="txtTitle">School Name</span>
									<span class="txtDesc">
										<input type="text" class="txtInput" id="school" name="school" value="" />
									</span>
								</div>
								<div class="descriptionShort">
									<span class="txtTitle">Student ID</span>
									<span class="txtDesc">
										<input type="text" class="txtInput" id="studentID" name="studentID" value="" />
									</span>
								</div>
								<div class="descriptionShort">
									<span class="txtDesc txtAllergyHead" style="color: #666;">
										Make sure to send a picture of your student ID to <strong>contact@kamwo.com</strong>
									</span>
								</div>
								<div class="descriptionShort">
									<span class="txtTitle">If you have a partnership code, please enter it here</span>
									<span class="txtDesc">
										<input type="text" class="txtInput" id="partnershipS" name="partnershipS" value="" />
									</span>
								</div>
							</div> <!--end student block-->
							
						</div>
						
						<span>how did you hear about kamwo?</span>
						<div class="insideDetailsAll">
							<div class="descriptionShort">
								<span class="txtDesc">
									<select class="selectControl" id="hearAboutUs" name="hearAboutUs" data-native-menu="false">
										<option value=" " selected="selected">Select How</option>
										<option value="Facebook Ad">Facebook Ad</option>
										<option value="Other Online Ad">Other Online Ad</option>
										<option value="School">School</option>
										<option value="Event/Conference">Event/Conference</option>
										<option value="Print Ad">Print Ad</option>
										<option value="Retail Store">Retail Store</option>
										<option value="Colleague/Friend">Colleague/Friend</option>
										<option value="Other">Other</option>
									</select>
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">other</span>
								<span class="txtDesc">
									<input type="text" id="txthearAboutUs" name="txthearAboutUs" readonly="readonly" />
								</span>
							</div>
						</div>
						
						<span>give thanks!</span>
						<div class="insideDetailsAll">
							<div class="descriptionShort">
								<span class="txtTitle">Did someone refer you?</span>
								<span class="txtDesc">
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">Share their contact with us and we will send a <strong>$25 E-Script Coupon </strong>
									for their next order.
								</span>
								<span class="txtDesc">
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">name</span>
								<span class="txtDesc">
									<input type="text" id="referName" name="referName" value="" placeholder="Name" />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">email</span>
								<span class="txtDesc">
									<input type="text" id="referEmail" name="referEmail" value="" placeholder="Email Address" />
								</span>
							</div>
						</div>
						
						<span>security questions</span>
						<div class="insideDetailsAll">
							<div class="descriptionShort" style="border-bottom: none;">
								<span class="txtTitle"> </span>
								<span class="txtDesc">
									<!--captcha example begin -->
									<!--<img src="lib/captcha/captcha.php" id="captcha" /><br />
											  <a href="#" onclick="
									  document.getElementById('captcha').src='lib/captcha/captcha.php?'+Math.random();
									  document.getElementById('captcha-form').focus();"
									  id="change-image">Not readable? Change text.</a><br />
									<input type="text" name="captcha" id="captcha-form" autocomplete="off" />-->
									<!--captcha example end -->
									<img src="../lib/captcha/captcha.php" id="captcha" />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle"> </span>
								<span class="txtDesc">
									<a href="#" onclick="
												document.getElementById('captcha').src='../lib/captcha/captcha.php?'+Math.random();
												document.getElementById('captcha-form').focus();"
												id="change-image" style="text-decoration: none; color: #526c5a;">
										Not readable? Change text.
									</a>
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtTitle">Type the word above</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" name="captcha" id="captcha-form" autocomplete="off" />
								</span>
							</div>
							<div class="descriptionShort" style="border-bottom: none;">
								<span class="txtTitle">Please type in your first and last name initials</span>
								<span class="txtDesc">
									<input type="text" class="txtInput" name="initialsName" id="initialsName" autocomplete="off" />
								</span>
							</div>
							<div class="descriptionShort">
								<span class="txtDesc txtAllergyHead" style="color: #666;">
									(example John Doe is JD)
								</span>
							</div>
						</div>
						
					</div>
					
					<div class="patientOperations">
						<a class="ui-btn btnBackColor" href="#" id="btnregister">register</a>
						<a style="background: #666;" class="ui-btn btnBackColor" href="m-public.php" rel="external" id="registerCancel">cancel</a>
					</div>
				</form>
				
				<!--loader-->
				<div class="loader_imageSubmit" id="submitting" >
					<span class="loader_span"></span>
				</div>
				<!--end loader-->
				
            </div>
        </div>
        
    </body>
</html>