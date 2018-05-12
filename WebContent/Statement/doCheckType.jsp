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
  String str3 = request.getParameter("start");
  String str4 = request.getParameter("end");
  String str5 = request.getParameter("type");
  String start = new String(str3.getBytes("ISO-8859-1"),"utf-8");
  String end = new String(str4.getBytes("ISO-8859-1"),"utf-8");
  String type = new String(str5.getBytes("ISO-8859-1"),"utf-8");
  
  if(start!=null&&end!=null&&type!=null){
	  System.out.println(start+","+end+","+type+"");
	  response.sendRedirect("Annual.jsp?start="+start+"&end="+end+"&type="+type+"");
  }else{
	  System.out.println("fail");
  }
  %>
</body>
</html>