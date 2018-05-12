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
		Tally t = new Tally();
		IncomesAndExpenses iae = new IncomesAndExpenses();
		AccountManagement am = new AccountManagement();

		String username = (String) session.getAttribute("username");
		float tallyAmount = Float.parseFloat(request.getParameter("tallyAmount"));
		String str1 = request.getParameter("tallyAccount");
		String str2 = request.getParameter("tallyType");
		String str3 = request.getParameter("tag");
		String tallyAccount = new String(str1.getBytes("ISO-8859-1"), "utf-8");
		String tallyType = new String(str2.getBytes("ISO-8859-1"), "utf-8");
		String tag = new String(str3.getBytes("ISO-8859-1"), "utf-8");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate1 = sdf.parse(request.getParameter("tallyTime"));
		java.sql.Date tallyTime = new java.sql.Date(utilDate1.getTime());
		System.out.println(tallyTime);

		t.setTag(tag);
		t.setTallyAccount(tallyAccount);
		t.setTallyAmount(tallyAmount);
		t.setTallyTime(tallyTime);
		t.setTallyType(tallyType);
		t.setUsername(username);
		
		float amount = am.getAmount(tallyAccount, username);
		if ("工资".equals(tallyType) || "转账".equals(tallyType) || "股票卖出".equals(tallyType)) {
			t.setFlag(1);
			amount = amount + tallyAmount;
		} else {
			t.setFlag(0);
			amount = amount - tallyAmount;
		}
		int n = 0;
		ArrayList<Tally> list = iae.getAllTally(username);
		Iterator<Tally> i = list.iterator();
		while (i.hasNext()) {
			Tally tally = i.next();
			if (tally.getTallyTime().equals(tallyTime)) {
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
		
		BudgetManagement bm = new BudgetManagement();
		ArrayList<Budget> list1 = bm.getAllBudget(username);
		Iterator<Budget> i1 = list1.iterator();
		while(i1.hasNext()){
			Budget b = i1.next();
			if(tallyTime.after(b.getBudgetStart())&&tallyTime.before(b.getBudgetEnd())){
				float margin = b.getAllAmount()-iae.getExpenseByDate(username, b.getBudgetStart(), b.getBudgetEnd());
				if(margin<0){
					System.out.println("yes");
					session.setAttribute("warn", "yes");
					break;
				}
			}
		}
		
		if (iae.addTally(t)) {
			am.updateAmount(amount, tallyAccount, username);

			System.out.println(username);
			response.sendRedirect("KeepAccounts.jsp?action=success");
		} else {
			System.out.println("fail");
		}
	%>
</body>
</html>