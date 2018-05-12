<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.Date"%>
<%@ page language="java" import="entity.Budget"%>
<%@ page language="java" import="dao1.BudgetManagement"%>
<%@ page language="java" import="java.util.Iterator"%>
<%@ page language="java" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看预算</title>
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
	font-family:KaiTi;
	font-weight:bold;
	font-size: 17px;
	margine-right: auto;
	color:#4682B4 ;
}
</style>

</head>
<body background="../images/ef1e0bf5e59173daaea7b749269f08a4_u=4162235568,3082059186&fm=27&gp=0.jpg">
	<div class="main">
		<div class="page-header">
			<h1><a href="../index.jsp">个人理财管理系统</a></h1>
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
		</div>
		<ul class="nav nav-tabs">
			<li class=" dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="AddBudget.jsp"> 预算<span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="AddBudget.jsp">新增预算</a></li>
					<li><a href="BudgetList.jsp">预算列表</a></li>
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
			int id = Integer.parseInt(request.getParameter("id"));
			BudgetManagement bm = new BudgetManagement();
			Budget b = bm.getAllBudgetByID(id);
			Date d1 = b.getBudgetStart();
			Date d2 = b.getBudgetEnd();
		%>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">查看预算</h3>
			</div>
			<br>
			<div class="info">
				&nbsp;&nbsp;&nbsp;&nbsp;
				起始日期:<%=b.getBudgetStart()%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
				截止日期:<%=b.getBudgetEnd()%>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>类型</th>
							<th>预算支出</th>
							<th>实际支出</th>
							<th>节约</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>书籍</td>
							<td><%=b.getBooks() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "books") %></td>
							<td><%=b.getBooks()-bm.getSumByType(username, d1, d2, "books") %></td>
						</tr>
						<tr>
							<td>礼金</td>
							<td><%=b.getCashGift() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "cashGift") %></td>
							<td><%=b.getCashGift()-bm.getSumByType(username, d1, d2, "cashGift") %></td>
						</tr>
						<tr>
							<td>服装</td>
							<td><%=b.getClothing() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "clothing") %></td>
							<td><%=b.getClothing()-bm.getSumByType(username, d1, d2, "clothing") %></td>
						</tr>
						<tr>
							<td>通讯</td>
							<td><%=b.getCommunication() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "communication") %></td>
							<td><%=b.getCommunication()-bm.getSumByType(username, d1, d2, "communication") %></td>
						</tr>
						<tr>
							<td>休闲娱乐</td>
							<td><%=b.getEntertainment() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "entertainment") %></td>
							<td><%=b.getEntertainment()-bm.getSumByType(username, d1, d2, "entertainment") %></td>
						</tr>
						<tr>
							<td>餐饮食品</td>
							<td><%=b.getFood() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "food") %></td>
							<td><%=b.getFood()-bm.getSumByType(username, d1, d2, "food") %></td>
						</tr>
						<tr>
							<td>房贷</td>
							<td><%=b.getHousingLoan() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "housingLoan") %></td>
							<td><%=b.getHousingLoan()-bm.getSumByType(username, d1, d2, "housingLoan") %></td>
						</tr>
						<tr>
							<td>医疗保健</td>
							<td><%=b.getMedicine() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "medicine") %></td>
							<td><%=b.getMedicine()-bm.getSumByType(username, d1, d2, "medicine") %></td>
						</tr>
						<tr>
							<td>运动健身</td>
							<td><%=b.getSport() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "sport") %></td>
							<td><%=b.getSport()-bm.getSumByType(username, d1, d2, "sport") %></td>
						</tr>
						<tr>
							<td>旅游开支</td>
							<td><%=b.getTourism() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "tourism") %></td>
							<td><%=b.getTourism()-bm.getSumByType(username, d1, d2, "tourism") %></td>
						</tr>
						<tr>
							<td>交通费</td>
							<td><%=b.getTraffic() %></td>
							<td><%=bm.getSumByType(username, d1, d2, "traffic") %></td>
							<td><%=b.getTraffic()-bm.getSumByType(username, d1, d2, "traffic") %></td>
						</tr>
					</tbody>
				</table>
			</div>
			<ol class="breadcrumb">
				<li><a href="BudgetList.jsp">返回列表</a></li>
				<li><a href="#">删除</a></li>
			</ol>
		</div>
	</div>
</body>
</html>