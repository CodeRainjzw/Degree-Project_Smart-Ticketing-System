<%@ page import="javacode.userDAO" %>
<%
//    String url = String.valueOf(request.getParameter("url"));
    Object UserState = session.getAttribute("user");
    if(UserState==null){
%>
    <script>
        var prevUrl = document.referrer;
        sessionStorage.setItem("prevUrl",prevUrl );

        location.href = "login.jsp";
    </script>
<%
//        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    String log_out=request.getParameter("log_out");
    if(log_out!=null && log_out.contentEquals("1")){
        session.removeAttribute("user");
    }
%>


