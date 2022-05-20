<%--
  Created by IntelliJ IDEA.
  User: 24393
  Date: 2022/3/24
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="IncludeGit.jsp"%>



<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Event</title>
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
    <%@ include file="CSS_HeaderStart.jsp"%>
    <!--=====================================-->
    <!--=        Inner Banner Start         =-->
    <!--=====================================-->
    <%String pic = null;
    String type = request.getParameter("type");
    if(type.equals("basketball")){
    	pic="picture/basketball.jpg";
    }
    else if(type.equals("football")){
    	pic="picture/football.jpg";
    }
    else if(type.equals("tableTennis")){
    	pic="picture/tabletennis.jpg";
    }
    else if(type.equals("baseball")){
    	pic="picture/baseball.jpg";
    }
    else if(type.equals("rugby")){
    	pic="picture/rugby.jpg";
    }
    else if(type.equals("volleyball")){
    	pic="picture/volleyball.jpg";
    }
    else if(type.equals("skiing")){
    	pic="picture/skiing.jpg";
    }
    else if(type.equals("swimming")){
    	pic="picture/swimming.jpg";
    }
    %>
    <section class="inner-page-banner" data-bg-image=<%=pic %>>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumbs-area">
                        <h1><%=type%></h1>
                        <ul>
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li><%=type%></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=====================================-->
    <!--=          Search Box Start         =-->
    <!--=====================================-->
    <section class="bg-accent">
        <div class="container">
            <div class="search-box-wrap-layout3">
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
    <!--=          Product Start         =-->
    <!--=====================================-->
    <section class="product-inner-wrap-layout1 bg-accent">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-8">
                    <div id="product-view" class="product-box-list">
                        <div class="row">
                            <div class="col-xl-4 col-md-6">
                                <div class="product-list-view">
                                    <div class="list-view-layout1">
                                        <%
                                            for (int i = 0; i<eventDAO.getSpecificTypeEvent(type).size();i++){
                                        %>
                                        <div class="product-box-layout3 top-rated-list">
                                            <div class="item-img">
                                            </div>

                                            <div class="product-info">
                                                <div class="item-content">
                                                    <h3 class="item-title">
                                                        <%= eventDAO.getSpecificTypeEvent(type).get(i).getEname()%>
                                                    </h3>
                                                    <p>Venue: <%=buyDAO.VnameofTicket(eventDAO.getSpecificTypeEvent(type).get(i).getEname())%></p>
                                                    <p>Address: <%=eventDAO.getAddressofVenue(eventDAO.getSpecificTypeEvent(type).get(i).getEname())%></p>
                                                    <p>Start Time: <%=buyDAO.TimeofTicket(eventDAO.getSpecificTypeEvent(type).get(i).getEname())%></p>
                                                </div>
                                                <div class="item-right">

                                                    <div class="item-btn">
                                                        <a href="seat.jsp?ename=<%=eventDAO.getSpecificTypeEvent(type).get(i).getEname()%>">Details</a>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
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
    <!--=====================================-->
    <!--=       Modal Start           	 	=-->
    <!--=====================================-->
    <div class="modal fade modal-location" id="modal-location" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close modal-close" data-dismiss="modal" aria-label="Close">
                    <span class="fas fa-times" aria-hidden="true"></span>
                </button>
                <div class="location-list">
                    <h4 class="item-title">Location</h4>
                    <ul>
                        <li><a href="#">California</a></li>
                        <li><a href="#">Kansas</a></li>
                        <li><a href="#">Louisiana</a></li>
                        <li><a href="#">New Jersey</a></li>
                        <li><a href="#">New York</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade modal-location" id="modal-category" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close modal-close" data-dismiss="modal" aria-label="Close">
                    <span class="fas fa-times" aria-hidden="true"></span>
                </button>
                <div class="location-list">
                    <h4 class="item-title">Category</h4>
                    <ul>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category5.png" alt="icon"></span>Business &amp; Industry</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category7.png" alt="icon"></span>Cars &amp; Vehicles</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category14.png" alt="icon"></span>Electronics</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category4.png" alt="icon"></span>Health &amp; Beauty</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category18.png" alt="icon"></span>Hobby, Sport &amp; Kids</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category8.png" alt="icon"></span>Home Appliances</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category6.png" alt="icon"></span>Jobs</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category12.png" alt="icon"></span>Others</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category11.png" alt="icon"></span>Pets &amp; Animals</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category3.png" alt="icon"></span>Property</a>
                        </li>
                        <li>
                            <a href="#"><span class="item-icon"><img src="media/category/category1.png" alt="icon"></span>Services</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

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