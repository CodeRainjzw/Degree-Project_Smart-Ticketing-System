<%--
  Created by IntelliJ IDEA.
  User: 24393
  Date: 2022/4/6
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import=" java.io.IOException"%>
<%@ page import=" java.security.NoSuchAlgorithmException"%>
<%@ page import=" java.sql.Connection"%>
<%@ page import=" java.sql.PreparedStatement"%>
<%@ page import=" java.sql.ResultSet"%>
<%@ page import=" java.sql.SQLException"%>
<%@ page import=" java.sql.Statement"%>

<%@ page import="java.util.List" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="org.hyperledger.fabric.gateway.Contract" %>
<%@ page import="org.hyperledger.fabric.gateway.Gateway" %>
<%@ page import="org.hyperledger.fabric.gateway.Network" %>
<%@ page import="org.hyperledger.fabric.gateway.Wallet" %>
<%@ page import="org.hyperledger.fabric.gateway.Wallets" %>

<%@ page import="javacode.ClientApp" %>
<%@ page import="javacode.event" %>
<%@ page import="javacode.eventDAO" %>
<%@ page import="javacode.buyDAO" %>
<%@ page import="javacode.ticketDAO" %>
<%@ page import="javacode.user" %>
<%@ page import="javacode.userDAO" %>
<%@ page import="javacode.ticket" %>
<%@ page import="javacode.analysisQRcode" %>
<%@ page import="javacode.generateQRcode" %>
<%@ page import="javacode.cancelDAO" %>
<%@ page import="javacode.venue" %>
<%@ page import="javacode.transferDAO" %>
<%@ page import="javacode.wallet" %>
<%@ page import="javacode.JDBCTool" %>
<%@ page import="javacode.validateDAO" %>
<%@ page import="javacode.sellDAO" %>
<%@ page import="javacode.payDAO" %>
<%@ page import="javacode.buysellingDAO" %>


<%@ page import="com.google.gson.JsonObject"%>
