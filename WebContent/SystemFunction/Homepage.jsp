<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page language="java" import="dao1.*"%>
<%@page language="java" import="entity.*"%>
<%@page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人主页</title>
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
	width: 70%;
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

th {
	text-align: center;
}

td {
	text-align: center;
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
				window.location.href = "login.jsp";
			</script>

			<%
				} else {
			%>
			欢迎登陆本系统，<%=username%>
			<%
				}
			%>
		</div>
		<ul class="nav nav-tabs">
			<li class="active dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="../BudgetManagement/AddBudget.jsp">
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
				data-toggle="dropdown" href="../Statement/Summary"> 账单 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					
					<li><a href="../Statement/Annual">年度报表</a></li>
					<li><a href="../Statement/Monthly.jsp">月度报表</a></li>
					<li><a href="../Statement/Daily.jsp">按天汇总</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="../SystemFunction/Homepage.jsp">
					系统功能<span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="Homepage.jsp">个人主页</a></li>
					<li><a href="ChangePassword.jsp">修改密码</a></li>
					<li><a href="Exit.jsp">退出</a></li>
				</ul></li>
		</ul>
		<br>
		<%
			SystemFunction sf = new SystemFunction();
			User u = sf.getUserByUsername(username);
		%>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">个人主页</h3>
			</div>
			<div class="panel-body">
				<div class="col-md-5">
					<table class="table col-md-4">
						<tr>
							<td><b>用户名：</b></td>
							<td><%=username%></td>
						</tr>
						<tr>
							<td><b>邮箱地址：</b></td>
							<td><%=u.getEmail()%></td>
						</tr>
						<tr>
							<td><b>注册时间：</b></td>
							<td><%=u.getRegister_time()%></td>
						</tr>
					</table>
				</div>
				<br>
				<%
					AccountManagement am = new AccountManagement();
					ArrayList<Account> list1 = am.getAllAccount(username);
					BudgetManagement bm = new BudgetManagement();
					ArrayList<Budget> list2 = bm.getAllBudget(username);
					IncomesAndExpenses iae = new IncomesAndExpenses();
					ArrayList<Tally> list3 = iae.getAllTally(username);
					Iterator<Account> i1 = list1.iterator();
					Iterator<Budget> i2 = list2.iterator();
					Iterator<Tally> i3 = list3.iterator();
					float amount1 = 0;
					float amount2 = 0;
					float amount3 = 0;
					while (i1.hasNext()) {
						Account a = i1.next();
						amount1 += a.getAmount();
					}
					while (i2.hasNext()) {
						Budget b = i2.next();
						amount2 += b.getAllAmount();
					}
					while (i3.hasNext()) {
						Tally t = i3.next();

						amount3 += t.getTallyAmount();
					}
					System.out.println(amount3);
				%>
				<table class="table ">
					<thead>
						<th colspan="3">默认账本</th>
					</thead>
					<tbody>
						<tr>
							<td>账户：</td>
							<td>共<%=list1.size()%>项 &nbsp;&nbsp;总计<%=amount1%>元
							</td>
							<td><a href="../AccountManagement/AccountList.jsp">查看详情</a></td>
						</tr>
						<tr>
							<td>记账：</td>
							<td>共<%=list3.size()%>笔 &nbsp;&nbsp;总计<%=amount3%>元
							</td>
							<td><a href="../Statement/Annual.jsp">查看详情</a></td>
						</tr>
						<tr>
							<td>预算：</td>
							<td>共<%=list2.size()%>项 &nbsp;&nbsp;总计<%=amount2%>元
							</td>
							<td><a href="../BudgetManagement/BudgetList.jsp">查看详情</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>