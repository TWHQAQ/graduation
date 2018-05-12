<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="dao1.SystemFunction"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增账户</title>
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
.info{
  font-size:5px;
  color:#8E8E8E;
}
.col-sm-10{
  width:30%;
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
		</div>
		<ul class="nav nav-tabs">
			<li class="dropdown"><a class="dropdown-toggle"
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
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">编辑账户</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="doAddAccount.jsp">
					<div class="form-group">
						<label for="accountname" class="col-sm-2 control-label">账户名称:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="accountname"
								name="accountName" placeholder="请输入名字"> <span
								class="info">自定义，比如：交通银行卡</span>
						</div>
					</div>
					<div class="form-group">
						<label for="accountType" class="col-sm-2 control-label">账户类型:</label>
						<div class="col-sm-10">
							<select id="accountType" name="accountType">
								<option value="">请选择</option>
								<option value="房产">房产</option>
								<option value="汽车">汽车</option>
								<option value="现金">现金</option>
								<option value="银行卡">银行卡</option>
								<option value="股票">股票</option>
								<option value="其他">其他</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="startAmount" class="col-sm-2 control-label">起始金额：</label>
						<div class="col-sm-10">
							<input type="text" id="startAmount" name="startAmount" class="form-control"
								value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="keyword" class="col-sm-2 control-label">关键字：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="keyword"
								name="keyword" placeholder="请输入">
						</div>
						
						<span class="info">品牌,店铺,型号等,只要写最关键的词就可以,<br>比如"Dell
							630M",中间用空格分开.</span>
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