<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page language="java" import="dao1.IncomesAndExpenses"%>
<%@page language="java" import="java.util.*"%>
<%@page language="java" import="java.text.*"%>
<%@page language="java" import="entity.Tally"%>
<%@page language="java" import="entity.Expense"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>月度报表</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.main {
	margin-left: auto;
	margin-right: auto;
	width: 75%;
}

.login {
	position: relative;
	top: 50px;
	margin-right: auto;
}

.page-header {
	font-family: STXingkai;
	color: #0066FF;
}

.username {
	float: right;
	font-family: KaiTi;
	font-weight: bold;
	font-size: 17px;
	margine-right: auto;
	color: #4682B4;
}
</style>

</head>
<body
	background="../images/ef1e0bf5e59173daaea7b749269f08a4_u=4162235568,3082059186&fm=27&gp=0.jpg">
	<div class="main">
		<div class="page-header">
			<h1>
				<a href="../index.jsp">个人理财管理系统</a>
			</h1>
		</div>
		<div class="username">
			<%
				String username = (String) session.getAttribute("username");
				if (username == null) {
			%>
			<script type="text/javascript" language="javascript">
				alert("本系统登陆后才能使用，请登录或注册....");
				window.location.href = "../SystemFunction/login.jsp";
			</script>

			<%
				} else {
			%>
			欢迎登陆本系统，<%=username%>
			<%
				}
			%>
			<%
				request.setCharacterEncoding("utf-8");
				String action = request.getParameter("action");
				if ("success".equals(action)) {
			%>
			<script type="text/javascript" language="javascript">
				alert("删除成功...");
				window.location.href = "BudgetList.jsp";
			</script>
			<%
				}
			%>
		</div>
		<ul class="nav nav-tabs">
			<li class=" dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="../BudgetManagemenet/AddBudget.jsp">
					预算<span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="../BudgetManagement/AddBudget.jsp">新增预算</a></li>
					<li><a href="../BudgetManagement/BudgetList.jsp">预算列表</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown"
				href="../incomeAndExpenses/KeppAccounts.jsp.jsp"> 收支 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="../incomeAndExpenses/KeepAccounts.jsp">记一笔账</a></li>
					<li><a href="../incomeAndExpenses/Transfer.jsp">转账</a></li>

				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="../AccountManagement/AddAccount.jsp">
					账户 <span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="../AccountManagement/AddAccount.jsp">新增用户</a></li>
					<li><a href="../AccountManagement/AccountList.jsp">账户列表</a></li>
					<li><a href="../AccountManagement/MyStock.jsp">我的持股</a></li>
					<li><a href="../AccountManagement/BuyStock.jsp">买入股票</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="Summary"> 账单 <span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					
					<li><a href="Annual.jsp">年度报表</a></li>
					<li><a href="Monthly.jsp">月度报表</a></li>
					<li><a href="Daily.jsp">按天汇总</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="../SystemFunction/Homepage.jsp">
					系统功能<span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="../SystemFunction/Homepage.jsp">个人主页</a></li>
					<li><a href="../SystemFunction/ChangePassword.jsp">修改密码</a></li>
					<li><a href="../SystemFunction/Exit.jsp">退出</a></li>
				</ul></li>
		</ul>
		<br>
		<%
			IncomesAndExpenses iae = new IncomesAndExpenses();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			Date d = new Date();
			String date = sdf1.format(d);
			String date2 = request.getParameter("date");
			if(date2==null){				
				date2 = sdf2.format(d);
			}
			ArrayList<Expense> list = iae.getTallyExpenseByMonth(username, date2);
			Iterator<Expense> i = list.iterator();
		%>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">月度报表</h3>
			</div>
			<br>
			<div class="info">
				<div class="col-md-3">
					&nbsp;&nbsp;&nbsp;&nbsp;当前月份：<%=date%>
				</div>
				<form action="doMonthly.jsp">
					<div class="col-md-5">

						<label for="select">选择查询月份： </label><input type="date" id="select"
							name="date" value=<%=date2%>>
						<button type="submit" class="btn btn-default">查询</button>
					</div>
				</form>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>年/月/日</th>
							<th>收入合计</th>
							<th>支出合计</th>
							<th>总计(盈余)</th>
						</tr>
					</thead>
					<tbody>
						<%
							while (i.hasNext()) {
								Expense e = i.next();
						%>
						<tr>
							<td><a href="Daily.jsp?date=<%=e.getExpenseDate()%>"><%=e.getExpenseDate()%></a></td>
							<td><%=e.getIncome()%></td>
							<td><%=e.getExpense()%></td>
							<%
								float amount = e.getIncome() - e.getExpense();
									if (amount < 0) {
							%>
							<td><font color="red"><%=amount%></font></td>
							<%
								} else {
							%>
							<td><font color="blue"><%=amount%></font></td>
							<%
								}
							%>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>