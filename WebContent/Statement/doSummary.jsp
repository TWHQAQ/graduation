<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
  <%
    String str = request.getParameter("date");
    String date = new String(str.getBytes("ISO-8859-1"),"utf-8");
    
    if(date!=null){
    	response.sendRedirect("Summary.jsp?date="+date+"");
    }System.out.println("fail");
  %>
</body>
</html>