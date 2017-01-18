<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Phoenix Tutorials - Biswanath Chariali</title>
        <link rel="icon" href="icon/phoenix-logo.png" type="images/x-icon">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/phoenix.css?v=6">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="lib/font-awesome-4.6.3/css/font-awesome.css" />
        <link rel="stylesheet" href="lib/font-awesome-4.6.3/css/font-awesome.min.css" />


    </head>
    <body> 
        <nav class="navbar navbar-inverse phoenixnavbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#phoenixNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <img style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px;" src="icon/phoenix-account.png"/>
                </div>
                <div class="collapse navbar-collapse" id="phoenixNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Courses</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>


        <div id="phoenixCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#phoenixCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#phoenixCarousel" data-slide-to="1"></li>
                <li data-target="#phoenixCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active" align="center">
                    <img src="icon/batch.jpg" alt="new batch">
                    <!--<div class="carousel-caption">
                        <h3>Digital Classroom</h3>
                        <p>Technically Updated Classroom.</p>
                    </div>-->
                </div>

                <div class="item" align="center">
                    <img src="icon/team.jpg" alt="team">
                    <div class="carousel-caption">
                        <h3>Study Materials</h3>
                        <p>Splendid Study Materials</p>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#phoenixCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#phoenixCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="aboutus">
            <p style="text-align: center;"><img src="icon/phoenix-logo.png"/> </p>
            <p class="aboutheading">PHOENIX TUTORIALS</p>
            <p>Phoenix is a premier Tuition cum Coaching institute formed with an AIM to provide "QUALITY EDUCATION FOR EVERY STUDENT AT AFFORDABLE
            FEES"</p>
            <P>We are a group of people who are passionate in every aspect of education sector and our team is derived from people who have experience
         of teaching in the best institutes</P>
            <p>We are operating Tuition from class vi to xii cum Coaching for competitive exams like BANK, SSC, INSURANCE, RAILWAYS etc. in a digital way
            with app and website where students can access updated online study materials, notes etc.</p>
            <p>We are providing the best in the arena whether it is the classroom atmosphere, quality of education, test series or the guidance
            and we will continue to define the future of quality education.</p>
        </div>
        <div class="col-lg-12 text-center parallax">
            <H2 class="text-center"><label class="col-lg-12" style="padding: 10px;">Courses Offered</label></H2> 
        </div>
        <div class="contactus col-lg-12">

            <H2 class="text-center"><label class="col-lg-12" style="padding: 10px;">Contact Us</label></H2>
            <div class="col-lg-6 maps" id="map"></div>
            <script>
                function phoenixMap() {
                    var mapCanvas = document.getElementById("map");
                    var mapOptions = {
                        center: new google.maps.LatLng(26.74, 93.14),
                        zoom: 15,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    var map = new google.maps.Map(mapCanvas, mapOptions);
                    // Creating a marker and positioning it on the map
                    var marker = new google.maps.Marker({
                        position: new google.maps.LatLng(26.740882, 93.142198),
                        label: {
                            color: 'Darkgreen',
                            fontWeight: 'bold',
                            text: 'Phoenix Tutorials'
                        },
                        map: map
                    });
                }
            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA98ybYk8FSE_i_Ff4zC1DtJwL1lHcil_E&callback=phoenixMap"></script>
            <div class="col-lg-6">
                <p><h4>Contact us and we'll get back to you within 24 hours.</h4></p>
                <hr>
                <p><i class="fa fa-envelope"></i> contactus@phoenixtutorials.in</p>
                <p><i class="fa fa-phone"></i> 8473884033 / 9706272008</p>
                <p style="text-justify: auto;"><i class="fa fa-street-view"></i> Kochgaon, Opposite Indian Oil Petrol Pump, Near Kochgaon Namghar Gate, 
                    NH 15, Biswanath Chariali, Biswanath - 784176, Assam.</p>
                <hr>
            </div>
        </div>
        <div class="footer">
            <p>&COPY; <?php echo date(Y) ?> Phoenix Tutorials, All Rights Reserved</p>
            <p>Powered by WalknetFunctions</p>
        </div>
    </body>
</html>

