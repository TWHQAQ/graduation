<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="entity.Account"%>
<%@ page language="java" import="dao1.AccountManagement"%>
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="java.util.Iterator"%>
<%@ page language="java" import="java.util.Date"%>
<%@ page language="java" import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>记一笔账</title>
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
				String warn = (String)session.getAttribute("warn");
				if ("success".equals(action)&&"yes".equals(warn)) {
			%>
			<script type="text/javascript" language="javascript">
				alert("添加成功....请注意本月消费已超出预算");
				window.location.href = "KeepAccounts.jsp";
			</script>
			<%
				}else if("success".equals(action)){
					%>
					<script type="text/javascript" language="javascript">
						alert("添加成功....");
						window.location.href = "KeepAccounts.jsp";
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
			Account a = new Account();
			AccountManagement am = new AccountManagement();
			ArrayList<Account> list = am.getAllAccount(username);
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(d);
		%>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">记一笔账</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="doKeepTally.jsp">
					<div class="form-group">
						<label for="expenses" class="col-sm-2 control-label">金额：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="expenses"
								name="tallyAmount" value="0" onmouseover="this.select()">
						</div>
						元
					</div>
					<div class="form-group">
						<label for="accountName" class="col-sm-2 control-label">相关账户：</label>
						&nbsp;&nbsp;&nbsp; <select id="accountName" name="tallyAccount">
							<option value="">请选择</option>
							<%
								Iterator<Account> i = list.iterator();
								while (i.hasNext()) {
									String name = i.next().getAccountName();
							%>
							<option value=<%=name%>>
								<%=name%></option>
							<%
								}
							%>

						</select>
					</div>
					<div class="form-group">
						<label for="type" class="col-sm-2 control-label">类型：</label>
						&nbsp;&nbsp;&nbsp; <select id="type" name="tallyType">
							<option value="">请选择类型</option>
							<optgroup label="支出"></optgroup>
							<option value="餐饮食品">食物</option>
							<option value="交通">交通</option>
							<option value="通讯">通讯</option>
							<option value="医疗">医疗</option>
							<option value="休闲娱乐">娱乐活动</option>
							<option value="运动健身">运动健身</option>
							<option value="服装">服装</option>
							<option value="书刊">书刊</option>
							<option value="旅游">旅游</option>
							<option value="礼金">礼金</option>
							<option value="房贷">房贷</option>
							<optgroup label="收入"></optgroup>
							<option value="工资">工资</option>
							<option value="转账">转账</option>
                            <option value="股票卖出">股票卖出</option>
						</select>
					</div>

					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">日期：</label>
						<div class="col-sm-10">
							<input type="date" name="tallyTime" class="form-control"
								id="date" value=<%=date%>>
						</div>
					</div>
					<div class="form-group">
						<label for="key" class="col-sm-2 control-label">关键字：</label>
						<div class=" col-sm-10">
							<input type="text" class="form-control" id="key" name="tag">
							<span class="info"> 品牌,店铺,型号等,只要写最关键的词,如八佰伴 淑女屋,中间用空格分开</span>
						</div>
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