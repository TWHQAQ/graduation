<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="dao1.SystemFunction"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str1 = request.getParameter("username");
		String str2 = request.getParameter("email");
		String str3 = request.getParameter("password1");
		String str4 = request.getParameter("password2");
		String username = new String(str1.getBytes("ISO-8859-1"), "utf-8");
		String email = new String(str2.getBytes("ISO-8859-1"), "utf-8");
		String password1 = new String(str3.getBytes("ISO-8859-1"), "utf-8");
		String password2 = new String(str4.getBytes("ISO-8859-1"), "utf-8");

		SystemFunction sf = new SystemFunction();
		ArrayList<User> list = sf.getUser();
		Iterator<User> i = list.iterator();
		int n = 0;
		String action = null;

		if (!password1 .equals(password2) ) {
			n = 1;
		} else {
			
			while (i.hasNext()) {
				User u = i.next();
				if (username.equals(u.getUsernmae()) && email.equals(u.getEmail())) {
					sf.changePasswordByUsername(username, password1);
					n = 2;
				} else {
					n = 3;
				}
			}
		}
		
		if(n==2){
			response.sendRedirect("../index.jsp?action=success");
		}else if(n==1){
			
			%>
			<script type="text/javascript" language="javascript">
				alert("密码输入不匹配，请重新输入!!!");
				window.location.href = "ChangePassword.jsp";
			</script>
			<%
		}else if(n==3){
			
			%>
			<script type="text/javascript" language="javascript">
				alert("用户名或邮箱错误，请重新输入!!!");
				window.location.href = "ChangePassword.jsp";
			</script>
			<%
		}
	%>
</body>
</html>