<%@ page import="org.hyperledger.fabric.protos.discovery.Protocol" %>
<%@ include file="IncludeGit.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>testing</title>


</head>
<body>
<p>

<%--    <script>--%>
<%--        function a(){--%>
<%--            // location.href=document.referrer||host + "";--%>
<%--            window.open("index.jsp", 600, 600);--%>
<%--        }--%>


<%--        // console.log(document.referrer);--%>
<%--    </script>--%>
    <script>
        var prevUrl = document.referrer;
        sessionStorage.setItem("prevUrl",prevUrl );
    </script>
    <script>
        function re(){

            location.href= "test1.jsp";
        }

    </script>
    <button onclick=re() >click</button>

    <%

//        request.getRequestDispatcher("seat.jsp").forward(request, response);//转发到apage.jsp
//        response.sendRedirect("apage.jsp");//重定向到apage.jsp
    %>

    <%--<%List<event> events=eventDAO.getEvents();--%>
    <%--		for (event e:events){--%>
    <%--			%>--%>

    <%--			<%=e.getEname()%>--%>
    <%--			<p>--%>

    <%--			<%--%>
    <%--			}%>--%>
</body>
</html>