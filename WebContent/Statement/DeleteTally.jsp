<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page language="java" import="dao1.IncomesAndExpenses"%>
    <%@page language="java" import="dao1.AccountManagement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
  <%
    IncomesAndExpenses iae = new IncomesAndExpenses();
    AccountManagement am = new AccountManagement();
    String username = (String)session.getAttribute("username");
    String accountName = request.getParameter("account");
    int id = Integer.parseInt(request.getParameter("id"));
    
    int expenseId = Integer.parseInt(request.getParameter("expenseId"));
    String str = request.getParameter("type");
    String type = new String(str.getBytes("ISO-8859-1"),"utf-8");
    float amount = am.getAmount(accountName, username);
    if(iae.deleteByID(id)){
    	iae.updateByID(expenseId, type);
    	am.updateAmount(amount, accountName, username);
    	response.sendRedirect("Daily.jsp");
    }else{
    	System.out.println("fail");
    }
  %>
</body>
</html>