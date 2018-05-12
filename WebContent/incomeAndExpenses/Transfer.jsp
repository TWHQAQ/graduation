<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.text.*"%>
<%@ page language="java" import="dao1.AccountManagement"%>
<%@ page language="java" import="entity.Account"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>转账</title>
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

.info {
	color: #8E8E8E;
	font-size: 5px;
}

.col-sm-10 {
	width: 30%;
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
				alert("添加成功....");
				window.location.href = "Transfer.jsp";
			</script>
			<%
				}
			%>
		</div>
		<ul class="nav nav-pills">
			<li class=" dropdown"><a class="dropdown-toggle "
				data-toggle="dropdown" href="../BudgetManagement/AddBudget.jsp">
					预算<span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="../BudgetManagement/AddBudget.jsp">新增预算</a></li>
					<li><a href="../BudgetManagement/BudgetList.jsp">预算列表</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="KeppAccounts.jsp.jsp"> 收支 <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="KeepAccounts.jsp">记一笔账</a></li>
					<li><a href="Transfer.jsp">转账</a></li>

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
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(d);
			AccountManagement am = new AccountManagement();
			ArrayList<Account> list = am.getAllAccount(username);
		%>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">编辑收支明细</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="doTransfer.jsp">
					<div class="form-group">
						<label for="expenses" class="col-sm-2 control-label">金额：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="expenses"
								name="transferAmount" value="0" onmouseover="this.select()">
						</div>
						元
					</div>

					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">类型：</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label class="radio-inline"> <input type="radio"
							name="type" id="optionsRadios3" value="1" checked> 存钱
						</label> <label class="radio-inline"> <input type="radio"
							name="type" id="optionsRadios4" value="2"> 取钱
						</label><label class="radio-inline"> <input type="radio"
							name="type" id="optionsRadios4" value="3"> 卡内转账
						</label>
					</div>

					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">日期：</label>
						<div class="col-sm-10">
							<input type="date" name="tallyTime" class="form-control"
								id="date" value=<%=date%>>
						</div>
					</div>
					<div class="form-group">
						<label for="key" class="col-sm-2 control-label">备注：</label>
						<div class=" col-sm-10">
							<textarea class="form-control" id="key" name="tag"></textarea>
							<span class="info"> 对转账进行更细致的描述</span>
						</div>
					</div>
					<div class="form-group">
						<label for="accountName" class="col-sm-2 control-label">高级选项：</label>
						&nbsp;&nbsp;&nbsp; <span>取出账户：</span><select id="accountName"
							name="payment">
							<option value="">请选择</option>
							<%
								Iterator<Account> i1 = list.iterator();
								while (i1.hasNext()) {
									String name = i1.next().getAccountName();
							%>
							<option value=<%=name%>>
								<%=name%></option>
							<%
								}
							%>

						</select>
					</div>
					<div class="form-group">
						<label for="accountName" class="col-sm-2 control-label"></label>
						&nbsp;&nbsp;&nbsp; <span>存入账户：</span><select id="accountName"
							name="deposit">
							<option value="">请选择</option>
							<%
								Iterator<Account> i2 = list.iterator();
								while (i2.hasNext()) {
									String name = i2.next().getAccountName();
							%>
							<option value=<%=name%>>
								<%=name%></option>
							<%
								}
							%>

						</select>

					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" class="btn btn-default"
								onclick="myFunction()">保存
							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>