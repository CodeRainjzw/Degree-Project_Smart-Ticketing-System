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
    <title>Market</title>
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
    <section class="inner-page-banner" data-bg-image="picture/showmytickets.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumbs-area">
                        <h1>Market</h1>
                        <ul>
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>Market</li>
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
                                            for (int i = 0; i<sellDAO.getSellingTickets().size();i++){
                                        %>
                                        <div class="product-box-layout3 top-rated-list">
                                            <div class="item-img">
                                            </div>

                                            <div class="product-info">
                                                <div class="item-content">
                                                    <h3 class="item-title"><a href="single-product1.html">
                                                        <%= wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"ename")%>
                                                    </a></h3>
                                                    <p>Start Time: <%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"etime")%></p>
                                                    <p>Seat Number: <%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"seatnum")%></p>
                                                    <p>Price: <%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"price")%></p>
                                                    <p>Venue Name: <%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"vname")%></p>
                                                    <p>Address: <%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"address")%></p>

                                                </div>
                                                <div class="item-right">
                                                    <%
                                                        String seller = buysellingDAO.getSeller(sellDAO.getSellingTickets().get(i));
                                                        int hash = userDAO.getIDofTicket(seller,sellDAO.getSellingTickets().get(i));
                                                        if (session.getAttribute("user")!=null) {
                                                            user u = (user) session.getAttribute("user");
                                                            if (!sellDAO.check(u.getUname(),userDAO.getHashbyinfo(sellDAO.getSellingTickets().get(i)))){
                                                    %>
                                                    <div class="item-btn">
                                                        <a href="Sell.jsp?hash=<%=userDAO.getIDofTicket(u.getUname(),sellDAO.getSellingTickets().get(i))%>">Change My Price</a>
                                                    </div>
                                                    <%
                                                        }else {
                                                    %>

                                                    <div class="item-btn">
                                                        <a href="ConfirmTicket.jsp?eventname=<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"ename")%>&number=<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"seatnum")%>&<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"seatnum")%>=<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"seatnum")%>&type=<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"price")%>&hash=<%=hash%>&seller=<%=seller%>">Buy</a>
                                                    </div>
                                                    <%
                                                        }
                                                        }else {
                                                    %>
                                                    <div class="item-btn">
                                                        <a href="ConfirmTicket.jsp?eventname=<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"ename")%>&number=<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"seatnum")%>&<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"seatnum")%>=<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"seatnum")%>&type=<%=wallet.getValuebyKey( sellDAO.getSellingTickets().get(i),"price")%>&hash=<%=hash%>&seller=<%=seller%>">Buy</a>
                                                    </div>
                                                    <%
                                                        }
                                                    %>
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