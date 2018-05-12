<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
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

.summary {
	position: relative;
	top: 50px;
}

.images {
	postion: relative;
	margin-left: auto;
	width: 50%;
	margin-left: auto;
}

.info {
	color: #0066FF;
}

.title {
	font-size: 15px;
	color: #000000;
	font-style: italic;
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
	background="images/ef1e0bf5e59173daaea7b749269f08a4_u=4162235568,3082059186&fm=27&gp=0.jpg">
	<div class="main">
		<div class="page-header">
			<h1>
				<a href="index.jsp">个人理财管理系统</a>
			</h1>

		</div>
		<div class="username">
			<%
				String username = (String) session.getAttribute("username");
				String action = request.getParameter("action");
				if (username == null) {
			%>

			<a href="SystemFunction/login.jsp">请点击登陆</a>&nbsp;&nbsp;/&nbsp; <a
				href="SystemFunction/Register.jsp">注册</a>


			<%
				} else {
			%>
			欢迎登录本系统，<%=username%>
			<%
				}
				if ("success".equals(action)) {
			%>
			<script type="text/javascript" language="javascript">
				alert("密码修改成功....");
				window.location.href = "SystemFunction/login.jsp";
			</script>

			<%
				}
			%>
		</div>
		<ul class="nav nav-tabs">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="BudgetManagement/AddBudget.jsp"> 预算<span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="BudgetManagement/AddBudget.jsp">新增预算</a></li>
					<li><a href="BudgetManagement/BudgetList.jsp">预算列表</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="incomeAndExpenses/KeppAccounts.jsp.jsp">
					收支 <span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="incomeAndExpenses/KeepAccounts.jsp">记一笔账</a></li>
					<li><a href="incomeAndExpenses/Transfer.jsp">转账</a></li>

				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="AccountManagement/AddAccount.jsp">
					账户 <span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="AccountManagement/AddAccount.jsp">新增用户</a></li>
					<li><a href="AccountManagement/AccountList.jsp">账户列表</a></li>
					<li><a href="AccountManagement/MyStock.jsp">我的持股</a></li>
					<li><a href="AccountManagement/BuyStock.jsp">买入股票</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="Statement/Summary"> 账单 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">

					<li><a href="Statement/Annual.jsp">年度报表</a></li>
					<li><a href="Statement/Monthly.jsp">月度报表</a></li>
					<li><a href="Statement/Daily.jsp">按天汇总</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="SystemFunction/Homepage.jsp"> 系统功能<span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="SystemFunction/Homepage.jsp">个人主页</a></li>
					<li><a href="SystemFunction/ChangePassword.jsp">修改密码</a></li>
					<li><a href="SystemFunction/Exit.jsp">退出</a></li>
				</ul></li>
		</ul>
		<br>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><img
					src="images/8831af66208f61bd2cc557561d8f5581_index-3.gif"></td>
				<td>
					<ul class="info">
						<li>是否总是钱花出去了却不知道花在哪里？</li>
						<li>是否总是在存钱但始终存不下来？</li>
						<li>是否总是开销超支而无从控制？</li>
						<li>是否总是忘记按时还信用卡被扣钱扣信用？</li>
						<li>是否觉得每天记账很麻烦，懒得记？</li>
					</ul> <br>
					<h3 class="title">让记账成为一种乐趣，让省钱成为一种习惯！</h3>
				</td>
			</tr>

		</table>
	</div>
</body>
</html>