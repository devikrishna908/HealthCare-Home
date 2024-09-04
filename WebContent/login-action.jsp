<%@ page language="java" import="java.sql.*,java.util.*,javax.servlet.http.HttpSession"%>
<%@page import="vcare.mvc.beans.UserBean"%>
<%@page import="vcare.mvc.dao.UserDAO"%>
<%
	String role = "";
	UserBean userBean = new UserBean();

	userBean.setUser_name(request.getParameter("username"));
	userBean.setPassword(request.getParameter("password"));

	userBean = UserDAO.userValidation(userBean);
	if (userBean != null) {
		role = userBean.getUser_role();
		
		HttpSession sessionObj = request.getSession();
        sessionObj.setAttribute("user", userBean);
        
		if (role != null) {

			if (role.equals("Admin")) {
				response.sendRedirect("admin-home.jsp");
			} else if (role.equals("Staff")) {
				response.sendRedirect("staff-home.jsp");
			} else if (role.equals("User")) {
				response.sendRedirect("user-home.jsp");
			}
		} else {
%>
<script>
	alert("User Not Found!");
	window.location.href = "login.html";
</script>
<%
	}
 }
%>