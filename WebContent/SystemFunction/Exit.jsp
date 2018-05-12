<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="dao1.SystemFunction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>退出界面</title>
</head>
<body>
  <%
    
    session.setAttribute("username", null);
    response.sendRedirect("../index.jsp");
  %>
</body>
</html>