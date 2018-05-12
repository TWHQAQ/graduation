<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="entity.Budget"%>
<%@ page language="java" import="dao1.BudgetManagement"%>
<%@ page language="java" import="java.text.*"%>

<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String username = (String)session.getAttribute("username");
		BudgetManagement bm = new BudgetManagement();
		Budget b = new Budget();

		java.util.Date utilDate1 = sdf.parse(request.getParameter("BudgetEnd"));
		java.util.Date utilDate2 = sdf.parse(request.getParameter("BudgetStart"));
		java.sql.Date sqlDate1 = new java.sql.Date(utilDate1.getTime());
		java.sql.Date sqlDate2 = new java.sql.Date(utilDate2.getTime());
		b.setBudgetEnd(sqlDate1);
		b.setBudgetStart(sqlDate2);
		System.out.println(sqlDate1+","+sqlDate2);
		b.setFood(Float.parseFloat(request.getParameter("food")));
		b.setBooks(Float.parseFloat(request.getParameter("books")));
		b.setCashGift(Float.parseFloat(request.getParameter("cashGift")));
		b.setCommunication(Float.parseFloat(request.getParameter("communication")));
		b.setEntertainment(Float.parseFloat(request.getParameter("entertainment")));
		b.setHousingLoan(Float.parseFloat(request.getParameter("housingLoan")));
		b.setMedicine(Float.parseFloat(request.getParameter("medicine")));
		b.setSport(Float.parseFloat(request.getParameter("sport")));
		b.setTourism(Float.parseFloat(request.getParameter("tourism")));
		b.setTraffic(Float.parseFloat(request.getParameter("traffic")));
		b.setClothing(Float.parseFloat(request.getParameter("clothing")));
		b.setUsername(username);
		
		if (bm.addBudget(b)) {
			response.sendRedirect("AddBudget.jsp?action=success");
		} else {
			System.out.println("fail");
		}
	%>
</body>
</html>