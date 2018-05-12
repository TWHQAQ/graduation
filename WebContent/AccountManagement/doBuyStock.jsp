<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="dao1.AccountManagement"%>
<%@ page language="java" import="entity.Stock"%>
<%@ page language="java" import="java.sql.Date"%>
<%@ page language="java" import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		request.setCharacterEncoding("utf-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
		AccountManagement am = new AccountManagement();
		Stock s = new Stock();
		
		String str1 = request.getParameter("stockCode");
		String str2 = request.getParameter("stockName");
		String str3 = request.getParameter("accountName");
        String username = (String)session.getAttribute("username");
		java.util.Date utilDate2 = sdf.parse(request.getParameter("buyDate"));
		java.sql.Date buyDate = new java.sql.Date(utilDate2.getTime());
		float cost = Float.parseFloat(request.getParameter("cost"));
		
		String stockCode = new String(str1.getBytes("ISO-8859-1"),"utf-8");
		String stockName = new String(str2.getBytes("ISO-8859-1"),"utf-8");
		String accountName = new String(str3.getBytes("ISO-8859-1"),"utf-8");
		
		
		System.out.println(stockCode+","+stockName+","+buyDate+","+cost+","+accountName);
		s.setAccountName(accountName);
		s.setBuyDate(buyDate);
		s.setCost(cost);
		s.setStockCode(stockCode);
		s.setStockName(stockName);
		s.setUsername(username);
		
		
		float amount = am.getAmount(accountName, username) - cost;
		System.out.println(username);
		if (am.addStock(s)) {
			am.updateAmount(amount, accountName, username);
			response.sendRedirect("BuyStock.jsp?action=success");
		} else {
			System.out.print("fail");
		}
	%>
</body>
</html>