<%@ include file="IncludeGit.jsp"%>

<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login</title>
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

    <!-- Google Web Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

</head>

<body class="sticky-header bg-accent">
<%
    user UserState = (user) session.getAttribute("user");
    if(UserState!=null){
        response.sendRedirect("Logout.jsp");
    }
%>
<script>
    var aa = sessionStorage.getItem("prevUrl");

    console.log(aa);
</script>
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
    <%@ include file="CSS_HeaderStart.jsp"%>
    <!--=====================================-->
    <!--=        Inner Banner Start         =-->
    <!--=====================================-->
    <section class="inner-page-banner" data-bg-image="media/banner/banner1.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumbs-area">
                        <h1>Login</h1>
                        <ul>
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>Login</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=====================================-->
    <!--=        Contact Page Start    		=-->
    <!--=====================================-->
    <section class="section-padding-equal-70">
        <div class="container">
            <div class="contact-page-box-layout1 light-shadow-bg">
                <div class="myaccount-login-form light-shadow-bg">
                    <div class="light-box-content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-box login-form">
                                    <%
                                        String url = String.valueOf(request.getParameter("url"));
                                    %>
                                    <h3 class="item-title">Login</h3>
                                    <p id="tipss">tips</p>
                                    <script>
                                        if (aa!=null){
                                            document.getElementById("tipss").innerHTML = "You need to login firstly to use our system.";
                                        }else {
                                            document.getElementById("tipss").innerHTML = "";
                                        }
                                    </script>
                                    <form action="MidLogin.jsp">
                                        <input type="hidden" value="<%=url%>" name="url">
                                         <%String warning=String.valueOf(request.getParameter("warning")); 
                                        if(!warning.equals("null")){%>
                                        	<%=warning%>
                                       <%}%>
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="text" class="form-control" name="login-username" id="login-username">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" class="form-control" name="login-password" id="login-password">
                                        </div>

                                        <div class="form-group d-flex">
                                            <input type="submit" class="submit-btn" value="Login" >
                                        </div>
                                        <div class="form-group">
                                            <a href="register.jsp" class="forgot-password">Don't have account? Register!</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--=====================================-->
    <!--=       Footer Start           	=-->
    <!--=====================================-->
    <%@ include file="CSS_Footer_Start.jsp"%>
    <!--<footer>
        <div class="footer-top-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-box-layout1">
                            <div class="footer-logo">
                                <img src="media/footer-logo.png" alt="logo">
                            </div>
                            <p>Classima a Largest Classified Listing Marketplace
                                offers perfect WordPress Ads classified Themes to build
                                your own classified websites.</p>
                            <ul class="footer-social">
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-google-plus-g"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-pinterest"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-box-layout1">
                            <div class="footer-title">
                                <h3>How to Sell Fast</h3>
                            </div>
                            <div class="footer-menu-box">
                                <ul>
                                    <li><a href="#">Selling Tips</a></li>
                                    <li><a href="#">Buy and Sell Quickly</a></li>
                                    <li><a href="#">Membership</a></li>
                                    <li><a href="#">Banner Advertising</a></li>
                                    <li><a href="#">Promote Your Ad</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-box-layout1">
                            <div class="footer-title">
                                <h3>Information</h3>
                            </div>
                            <div class="footer-menu-box">
                                <ul>
                                    <li><a href="#">Company & Contact Info</a></li>
                                    <li><a href="#">Blog & Articles</a></li>
                                    <li><a href="#">Sitemap</a></li>
                                    <li><a href="#">Terms of Service</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-box-layout1">
                            <div class="footer-title">
                                <h3>Help & Support</h3>
                            </div>
                            <div class="footer-menu-box">
                                <ul>
                                    <li><a href="#">Live Chat</a></li>
                                    <li><a href="#">FAQ</a></li>
                                    <li><a href="#">How to Stay Safe</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright-text">
                            Copyright &copy; 2020.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="payment-option">
                            <a href="#">
                                <img src="media/figure/payment.png" alt="payment">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>-->

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