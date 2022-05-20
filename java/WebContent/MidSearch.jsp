<%--
  Created by IntelliJ IDEA.
  User: 24393
  Date: 2022/3/31
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="IncludeGit.jsp"%>
<html>
<head>
    <title>Event</title>
</head>
<body>
    <%
        String keyword = String.valueOf(request.getParameter("keyword"));
        if (!keyword.equals(null)){
            response.sendRedirect("event_exactly.jsp?keyword="+keyword);
    %>
    <%
        }
        else {
    %>
    <div> failed </div>
    <%=keyword%>
    <%
        }
    %>

</body>
</html>
