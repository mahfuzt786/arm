//$(document).on("pagecreate","#pageone",function() {
$(document).ready(function() {
    
    /** click border highlight **/
    $('.patientOperations').on('tap','a#registerCancel',function(e) {
        e.preventDefault();
        $(this).css('border','1px solid #ffa200');
    });
    
    var professionName='';
    professionName=$('div.descriptionShort input.radioProfession').val();
    
    $('div.descriptionShort').on('change','input.radioProfession',function() {
        professionName=$(this).val();
        if($(this).val()=="student") {
            $('div#practitionerBlock').hide();
            $('div#studentBlock').show();
            $('#license').val('');
            $('#licenseState').val('');
        }
        if($(this).val()=="practitioner") {
            $('div#practitionerBlock').show();
            $('div#studentBlock').hide();
            $('#school').val('');
            $('#studentID').val('');
        }
    });
    
    var hearAboutUs='';
    hearAboutUs=$('div.descriptionShort #hearAboutUs').val();
    
    $('div.descriptionShort').on('change','#hearAboutUs',function() {
        hearAboutUs=$(this).val();
        
        if($(this).val()=="Other") {
            $('div.descriptionShort #txthearAboutUs').attr('readonly',false);
        }
        else {
            $('div.descriptionShort #txthearAboutUs').val('');
            $('div.descriptionShort #txthearAboutUs').attr('readonly',true);
        }
    });
    
    /*zip code check*/
    $('#zip').keyup(function () {
        if (!this.value.match(/^([0-9]{0,10})$/)) {
            this.value = this.value.replace(/[^0-9]/g, '').substring(0,10);
        }
    });
   
   /*email validation*/
    function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
    }
    
    /** submitting register **/
    $('div.patientOperations').on('click','a#btnregister',function(e) {
        e.preventDefault();
        
        $(this).css('border','1px solid #ffa200');
	
        if($('#fname').val() ==='' || $('#fname').val() === null)
        {
            $("#popupError p.errorMessage").text('Please enter First Name');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#lname').val()==='' || $('#lname').val()===null)
        {
            $("#popupError p.errorMessage").text('Please enter Last Name');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#company').val()==='' || $('#company').val()===null)
        {
            $("#popupError p.errorMessage").text('Please enter Company Name');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#email').val()==='' || $('#email').val()===null)
        {
            $("#popupError p.errorMessage").text('Please enter Email');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if (!IsEmail($('input#email').val())) 
        {
            $("#popupError p.errorMessage").text('Please enter email in xxxxx@xxx.xxx format. <BR> ie john.doe@gmail.com');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#phone').val()==='' || $('#phone').val()===null)
        {
            $("#popupError p.errorMessage").text('Please enter Phone Number');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#phone2').val()==='' || $('#phone2').val()===null)
        {
            $("#popupError p.errorMessage").text('Please enter Phone2 Number');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#address1').val()==='' || $('#address1').val()===null)
        {
            $("#popupError p.errorMessage").text('Please enter address');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#city').val()==='' || $('#city').val()===null)
        {
            $("#popupError p.errorMessage").text('Please enter city');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#state').val()==='' || $('#state').val()===null || $('#state').val()==='none')
        {
            $("#popupError p.errorMessage").text('Please Select State');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#zip').val()==='' || $('#zip').val()===null)
        {
            $("#popupError p.errorMessage").text('Please enter zip');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if(hearAboutUs === '' || hearAboutUs === null || hearAboutUs === ' ')
        {
            $("#popupError p.errorMessage").text('Please Select how did you hear about kamwo?');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if(hearAboutUs == 'Other' && ($('#txthearAboutUs').val() === '' || $('#txthearAboutUs').val() === null) )
        {
            $("#popupError p.errorMessage").text('Please Write how did you hear about kamwo?');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if ($('input#referEmail').val() !== '' && (!IsEmail($('input#referEmail').val()))) 
        {
            $("#popupError p.errorMessage").text('Please enter refer email in xxxxx@xxx.xxx format. <BR> ie john.doe@gmail.com');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if($('#initialsName').val()==='' || $('#initialsName').val()===null || $('#captcha-form').val()==='' || $('#captcha-form').val()===null)
        {
            $("#popupError p.errorMessage").text('Please answer the security questions');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else if(professionName === '' || professionName === null)
        {
            $("#popupError p.errorMessage").text('Please select Profession');
            $("#popupError").popup("open");
            $('a#btnregister').css('border','none');
        }
        else
        {
            if(professionName==="student")
            {
                if($('#school').val()==='' || $('#school').val()===null)
                {
                    $("#popupError p.errorMessage").text('Please enter School Name');
                    $("#popupError").popup("open");
                    $('a#btnregister').css('border','none');
                }
                else if($('#studentID').val()==='' || $('#studentID').val()===null)
                {
                    $("#popupError p.errorMessage").text('Please enter Student ID');
                    $("#popupError").popup("open");
                    $('a#btnregister').css('border','none');
                }
                else
                {
                    $('a#btnregister').css('border','none');
                    pracRegister();
                }
            }
            if(professionName==="practitioner")
            {
                if($('#txtprofession').val()==='' || $('#txtprofession').val()===null)
                {
                    $("#popupError p.errorMessage").text('Please enter Profession');
                    $("#popupError").popup("open");
                    $('a#btnregister').css('border','none');
                }
                else if($('#license').val()==='' || $('#license').val()===null)
                {
                    $("#popupError p.errorMessage").text('Please enter License Number');
                    $("#popupError").popup("open");
                    $('a#btnregister').css('border','none');
                }
                else if($('#licenseState').val()==='' || $('#licenseState').val()===null || $('#licenseState').val()==='none')
                {
                    $("#popupError p.errorMessage").text('Please enter State Issued');
                    $("#popupError").popup("open");
                    $('a#btnregister').css('border','none');
                }
                else
                {
                    $('a#btnregister').css('border','none');
                    pracRegister();
                }
            }
        }
    });
    
    function pracRegister()
    {
        var fname=$('#fname').val().charAt(0).toLowerCase();
        var lname=$('#lname').val().charAt(0).toLowerCase();
        
        var initials=(fname+lname);
        
        if(initials==$('#initialsName').val().toLowerCase())
        {
            $('#submitting').show();
            $('#action').val("registerMobile");
            $.ajax({
                url: "../service/practitioner.php",
                type: "POST",
                data: $('#frmRegister').serialize(),
                success: function(result){
                    $('#submitting').hide();
                    if(result=='done')
                    {
                        $('#popupSuccess').popup('open');
                        $('#popupSuccess p.successMessage').html('Thank You for registering for Patient Prescription Pharmacy! We will notify you via email once your application is approved! <BR><BR> A registration confirmation email was sent to '+$('input#email').val()+'. Please check spam folder if you do not see this email from Kamwo in your inbox.<br/><br/> <strong>If you do not receive any email, please email us at contact@kamwo.com</strong>');
                    }
                    else{
                        $("#popupError p.errorMessage").text(result);
                        $("#popupError").popup("open");
                    }		    
                },
                error: function (e,a,b) {
                    $('#submitting').hide();
                    $("#popupError p.errorMessage").text('error in Registration'+e+a+b);
                    $("#popupError").popup("open");
                }
            });
        }
        else {
            $("#popupError p.errorMessage").text('The initials you entered is incorrect');
            $("#popupError").popup("open");
        }
    }
    
    /** on click yes in the success popup **/
	$('div#popupSuccess').on('tap','.ui-footer .btnOk',function(e) {
		e.preventDefault();
		$("#popupSuccess").popup("close");
        location.replace('m-login.php');
    });
    
});
