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
     
     String str1 = request.getParameter("start");
     String str2 = request.getParameter("end");
     String startDate = new String(str1.getBytes("ISO-8859-1"),"utf-8");
     String endDate = new String(str2.getBytes("ISO-8859-1"),"utf-8");
     
     
     if(startDate!=null&&endDate!=null){
    	 response.sendRedirect("Annual.jsp?startDate="+startDate+"&endDate="+endDate+"");
     }else{
    	 System.out.println("fail");
     }
   %>
</body>
</html>