<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.text.*"%>
<%@ page language="java" import="dao1.AccountManagement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    String username = (String)session.getAttribute("username");
		float cost = Float.parseFloat(request.getParameter("transferAmount"));
	    String str1 = request.getParameter("type");
	    String str2 = request.getParameter("tag");
	    String str3 = request.getParameter("payment");
	    String str4 = request.getParameter("deposit");
		String type = new String(str1.getBytes("ISO-8859-1"),"utf-8");
		String tag = new String(str2.getBytes("ISO-8859-1"),"utf-8");
		String payment = new String(str3.getBytes("ISO-8859-1"),"utf-8");
		String deposit = new String(str4.getBytes("ISO-8859-1"),"utf-8");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate1 = sdf.parse(request.getParameter("tallyTime"));
		java.sql.Date tallyTime = new java.sql.Date(utilDate1.getTime());
		System.out.println(tallyTime + "," + cost + "," + type + "," + tag);
		
		AccountManagement am = new AccountManagement();
		if("1".equals(type)){
			float amount = cost + am.getAmount(deposit, username);
			am.updateAmount(amount, deposit, username);
			response.sendRedirect("Transfer.jsp?action=success");
		}else if("2".equals(type)){
			float amount = am.getAmount(payment, username) - cost;
			am.updateAmount(amount, payment, username);
			response.sendRedirect("Transfer.jsp?action=success");
		}else if("3".equals(type)){
			float amount1 = cost + am.getAmount(deposit, username);
			am.updateAmount(amount1, deposit, username);
			float amount2 = am.getAmount(payment, username) - cost;
			am.updateAmount(amount2, payment, username);
			response.sendRedirect("Transfer.jsp?action=success");
		}else{
			System.out.println("fail");
		}
	%>
</body>
</html>