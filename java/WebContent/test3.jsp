<%--
  Created by IntelliJ IDEA.
  User: 24393
  Date: 2022/4/14
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="IncludeGit.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
//    user u = (user) session.getAttribute("user");
//    List <String > ticket = new ArrayList<>();
//    ticket = userDAO.getTickets(u.getUname());
//    for (int i = 0;i< ticket.size();i++) {
    int a = 0;
        if (userDAO.CreateUser("tet","123456","000")){
            a = 1;
        }else {
            a = 999;
        }

//    }
%>
<%=a%>
</body>
</html>
