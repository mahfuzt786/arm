//$(document).on("pagecreate","#pageone",function() {
$(document).ready(function() {
    jsonObject = {
            "productClinic" : [
			{"brand" : "Sales & Promotion",
			"productId": "0"},
            {"brand" : "Acupuncture",
			"productId": "1207"},
			{"brand" : "Aromatherapy",
			"productId": "1703" },
			{"brand" : "Granules Loose & Capsule",
			"productId": "1734" },
			{"brand" : "Bulk Raw Herbs",
			"productId": "1592" },
			{"brand" : "Tablets & Pills",
			"productId": "1740" },
			{"brand" : "Tinctures & Extracts",
			"productId": "1736" },
			{"brand" : "Topical",
			"productId": "1737" },
			{"brand" : "Skin Care",
			"productId": "1738" },
			{"brand" : "More...",
			"productId": "0" }
		    ],
		    "productSub" : [
			{"brand" : "All Brands...",
			"productId": "0"},
            {"brand" : "Brands By Category",
			"productId": "0"},
			{"brand" : "Kamwo Collections",
			"productId": "0" },
//            {"brand" : "Blue Poppy",
//			"productId": "16"},
            {"brand" : "Dermcare",
			"productId": "888" },
			{"brand" : "Meridian Classic Tea Pills",
			"productId": "893" },
			{"brand" : "Meridian Pro Capsules",
			"productId": "17" },
			{"brand" : "Meridian Pro Formulas",
			"productId": "894" },
			{"brand" : "Meridian Remedies",
			"productId": "890" },
			{"brand" : "Meridian Singles",
			"productId": "891" },
			{"brand" : "Meridian Tea Remedies",
			"productId": "895" }
		    ],
		    "symptom" : [					
                        {"name" : "A - Z" },
                        {"name" : "Dermatology" },
                        {"name" : "Trauma and Injury"},
                        {"name" : "Classical Pearls" },
                        {"name" : "Evergreen"},
                        {"name" : "Meridian Biologix"}
		    ],
                    "symptomAZ" : [					
                        {"name" : "A" },
                        {"name" : "B" },
                        {"name" : "C" },
                        {"name" : "D" },
                        {"name" : "E" },
                        {"name" : "F" },
                        {"name" : "G" },
                        {"name" : "H" },
                        {"name" : "I" },
                        {"name" : "J" },
                        {"name" : "K" },
                        {"name" : "L" },
                        {"name" : "M" },
                        {"name" : "N" },
                        {"name" : "O" },
                        {"name" : "P" },
                        {"name" : "Q" },
                        {"name" : "R" },
                        {"name" : "S" },
                        {"name" : "T" },
                        {"name" : "U" },
                        {"name" : "V" },
                        {"name" : "W" },
                        {"name" : "X" },
                        {"name" : "Y" },
                        {"name" : "Z"}
		    ]
        };
	
	/* ajax call for Symptom menu with A-Z products */
	var symptomSub = [];
	var searchTagId = [];
//	var symptomSubDerm = [];
//	var searchTagIdDerm = [];
//	var symptomSubExA = [];
//	var searchTagIdExA = [];
//	
    displaySymptomMenu(symptomMenu);
    function displaySymptomMenu(result){
		/* For A-B */
	    $.each(result['0'], function( Conkey, Convalue ) {
		 symptomSub[Conkey]=Convalue.name;
		 searchTagId[Conkey]=Convalue.searchTagId;
	    });	    
	    /*Dermatology*/
	//    $.each(result['1'], function( Conkey, Convalue ) {
	//	symptomSubDerm[Conkey]=Convalue['name'];
	//	searchTagIdDerm[Conkey]=Convalue['searchTagId'];
	//    });
	//    /*Trauma & Injury*/
	//    $.each(result['2'], function( Conkey, Convalue ) {
	//	symptomSubExA[Conkey]=Convalue['name'];
	//	searchTagIdExA[Conkey]=Convalue['searchTagId'];
	//    });
	}
        
    showFirstMenu();
        
    function showFirstMenu()
	{
        
        for(i=0;i<(jsonObject.productClinic).length;i++ )
	    {
            if(jsonObject.productClinic[i].brand)
            {                
                if(i=='0')
                {
                    $('div#popupClinic ul').append("<li data-icon='false'><a href='m-promotions.php' rel='external' class='menuLinks ui-btn'>"+jsonObject.productClinic[i].brand+"</a></li>");
                }
                if(i>'0' && i<'9')
                {
                    $('div#popupClinic ul').append("<li data-icon='false'><a href='m-product-brand.php?productId="+jsonObject.productClinic[i].productId+"' rel='external' class='menuLinks ui-btn'>"+jsonObject.productClinic[i].brand+"</a></li>");
                }
                if(i=='9')
                {
                    $('div#popupClinic ul').append("<li data-icon='false'><a href='m-shops.php' rel='external' class='menuLinks ui-btn'>"+jsonObject.productClinic[i].brand+"</a></li>");
                }
		    }
	    }
        
	    for(i=0;i<(jsonObject.productSub).length;i++ )
	    {
            if(jsonObject.productSub[i].brand)
            {
                if(i=='0')
                {
                    $('div#popupBrand ul').append("<li data-icon='false'><a href='m-brands.php' rel='external' class='menuLinks ui-btn'>"+jsonObject.productSub[i].brand+"</a></li>");
                }
                else if(i=='1')
                {
                    $('div#popupBrand ul').append("<li data-icon='false'><a href='m-brands-category.php' rel='external' class='menuLinks ui-btn'>"+jsonObject.productSub[i].brand+"</a></li>");
                }
                else if(i=='2')
                {
                    $('div#popupBrand ul').append("<li data-icon='false'><a href='m-kamwo-collection.php' rel='external' class='menuLinks ui-btn'>"+jsonObject.productSub[i].brand+"</a></li>");
                }
                else {
                    $('div#popupBrand ul').append("<li data-icon='false'><a href='m-product-brand.php?productId="+jsonObject.productSub[i].productId+"' rel='external' class='menuLinks ui-btn'>"+jsonObject.productSub[i].brand+"</a></li>");
                }
	        }
	    }
            
            for(i=0;i<(jsonObject.symptom).length;i++ )
            {
                if(jsonObject.symptom[i].name)
                {
                    if(i=='0')
                    {
                        $('div#popupSymptom ul').append("<li data-icon='false'><a href='m-symptom-a-z.php' rel='external' class='menuLinks ui-btn'>"+jsonObject.symptom[i].name+"</a></li>");
                    }
                    else if(i=='1')
                    {                        
                        $('div#popupSymptom ul').append("<li data-icon='false'><a href='m-specialty.php?symptomType="+jsonObject.symptom[i].name+"' rel='external' class='menuLinks ui-btn'>"+jsonObject.symptom[i].name+"</a></li>");
                    }
                    else if(i=='2')
                    {                        
                        $('div#popupSymptom ul').append("<li data-icon='false'><a href='m-specialty.php?symptomType="+jsonObject.symptom[i].name+"' rel='external' class='menuLinks ui-btn'>"+jsonObject.symptom[i].name+"</a></li>");
                    }
                    else if(i=='3')
                    {                        
                        $('div#popupSymptom ul').append("<li data-icon='false'><a href='m-specialty.php?symptomType="+jsonObject.symptom[i].name+"' rel='external' class='menuLinks ui-btn'>"+jsonObject.symptom[i].name+"</a></li>");
                    }
                    else if(i=='4')
                    {                        
                        $('div#popupSymptom ul').append("<li data-icon='false'><a href='m-specialty.php?symptomType="+jsonObject.symptom[i].name+"' rel='external' class='menuLinks ui-btn'>"+jsonObject.symptom[i].name+"</a></li>");
                    }
                    else if(i=='5')
                    {                        
                        $('div#popupSymptom ul').append("<li data-icon='false'><a href='m-specialty.php?symptomType=Biologix' rel='external' class='menuLinks ui-btn'>"+jsonObject.symptom[i].name+"</a></li>");
                    }
                    else {
                        $('div#popupSymptom ul').append("<li data-icon='false'><a href='#' class='menuLinks ui-btn'>"+jsonObject.symptom[i].name+"</a></li>");
                    }
                }
            }
	    
	    for(var i=0;i<(symptomSub).length;i++ )
	    {
            if(symptomSub[i])
            {
                //$('#symptomzAll').append("<li data-icon='false' id='"+searchTagId[i]+"'><a href='m-product-symptom.php?symptomId="+searchTagId[i]+"' rel='external' class=''>"+symptomSub[i]+"</a></li>");
                //$('#SxMenuAll ul').append("<li data-icon='false' id='"+searchTagId[i]+"'><a href='#' class='menuLinks ui-btn'>"+symptomSub[i]+"</a></li>");
                //$('#SxMenuAll #insideAZmenu').append("<p id='"+searchTagId[i]+"'><a href='#' class=''>"+symptomSub[i]+"</a></p>");
                //$('#displayAllSymptoms').append("<p id='"+searchTagId[i]+"'><a href='m-product-symptom.php?symptomId="+searchTagId[i]+"' rel='external' class=''>"+symptomSub[i]+"</a></p>");
	        }
	    }
            //$('#SxMenuAll #insideAZmenu').append("<p id='00'><a href='#' class=''>&nbsp;</a></p>");
	}
    
    /*.....................logout .................*/
	$('div#panelMainMenu').on('click','a#SignOut',function() {
        //touchAnimation(e);
           $.ajax({
                url: "../service/mobile.php",
                type: "POST",
                data: "action=logout",
                //dataType: "json",
                success: function(result){		    
                    if(result=='cleared')
                    {
                         document.location.replace('m-login.php');
                    }
                },
                error: function () {
					$("#popupError p.errorMessage").text('error in logout');
					$("#popupError").popup("open");
                }
            });
	});
    
    //var isSelected = false;
//    $('#search_bar input#search_box').autocomplete({
//        target: $('#autocompleteSearch'),
//        source: '../service/search.php?action=getSuggest&searchText='+$('#search_bar input#search_box').val(),
//        //link: 'target.html?term=',
//        minLength: 1,
//        icon: 'false',
//		matchFromStart: false,
//		loadingHtml : '<li data-icon="false"><a href="#">Loading..</a></li>',
//		callback: function(e) {
//			var $a = $(e.currentTarget);
//					$('#search_box').val( $a.data('autocomplete').value );
//					$("#search_box").autocomplete('clear');
//			$('#autocompleteSearch').hide();
//		}
//    });

    $("div#nav-iss-attach .ui-input-search input").on('keyup', function() {
        if($(this).val().length < 3)
		{
			$('div#nav-iss-attach #search_box').hide();
		}
		else
		{
			$('div#nav-iss-attach #search_box').show();
		}
	});
    
    $("div#nav-iss-attach a.ui-input-clear").on('tap', function() {
		
		$('div#nav-iss-attach #search_box').hide();
        //touchAnimation(e);
	});

    $( '#search_bar #search_box' ).on( "filterablebeforefilter", function ( e, data ) {
		var $ul = $( this ),
		    $input = $( data.input ),
		    value = $input.val(),
		    html = "";
		$ul.html( "" );
		if ( value && value.length > 2 ) {
		    $ul.html( "<li><div class='ui-loader'><span class='ui-icon ui-icon-loading'></span></div></li>" );
		    $ul.listview( "refresh" );
		    $.ajax({
				url: "../service/search.php",
				type: "POST",
				dataType: "json",
				cache: false,
				crossDomain: true,
				data: {action:'getSuggest',searchText: $input.val()}
				})
			.then( function ( response ) {
				$.each( response['0'], function ( i, val ) {
					var resultName	= val.name.toLowerCase();
					var valueToBold	= value.toLowerCase();
					var valName	= resultName.replace(valueToBold, '<span style="font-weight: bold; color:#0cc;">'+valueToBold+'</span>');
                    if(val.categoryId=='0'){
                        if(val.ID=='1') {
                            html += "<li data-icon='false' value='"+val.ID+"'><a href='m-custom-granule.php' rel='external'>" + valName + "</a></li>";
                        }
                        else if(val.ID=='2') {
                            html += "<li data-icon='false' value='"+val.ID+"'><a href='m-custom-raw-herb.php' rel='external'>" + valName + "</a></li>";
                        }
                        else {
                            html += "<li data-icon='false' value='"+val.ID+"'><a href='m-product-info.php?productInfoId="+val.ID+"' rel='external'>" + valName + "</a></li>";
                        }
                    }
                    else if(val.categoryId=='-1') {
                        html += "<li data-icon='false' value='"+val.ID+"'><a href='m-patient-order-history.php?patientId="+val.ID+"' rel='external'>" + valName + "</a></li>";
                    }
                    else if(val.categoryId=='1') {
                        html += "<li data-icon='false' value='"+val.ID+"'><a href='m-product-symptom.php?symptomId="+val.ID+"' rel='external'>" + valName + "</a></li>";
                    }
                    else if(val.categoryId=='3') {
                        html += "<li data-icon='false' value='"+val.ID+"'><a href='m-product-brand.php?productId="+val.ID+"' rel='external'>" + valName + "</a></li>";
                    }
                    else
					{
						html += "<li data-icon='false' value='"+val.ID+"'><a href='#' rel='external'>" + valName + "</a></li>";
					}
										
				});
				
				$ul.html( html );
				$ul.listview( "refresh" );
				$ul.trigger( "updatelayout");
				$('ul#search_box li').removeClass('ui-screen-hidden');
		    });
		}
	});
    
    /* show X if text is there in header search */
	$('#nav-searchbar .ui-filterable .ui-input-search .ui-input-clear').addClass('ui-alt-icon ui-nodisc-icon');
    
    /* search hit enter */
	$('div#nav-searchbar').on('keyup','.ui-filterable .ui-input-search input',function(e){
	    e.preventDefault();
	    var searchText=$('#nav-searchbar .ui-filterable .ui-input-search input').val();
	    
	    if(e.which == 13) {
            if(searchText !== '' && searchText !== null) {
                location.replace('m-search-results.php?searchText='+searchText);
            }
	    }
	});
	
	/*search go click*/
	$('div#nav-searchbar').on('tap','#searchGo .nav-submit-input',function(e){
	    e.preventDefault();
        //touchAnimation(e);
        
	    var searchText=$('#nav-searchbar .ui-filterable .ui-input-search input').val();
	    
	    if(searchText === '' || searchText === null)
		{
            $("#popupError p.errorMessage").html("Search box is empty..");
			
            $('#popupError').popup("open");
		}
	    else {
            location.replace('m-search-results.php?searchText='+searchText);
	    }
	});
    
    /** cart header icon click **/
    $('#customHeader').on('tap','a#btnCartIcon',function() {
        $('#cartIconHead').css('border','1px solid #ffa200');
    });
    
    /** back header click border highlight **/
	$('#headBorder').on('tap','.headingName a',function() {
        $('#headBorder').css('border','1px solid #ffa200');
    });
    
    /** cart header search go click **/
    $('#search_bar').on('tap','a#searchGo',function() {
        $('#searchGo #goBorderTap').css('border','1px solid #ffa200');
    });
    
    /** single header click border highlight **/
	$('#headSingle').on('tap','a',function() {
        $('#headSingle').css('border','1px solid #ffa200');
    });
    
});
