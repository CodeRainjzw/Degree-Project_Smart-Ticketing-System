<%--
  Created by IntelliJ IDEA.
  User: 24393
  Date: 2022/4/13
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    function re(){
        var a = sessionStorage.getItem("prevUrl");
        if (a!=null){
            location.href= a;
        }else {
            location.href = "index.jsp";
        }

    }

</script>
<button onclick=re() >click</button>
</body>
</html>
