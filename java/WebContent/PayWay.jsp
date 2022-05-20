<%@ page import="javax.swing.*" %>
<%@ include file="IncludeGit.jsp"%>
<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Pay Way</title>
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

<%
    int seatNum = Integer.valueOf(request.getParameter("number"));
    String ename = String.valueOf(request.getParameter("eventname"));


%>
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
                        <h1>Pay Way</h1>
                                                <ul>
                                                    <li>
                                                        <a href="index.jsp">Home</a>
                                                    </li>
                                                    <li>Confirm Ticket</li>
                                                    <li>Pay Way</li>
                                                </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=====================================-->
    <!--=        Faq Page Start      		=-->
    <!--=====================================-->
    <%
        user u = (user) session.getAttribute("user");
        List<Integer> seatid=new ArrayList<>();
        for (int i = 1;i<=seatNum;i++) {
            String s= String.valueOf(i);
            String result = request.getParameter(s);
            if (result!=null){
//                buyDAO.buyTicket(i,ename,u.getUname());
                seatid.add(i);
            }
        }
        float price=Float.valueOf(request.getParameter("price"));
    %>
    <section class="section-padding-equal-70 bg-accent">
        <div class="container">
            <div class="error-page-box-layout1">
                <h2 class="item-title">Please choose your way to pay.</h2>
                <form action="MidBuy.jsp" method="post" id="wallet">
                    <input name="number" value="<%=seatNum%>" type="hidden">
                    <input name="eventname" value="<%=ename%>" type="hidden">
                    <input name="payway" value="wallet" type="hidden">
                    <input type="hidden" value="<%=price%>" name="price">
                    
                    <%
                        for (int i = 0 ;i<seatid.size();i++){
                    %>
                    <input name="<%=seatid.get(i)%>" value="<%=seatid.get(i)%>" type="hidden">
                    <%
                        }
                    %>
                </form>
                    <a href="#" class="error-btn" onclick="document.getElementById('wallet').submit();return false;">&nbsp;&nbsp;&nbsp;&nbsp;Pay with my wallet&nbsp;&nbsp;&nbsp;&nbsp;</a>
                <h4> </h4>
                <form action="CreditCard.jsp" method="post" id="card">
                    <input name="number" value="<%=seatNum%>" type="hidden">
                    <input name="eventname" value="<%=ename%>" type="hidden">
                    <input type="hidden" value="<%=price%>" name="price">

                    <%
                        for (int i = 0 ;i<seatid.size();i++){
                    %>
                    <input name="<%=seatid.get(i)%>" value="<%=seatid.get(i)%>" type="hidden">
                    <%
                        }
                    %>
                </form>
                    <a href="#" class="error-btn" onclick="document.getElementById('card').submit();return false;">Pay with my credit card</a>


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