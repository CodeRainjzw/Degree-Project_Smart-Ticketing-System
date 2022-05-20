
<%@ include file="IncludeGit.jsp"%>


<%--
  Created by IntelliJ IDEA.
  User: 24393
  Date: 2022/3/24
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Seat</title>
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
    <%@ include file="CSS_HeaderStart.jsp"%>
    <!--=====================================-->
    <!--=        Inner Banner Start         =-->
    <!--=====================================-->
    <section class="inner-page-banner" data-bg-image="picture/seat.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumbs-area">
                        <h1>Choose the Venue and Seat.</h1>
                        <ul>
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>Choose Seat</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=====================================-->
    <!--=          Product Start         =-->
    <!--=====================================-->
    <section class="single-product-wrap-layout1 section-padding-equal-70 bg-accent">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-8">
                    <div class="single-product-box-layout1">
                        <div class="item-google-map light-shadow-bg">
                            <%
                                String ename = request.getParameter("ename");
                                int seatid = 0;
                            %>
                            <h3 class="widget-border-title">Choose the seat</h3>
                            <div class="google-map light-box-content">

                                <div id="googleMap" class="google-map" style="width: 100%; height: 460px;">
                                    <ul class="showcase">
                                        <li>
                                            <div class="seat"></div>
                                            <small>Available</small>
                                        </li>
                                        <li>
                                            <div class="seat seatshow"></div>
                                            <small>Selected</small>
                                        </li>
                                        <li>
                                            <div class="seat occupied"></div>
                                            <small>Occupied</small>
                                        </li>
                                    </ul>

                                    <div class="seat-container">
                                            <div>
                                                <%
                                                    int seatNum = eventDAO.getNumberofSeat(ename);
                                                    int seatRow = (int) Math.round(Math.sqrt(seatNum));
                                                    int seatCol = (int) Math.ceil(Math.sqrt(seatNum));
                                                %>
                                                <script>
                                                    var price=0;
                                                    var seatid=new Array();
                                                </script>
                                            </div>
    <form action="ConfirmTicket.jsp" method="post">
                                            <div class="seat-block">

                                                <%
                                                    int n=1;
                                                    for (int i = 0;i<seatRow;i++){
                                                %>
                                                <div class="row">
                                                    <%
                                                        for (int j = 0;j<seatCol;j++){
                                                            if (ticketDAO.getSeatofTicketStatus(ename)[n] == 0){
                                                    %>
                                                    <div class="seat occupied" id="<%=n%>"></div>
                                                    <%
                                                            }
                                                            else {
                                                    %>
                                                    <script>
                                                        function myFunction(a) {
                                                            var b = "input"+a;
                                                            if (document.getElementById(b).checked===true){
                                                                document.getElementById(b).checked=false;
                                                                // document.getElementById(a).style.background="#b4c1c2";
                                                                document.getElementById(a).classList.remove("selected");
                                                                price = parseFloat(price)-parseFloat(document.getElementById(a).getAttribute("price"));
                                                                document.getElementById("price").innerText = price;

                                                                seatid.forEach((item, i) => {
                                                                    if (item === document.getElementById(b).getAttribute("name")) {
                                                                        seatid.splice(i, 1);
                                                                    }
                                                                })
                                                                document.getElementById("seatid").innerText = seatid;

                                                            }else {
                                                                document.getElementById(b).checked=true;
                                                                // document.getElementById(a).style.background="salmon";
                                                                document.getElementById(a).classList.add("selected");

                                                                price = parseFloat(document.getElementById(a).getAttribute("price"))+parseFloat(price);
                                                                document.getElementById("price").innerText = price;

                                                                seatid.push(document.getElementById(b).getAttribute("name"));
                                                                document.getElementById("seatid").innerText = seatid;
                                                            }



                                                        }
                                                    </script>
                                                    <div class="seat" onclick="myFunction(<%=n%>)" id="<%=n%>" price="<%=buyDAO.PriceofTicket(ename,n)%>">
                                                        <input type="checkbox" id="input<%=n%>" name="<%=n%>" style="display:none" >
                                                    </div>

                                                    <%
                                                            }
                                                    %>

                                                    <%
                                                            n++;
                                                        }
                                                    %>
                                                </div>
                                                <%
                                                    }
                                                %>
                                                    <input type="hidden" value="<%=seatNum%>" name="number">
                                                    <input type="hidden" value="<%=ename%>" name="eventname">



                                            </div>

        <div class="button-buy">
            <input type="hidden" value="seat.jsp" name="url">
            <button class="buy" type="submit"  >Buy</button>
        </div>
    </form>

                                    </div>
                                </div>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-9">
                                                <div class="tab-content">
                                                    <div class="tab-pane fade show active" id="dashboard" role="tabpanel">
                                                        <div class="myaccount-dashboard light-shadow-bg">
                                                            <div class="light-box-content">
                                    <div class="media-box">
                                        <div class="item-content">
                                            <h1 class="item-title"></h1>
                                        </div>
                                    </div>
                                    <div class="static-report">
                                        <h3 class="report-title">Ticket(s) Information</h3>
                                        <div class="report-list">
                                            <div class="report-item">
                                                <label>Seat id:</label>
                                                <div class="item-value" id="seatid">0</div>
                                            </div>
                                        </div>
                                        <div class="report-list">
                                            <div class="report-item">
                                                <label>All Price:</label>
                                                <div class="item-value" id="price">0</div>
                                            </div>
                                        </div>
                                        <div class="report-list">
                                            <div class="report-item">
                                                <label>Start Time:</label>
                                                <div class="item-value"><%=buyDAO.TimeofTicket(ename)%></div>
                                            </div>
                                        </div>
                                        <div class="report-list">
                                            <div class="report-item">
                                                <label>Venue Name:</label>
                                                <div class="item-value"><%=buyDAO.VnameofTicket(ename)%></div>
                                            </div>
                                        </div>
                                        <div class="report-list">
                                            <div class="report-item">
                                                <label>Venue Address:</label>
                                                <div class="item-value"><%=eventDAO.getAddressofVenue(ename)%></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
    <!-- Author Mail Box -->
    <div class="modal fade author-mail-box" id="author-mail" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="#">
                        <div class="form-group">
                            <input type="text" class="form-control" name="name" id="name" placeholder="Name*">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" id="email" placeholder="Email*">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control textarea" placeholder="Message*" name="message" id="form-message" cols="10" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit">
                                Submit
                            </button>
                        </div>
                    </form>
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