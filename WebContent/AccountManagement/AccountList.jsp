<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="dao1.AccountManagement"%>
<%@ page language="java" import="entity.Account"%>
<%@ page language="java" import="java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>账户列表</title>
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
				alert("保存成功....");
				window.location.href = "AccountList.jsp";
			</script>
			<%
				}
			%>
		</div>
		<ul class="nav nav-tabs">
			<li class=" dropdown"><a class="dropdown-toggle"
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
				data-toggle="dropdown" href="AddAccount.jsp"> 账户 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="AddAccount.jsp">新增用户</a></li>
					<li><a href="AccountList.jsp">账户列表</a></li>
					<li><a href="MyStock.jsp">我的持股</a></li>
					<li><a href="BuyStock.jsp">买入股票</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="../Statement/Summary"> 账单 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">

					<li><a href="../Statement/Annual.jsp">年度报表</a></li>
					<li><a href="../Statement/Monthly.jsp">月度报表</a></li>
					<li><a href="../Statement/Daily.jsp">按天汇总</a></li>
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
			String name = (String) session.getAttribute("username");

			AccountManagement am = new AccountManagement();
			ArrayList<Account> list = am.getAllAccount(name);
			Iterator<Account> i = list.iterator();
		%>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">账户列表</h3>
			</div>
			<div class="panel-body tab-pane">
				<table class="table table-hover table-striped table-bordered ">

					<thead class="thead-dark">
						<tr>
							<th>账户名称</th>
							<th>账户类型</th>
							<th>开账日期</th>
							<th>当前余额</th>
							<th>关键字</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							while (i.hasNext()) {
								Account a = i.next();
						%>
						<tr>
							<td><%=a.getAccountName()%></td>
							<td><%=a.getAccountType()%></td>
							<td><%=a.getAccount_opening_time()%>
							<td><%=a.getAmount()%></td>
							<td><%=a.getKeyword()%></td>
							<td><a href="Delete.jsp?accountName=<%=a.getAccountName()%>">删除</a>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>


</body>
</html>