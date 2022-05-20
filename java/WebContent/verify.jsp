<%@ include file="IncludeGit.jsp"%>
<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Verify</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="media/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="dependencies/bootstrap/css/bootstrap.min.css">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="dependencies/fontawesome/css/all.min.css">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="dependencies/flaticon/flaticon.css">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="dependencies/owl.carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="dependencies/owl.carousel/css/owl.theme.default.min.css">
    <!-- Animated Headlines CSS -->
    <link rel="stylesheet" href="dependencies/jquery-animated-headlines/css/jquery.animatedheadline.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="dependencies/magnific-popup/css/magnific-popup.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="dependencies/animate.css/css/animate.min.css">
    <!-- Meanmenu CSS -->
    <link rel="stylesheet" href="dependencies/meanmenu/css/meanmenu.min.css">
    <!-- Site Stylesheet -->
    <link rel="stylesheet" href="assets/css/app.css">

    <link rel="stylesheet" href="assets/css/seat.css">

    <!-- Google Web Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

</head>

<body class="sticky-header">
<%--<%@ include file="user_statement.jsp"%>--%>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->
<!-- ScrollUp Start Here -->
<a href="#wrapper" data-type="section-switch" class="scrollup">
    <i class="fas fa-angle-double-up"></i>
</a>
<!-- ScrollUp End Here -->
<!-- Preloader Start Here -->
<div id="preloader"></div>
<!-- Preloader End Here -->
<div id="wrapper" class="wrapper">

    <!--=====================================-->
    <!--=            Header Start           =-->
    <!--=====================================-->
    <%@ page import="org.hyperledger.fabric.sdk.User" %>
<header class="header">
    <div id="rt-sticky-placeholder"></div>
    <div id="header-menu" class="header-menu menu-layout2">
        <div class="container">
            <div class="row d-flex align-items-center">
                <div class="col-lg-2">
                    <div class="logo-area">
                        
                    </div>
                </div>
                <div class="col-lg-7 d-flex justify-content-end">
                    <nav id="dropdown" class="template-main-menu">
                        
                    </nav>
                </div>
                <div class="col-lg-3 d-flex justify-content-end">
                    <div class="header-action-layout1">
                        <ul>
                            <li class="header-login-icon">
                                <a href="manage.jsp" class="color-primary" data-toggle="tooltip" data-placement="top" title="Home">
                                    <i class="fa fa-home">
                                        <%
                                            user uh = (user) session.getAttribute("user");
                                            if (session.getAttribute("user")!=null){
                                        %>
                                        
                                        <%
                                            }
                                        %>
                                    </i>
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

    
    <!--=====================================-->
    <!--=        Inner Banner Start         =-->
    <!--=====================================-->
    <section class="inner-page-banner" data-bg-image="media/banner/banner1.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumbs-area">
                        <h1>Verification Page for Staff Usage Only </h1>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=====================================-->
    <!--=        Faq Page Start      		=-->
    <!--=====================================-->
    <section class="section-padding-equal-70 bg-accent">
        <div class="container">
            <div class="error-page-box-layout1">
                <h2 class="item-title">Dear staff, welcome to use this page to check the ownership and verify the ticket.</h2>
                    <script>
                        function chooseOne(chk){
                            var obj = document.getElementsByName("type");
                            for (i=0; i<obj.length; i++){
                                if (obj[i]!==chk) obj[i].checked = false;
                                else obj[i].checked = true;
                            }
                        }
                    </script>
                <form action="MidVerify.jsp" method="GET">
                    QRCode:  
                    <div><input type="text" name="QR">
                    </div>
                    
                    <div>
                        Identity number(Please ask customer to show the identity number and input it here if use model 2.):
                        <div>
                            <input type="text" name="identity">
                        </div>

                    </div>

                    <input type="checkbox" name="type" value="1" onclick="chooseOne(this)">Model 1
                    <input type="checkbox" name="type" value="2" onclick="chooseOne(this)">Model 2
                    <div class="button-buy">
                        <button class="buy" type="submit"  >Verify</button>
                        
                    </div>
                </form>

            </div>
            
        </div>
    </section>
    <!--=====================================-->
    <!--=       Footer Start           	=-->
    <!--=====================================-->
    <%@ include file="CSS_Footer_Start.jsp"%>

</div>
<!-- Jquery Js -->
<script src="dependencies/jquery/js/jquery.min.js"></script>
<!-- Popper Js -->
<script src="dependencies/popper.js/js/popper.min.js"></script>
<!-- Bootstrap Js -->
<script src="dependencies/bootstrap/js/bootstrap.min.js"></script>
<!-- Waypoints Js -->
<script src="dependencies/waypoints/js/jquery.waypoints.min.js"></script>
<!-- Counterup Js -->
<script src="dependencies/jquery.counterup/js/jquery.counterup.min.js"></script>
<!-- Owl Carousel Js -->
<script src="dependencies/owl.carousel/js/owl.carousel.min.js"></script>
<!-- ImagesLoaded Js -->
<script src="dependencies/imagesloaded/js/imagesloaded.pkgd.min.js"></script>
<!-- Isotope Js -->
<script src="dependencies/isotope-layout/js/isotope.pkgd.min.js"></script>
<!-- Animated Headline Js -->
<script src="dependencies/jquery-animated-headlines/js/jquery.animatedheadline.min.js"></script>
<!-- Magnific Popup Js -->
<script src="dependencies/magnific-popup/js/jquery.magnific-popup.min.js"></script>
<!-- ElevateZoom Js -->
<script src="dependencies/elevatezoom/js/jquery.elevateZoom-2.2.3.min.js"></script>
<!-- Bootstrap Validate Js -->
<script src="dependencies/bootstrap-validator/js/validator.min.js"></script>
<!-- Meanmenu Js -->
<script src="dependencies/meanmenu/js/jquery.meanmenu.min.js"></script>
<!-- Google Map js -->
<script src="https://ditu.google.cn/maps/api/js?key=AIzaSyBtmXSwv4YmAKtcZyyad9W7D4AC08z0Rb4"></script>
<!-- Site Scripts -->
<script src="assets/js/app.js"></script>

</body>

</html>