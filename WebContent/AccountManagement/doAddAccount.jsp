<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="dao1.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = (String)session.getAttribute("username");
		AccountManagement am = new AccountManagement();
		String str1 = request.getParameter("accountName");
		String str2 = request.getParameter("accountType");
		String str3 = request.getParameter("keyword");
		String accountName=new String(str1.getBytes("ISO-8859-1"),"utf-8"); 
		String accountType=new String(str2.getBytes("ISO-8859-1"),"utf-8"); 
		
		float startAmount = Float.parseFloat(request.getParameter("startAmount"));
		String keyword = new String(str3.getBytes("ISO-8859-1"),"utf-8");
		if (accountName != null && accountType != null) {
			am.addAccount(accountName, accountType, startAmount, keyword,username);
			RequestDispatcher rd = request.getRequestDispatcher("AccountList.jsp?action=success");
			rd.forward(request, response);
		} else {
			response.sendRedirect("AddAccount.jsp?error=yes");

		}
	%>
</body>
</html>