<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.Date"%>
<%@ page language="java" import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增预算</title>
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

.col-sm-10 {
	width: 30%;
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
			<%
				request.setCharacterEncoding("utf-8");
				String action = request.getParameter("action");
				if ("success".equals(action)) {
			%>
			<script type="text/javascript" language="javascript">
				alert("保存成功....");
				window.location.href = "BudgetList.jsp";
			</script>
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
		<%
			String date = null;
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			date = sdf.format(d);
		%>
		<br>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">新增预算</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="doAddBudget.jsp">
					<div class="form-group">
						<label for="buyDate" class="col-sm-2 control-label">起始日期：</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="buyDate"
								name="BudgetStart" value=<%=date%>>
						</div>
					</div>
					<div class="form-group">
						<label for="buyDate" class="col-sm-2 control-label">结束日期：</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="buyDate"
								name="BudgetEnd" value=<%=date%>>
						</div>
					</div>
					<div class="form-group">
						<label for="food" class="col-sm-2 control-label">餐饮食品：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="food" name="food"
								value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">通讯：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="communication" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">交通费：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="traffic" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">医疗：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="medicine" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">休闲娱乐：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="entertainment" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">运动健身：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="sport" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">服装：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="clothing" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">书刊：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="books" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">旅游：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="tourism" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">礼金：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="cashGift" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">房贷：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="housingLoan" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">保存</button>
						</div>
					</div>
					</form>
			</div>
		</div>
	</div>
</body>
</html>