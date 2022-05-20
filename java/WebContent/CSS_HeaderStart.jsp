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
                        <ul>
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                <a href="event.jsp">All events</a>
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
                                <a href="login.jsp" class="item-btn"><i class="fas fa-plus"></i>Log In/Out</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
