<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="dao1.BudgetManagement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		BudgetManagement bm = new BudgetManagement();
		System.out.println("7");
		if (bm.delete(id)) {
			System.out.println("2");
			response.sendRedirect("BudgetList.jsp?action=success");
		} else {
			System.out.print("fail");
		}
	%>
</body>
</html>