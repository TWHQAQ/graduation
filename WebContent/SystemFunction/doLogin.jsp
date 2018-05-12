<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="dao1.SystemFunction"%>
<%@ page language="java" import="entity.User"%>
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setCharacterEncoding("utf-8");
		String str1 = request.getParameter("username");
		String str2 = request.getParameter("password");
		String username = new String(str1.getBytes("ISO-8859-1"),"utf-8");
		String password = new String(str2.getBytes("ISO-8859-1"), "utf-8");
		boolean b = false;
		System.out.print(username + "," + str2);
		SystemFunction sf = new SystemFunction();
		ArrayList<User> list = sf.getUser();
		Iterator<User> iterator = list.iterator();
		while (iterator.hasNext()) {
			User u = iterator.next();
			if (u.getUsernmae().equals(username) && u.getPassword().equals(password)) {
				String name = u.getUsernmae();
				session.setAttribute("username", u.getUsernmae());
				b = true;
				break;
			} else {
				b = false;
			}
		}
		if (b == true) {
			System.out.print("2");
			response.sendRedirect("../index.jsp");
		} else {
			System.out.print("3");
	%>

	<script type="text/javascript" language="javascript">
		alert("用户名或密码错误，请重新登录!");
		window.location.href = "login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>