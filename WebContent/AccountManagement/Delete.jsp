<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page language="java" import="dao1.AccountManagement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		AccountManagement am = new AccountManagement();
		String str1 = request.getParameter("accountName");

		String accountName = new String(str1.getBytes("ISO-8859-1"), "utf-8");
		String username = (String)session.getAttribute("username");
		System.out.print("1");
		System.out.println(accountName + "," + username);
		if (am.delete(accountName, username)) {
			System.out.print("2");
			response.sendRedirect("AccountList.jsp");
			System.out.print("3");
		} else {
			System.out.print("fail");
		}
	%>
</body>
</html>