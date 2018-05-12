<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="entity.*"%>
<%@ page language="java" import="java.text.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="dao1.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		AccountManagement am = new AccountManagement();
		String username = (String) session.getAttribute("username");
		Account a = new Account();
		
		String stockCode = request.getParameter("stockCode");
		String str = request.getParameter("accountName");
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(d);
		java.sql.Date time = java.sql.Date.valueOf(date);
		String accountName = new String(str.getBytes("ISO-8859-1"),"utf-8");
		float amount = Float.parseFloat(request.getParameter("amount"));
		
		Tally t = new Tally();
		t.setFlag(1);
		t.setTallyAccount(accountName);
		t.setTallyAmount(amount);
		t.setTallyType("stock");
		t.setUsername(username);
		t.setTallyTime(time);
		System.out.println(time);
		IncomesAndExpenses iae = new IncomesAndExpenses();
		ArrayList<Tally> list = iae.getAllTally(username);
		Iterator<Tally> i = list.iterator();
		int n = 0;
		while (i.hasNext()) {
			Tally tally = i.next();
			if (tally.getTallyTime().equals(time)) {
				n = 1;
				break;
			} else {
				n = 2;
			}
		}
		if (n == 1) {
			System.out.println("7");
			iae.addExpense(t);
		} else if (n == 2) {
			System.out.println("8");
			iae.addNewExpense(t);
		} else {
			System.out.println("n值错误");
		}
		if(iae.addTally(t)){
			System.out.println("success");
		}else{
			System.out.println("fail");
		}
		
		amount = amount + am.getAmount(accountName, username);
		if (am.saleStock(stockCode, username)) {
			am.updateAmount(amount, accountName, username);			
			response.sendRedirect("MyStock.jsp");
		} else {
			System.out.print("fail");
		}
	%>
</body>
</html>