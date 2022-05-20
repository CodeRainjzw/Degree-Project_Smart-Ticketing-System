<%@ include file="IncludeGit.jsp"%>


<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="media/favicon.png">
    <!--    网页标签栏图标-->
    <!--    <link rel="shortcut icon" type="image/x-icon" href="picture/1.jpg">-->
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


    <link rel="stylesheet" href="assets/css/search.css">

</head>

<body class="sticky-header">

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
    <%
        String error = String.valueOf(request.getParameter("error"));
        if (error.equals("error")){
        %>
            <script>
                alert("Please enter correct keyword for searching.")
            </script>
        <%
    }
    %>
    <header class="header">
        <div id="rt-sticky-placeholder"></div>
        <div id="header-menu" class="header-menu menu-layout1 pd-x-20">
            <div class="container-fluid">
                <div class="row d-flex align-items-center">
                    <div class="col-lg-2">
                    </div>
                    <div class="col-lg-7 d-flex justify-content-end">
                        <nav id="dropdown" class="template-main-menu">
                            <ul>
                                <li>
                                    <a href="index.jsp" >Home</a>
                                </li>
                                <li>
                                    <a href="event.jsp">All events</a>
                                </li>
                                <li>
                                    <a href="market.jsp">Market</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3 d-flex justify-content-end">
                        <div class="header-action-layout1">
                            <ul>
                                <li class="header-login-icon">
                                    <a href="account.jsp" class="color-primary" data-toggle="tooltip" data-placement="top" title="My Account">
                                        <i class="far fa-user">
                                        <%
                                            user uh = (user) session.getAttribute("user");
                                            if (session.getAttribute("user")!=null){
                                        %>
                                        <%=uh.getUname()%>
                                        <%
                                            }
                                        %>
                                        </i>
                                    </a>
                                </li>
                                <li class="header-btn">
                                    <a href="login.jsp" class="item-btn"><i class="fas fa-plus"></i>Log in/Out</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--=====================================-->
    <!--=            Banner Start           =-->
    <!--=====================================-->
    <section class="main-banner-wrap-layout1 bg-dark-overlay bg-common minus-mgt-90" data-bg-image="picture/2.jpg">
        <div class="container">
            <div class="main-banner-box-layout1 animated-headline">
                <h1 class="ah-headline item-title">
                        <span class="ah-words-wrapper">
                            <b class="is-visible">Tickets System</b>
                            <b>Tickets System</b>
                        </span>
                </h1>
                <div class="item-subtitle">We have a lot of Events!</div>
                <div class="search-box-layout1">
                    <form action="MidSearch.jsp">
                        <div class="row no-gutters">
                            <div class="col-lg-10 form-group">
                                <div class="input-search-btn search-keyword">
                                    <i class="fas fa-text-width"></i>
                                    <input type="text" class="form-control" placeholder="Enter Keyword here ..." name="keyword">
                                </div>
                            </div>
                            <div class="col-lg-2 form-group">
                                <button type="submit" class="submit-btn"><i class="fas fa-search"></i>Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--=====================================-->
    <!--=            Category Start           =-->
    <!--=====================================-->
    <section class="section-padding-top-heading">
        <div class="container">
            <div class="heading-layout1">
                <h2 class="heading-title">Our Different Types Events</h2>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="category-box-layout1">
                        <a href="event_type.jsp?type=basketball">
                            <div class="item-icon">
                                <i class="fas fa-basketball-ball"></i>
                            </div>
                            <div class="item-content">
                                <h3 class="item-title">Basketball</h3>
                                <div class="item-count"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="category-box-layout1">
                        <a href="event_type.jsp?type=football">
                            <div class="item-icon">
                                <i class="fas fa-futbol"></i>
                            </div>
                            <div class="item-content">
                                <h3 class="item-title">Football</h3>
                                <div class="item-count"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="category-box-layout1">
                        <a href="event_type.jsp?type=tableTennis">
                            <div class="item-icon">
                                <i class="fas fa-table-tennis"></i>
                            </div>
                            <div class="item-content">
                                <h3 class="item-title">Table tennis</h3>
                                <div class="item-count"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="category-box-layout1">
                        <a href="event_type.jsp?type=baseball">
                            <div class="item-icon">
                                <i class="fas fa-baseball-ball"></i>
                            </div>
                            <div class="item-content">
                                <h3 class="item-title">Baseball</h3>
                                <div class="item-count"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="category-box-layout1">
                        <a href="event_type.jsp?type=rugby">
                            <div class="item-icon">
                                <i class="fas fa-football-ball"></i>
                            </div>
                            <div class="item-content">
                                <h3 class="item-title">Rugby</h3>
                                <div class="item-count"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="category-box-layout1">
                        <a href="event_type.jsp?type=volleyball">
                            <div class="item-icon">
                                <i class="fas fa-volleyball-ball"></i>
                            </div>
                            <div class="item-content">
                                <h3 class="item-title">Volleyball</h3>
                                <div class="item-count"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="category-box-layout1">
                        <a href="event_type.jsp?type=skiing">
                            <div class="item-icon">
                                <i class="fas fa-skiing"></i>
                            </div>
                            <div class="item-content">
                                <h3 class="item-title">Skiing</h3>
                                <div class="item-count"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="category-box-layout1">
                        <a href="event_type.jsp?type=swimming">
                            <div class="item-icon">
                                <i class="fas fa-swimmer"></i>
                            </div>
                            <div class="item-content">
                                <h3 class="item-title">Swimming</h3>
                                <div class="item-count"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%--    <!--=====================================-->--%>
<%--    <!--=       Footer Start           	=-->--%>
<%--    <!--=====================================-->--%>
    <footer>
        <div class="footer-top-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-box-layout1">
                            <p>Final Year Project <br>	
                            Smart Ticketing System</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </footer>
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