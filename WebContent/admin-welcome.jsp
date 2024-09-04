<%@ page language="java"%>
<%@ page import="java.sql.*,java.util.*,javax.servlet.http.HttpSession"%>
<%@page import="vcare.mvc.beans.UserBean"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/admin-welcome.css">
</head>
<body>
	<%
		HttpSession sessionObj = request.getSession();
		UserBean userBean = (UserBean) sessionObj.getAttribute("user");
		String name = null;

		if (userBean != null) {
			name = userBean.getName();
		}
	%>
	<h1>
		Welcome
		<%=name%>,
	</h1>
	<div class="center">
        <img class="admin" src="images/admin.jpg">
        <h2 class="adm">ADMIN ZONE</h2>
    </div>
</body>
</html>