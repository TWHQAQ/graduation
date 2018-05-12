<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page language="java" import="dao1.SystemFunction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
  <%
    response.setCharacterEncoding("utf-8");
    String str1 = request.getParameter("username");
    String str2 = request.getParameter("password");
    String str3 = request.getParameter("email");
    SystemFunction sf = new SystemFunction();
    String username = new String(str1.getBytes("ISO-8859-1"),"utf-8");
    String password = new String(str2.getBytes("ISO-8859-1"),"utf-8");
    String email = new String(str2.getBytes("ISO-8859-1"),"utf-8");
    System.out.print(str1+","+str2);
    if(username!=null&&password!=null){
    	sf.addUser(username,password,email);
    	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    	rd.forward(request, response);
    }else{
    	response.sendRedirect("Register.jsp");
    }
  %>
</body>
</html>