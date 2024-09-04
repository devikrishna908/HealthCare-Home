<%@ page language="java"%>
<%@page import="vcare.mvc.beans.UserBean"%>
<%@page import="vcare.mvc.dao.UserDAO"%>
<%
	int userId = Integer.parseInt(request.getParameter("id"));
    
	UserBean userBean = new UserBean();
	userBean.setUser_id(userId);
	
	boolean flag = UserDAO.deleteUser(userBean);	
	if (flag) {
		response.sendRedirect("admin-home.jsp");
	} else {
		response.sendRedirect("Error.jsp");
	}
	
%>
