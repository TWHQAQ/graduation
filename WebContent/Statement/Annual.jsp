<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page language="java" import="dao1.IncomesAndExpenses"%>
<%@page language="java" import="java.util.*"%>
<%@page language="java" import="java.text.*"%>
<%@page language="java" import="entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>年度报表</title>
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
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date d = new Date();
			if (endDate == null) {
				endDate = sdf.format(d);

			}
			Calendar calendar = Calendar.getInstance();
			Date date = new Date(System.currentTimeMillis());
			calendar.setTime(date);
			//		        calendar.add(Calendar.WEEK_OF_YEAR, -1);
			calendar.add(Calendar.YEAR, -1);
			date = calendar.getTime();
			if (startDate == null) {
				startDate = sdf.format(date);
			}
			IncomesAndExpenses iae = new IncomesAndExpenses();
			ArrayList<Expense> list = iae.getExpenseByYear(username, startDate, endDate);
			Iterator<Expense> i = list.iterator();
		%>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">年度报表</h3>
			</div>
			<br>
			<form action="doAnnual.jsp">
				<div class="info">
					<div class="col-md-4">
						&nbsp;&nbsp;&nbsp;&nbsp;<label for="start">查询起始日期：</label> <input
							type="date" name="start" value=<%=startDate%> id="start">
					</div>
					<div class="col-md-5">
						<label for="select">至结束日期： </label><input type="date" id="select"
							name="end" value=<%=endDate%>>
						<button type="submit" class="btn btn-default">查询</button>
					</div>
				</div>
			</form>
			<div class="panel-body">
				<table class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>日期</th>
							<th>餐饮食品</th>
							<th>交通费用</th>
							<th>通讯</th>
							<th>医疗</th>
							<th>休闲娱乐</th>
							<th>运动健身</th>
							<th>服装</th>
							<th>书刊</th>
							<th>旅游</th>
							<th>礼金</th>
							<th>房贷</th>
							<th><font color="red">支出合计</font></th>
							<th>工资</th>
							<th>转账</th>
							<th>股票</th>
							<th><font color="blue">收入合计</font></th>
							<th>盈余</th>
						</tr>
					</thead>
					<tbody>
						<%
							while (i.hasNext()) {
								Expense e = i.next();
						%>
						<tr>
							<td><a href="Monthly.jsp?date=<%=e.getExpenseDate()%>"><%=e.getMonths()%></a></td>
							<td><%=e.getFood()%></td>
							<td><%=e.getTraffic()%></td>
							<td><%=e.getCommunication()%></td>
							<td><%=e.getMedicine()%></td>
							<td><%=e.getEntertainment()%></td>
							<td><%=e.getSport()%></td>
							<td><%=e.getClothing()%></td>
							<td><%=e.getBooks()%></td>
							<td><%=e.getTourism()%></td>
							<td><%=e.getCashGift()%></td>
							<td><%=e.getHousingLoan()%></td>
							<td><font color="red"><%=e.getExpense()%></font></td>
							<td><%=e.getSalary()%></td>
							<td><%=e.getStock()%></td>
							<td><%=e.getTransfer()%></td>
							<td><font color="blue"><%=e.getIncome()%></font></td>
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
		<%
			String type = request.getParameter("type");
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			System.out.println(start+","+end+","+type+"1");
			if (type == null) {
				type = "food";
				System.out.println("type");
			}
			if (end == null) {
				end = sdf.format(d);
				System.out.println("end");
			}
			Date date1 = new Date(System.currentTimeMillis());
			calendar.setTime(date1);
			//		        calendar.add(Calendar.WEEK_OF_YEAR, -1);
			calendar.add(Calendar.MONTH, -1);
			date1 = calendar.getTime();		
			if (start == null) {
				start = sdf.format(date1);
				System.out.println("start");
			}
			float amount = iae.getAmountByType(username, start, end, type);
		%>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">收支明细</h3>
			</div>
			<br>
			<form action="doCheckType.jsp">
				<div class="info">
					<div class="col-md-4">
						&nbsp;&nbsp;&nbsp;&nbsp;<label for="start">查询起始日期：</label> <input
							type="date" name="start" value=<%=start%> id="start">
					</div>
					<div class="col-md-4">
						<label for="select">至结束日期： </label><input type="date" id="select"
							name="end" value=<%=end%>>
					</div>
					<div class="col-md-4">
						<label for="type">类型：</label> <select id="type" name="type">
							<option value="">请选择类型</option>
							<optgroup label="支出"></optgroup>
							<option value="food">餐饮食品</option>
							<option value="traffic">交通</option>
							<option value="communication">通讯</option>
							<option value="medicine">医疗</option>
							<option value="entertainment">休闲娱乐</option>
							<option value="sport">运动健身</option>
							<option value="clothing">服装</option>
							<option value="books">书刊</option>
							<option value="tourism">旅游</option>
							<option value="cashGift">礼金</option>
							<option value="housingLoan">房贷</option>
							<optgroup label="收入"></optgroup>
							<option value="salary">工资</option>
							<option value="transfer">转账</option>
							<option value="stock">股票卖出</option>
						</select> &nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit" class="btn btn-default">查询</button>
					</div>
				</div>
			</form>
			<div class="panel-body">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>类型</th>
							<th>起始日期</th>
							<th>结束日期</th>
							<th>金额</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=iae.changeType(type)%></td>
							<td><%=start%></td>
							<td><%=end%></td>
							<td><%=amount%></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>