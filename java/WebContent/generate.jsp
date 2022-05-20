<%@ page import="org.hyperledger.fabric.protos.discovery.Protocol" %>
<%@ page import="javacode.generateQRcode"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="org.apache.commons.codec.binary.Base64"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="java.awt.*"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.awt.geom.*"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="java.io.*"%>
<%@ page import="org.hyperledger.fabric.sdk.User" %>

<%@ include file="IncludeGit.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>QRcode</title>


</head>
<body>
<p>
<%
    user u = (user) session.getAttribute("user");
	int hash = Integer.valueOf(request.getParameter("hash"));
	String content = validateDAO.generateString(u.getUname(),hash);
	BufferedImage image=generateQRcode.generateQRcodePictest(content, 300, 300, "jpg",String.valueOf(hash));
	response.reset();
	response.setContentType("image/jpg");
	ImageIO.write(image,"jpg",response.getOutputStream());
%>
</body>
</html>