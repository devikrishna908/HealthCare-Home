<%@ page language="java" import="java.sql.*,java.util.*"%>
<%@page import="vcare.mvc.beans.UserBean"%>
<%@page import="vcare.mvc.dao.UserDAO"%>
<%@page import="vcare.mvc.beans.ServicePersonBean"%>
<%@page import="vcare.mvc.dao.ServicePersonDAO"%>
<%
	String name = request.getParameter("staffName");
	String email = request.getParameter("email");
	String contact = request.getParameter("contact");
	String address = request.getParameter("address");
	String uname = request.getParameter("uname");
	String pass = request.getParameter("pass");
    
	UserBean userBean = new UserBean();
	userBean.setAddress(address);
	userBean.setName(name);
	userBean.setEmail_id(email);
	userBean.setPhone_number(contact);
	userBean.setUser_name(uname);
	userBean.setUser_role("User");
	userBean.setPassword(pass);
	
	int user_id = UserDAO.insertUser(userBean);		
	if (user_id>0) {
			response.sendRedirect("login.html");			
	}else {
		response.sendRedirect("Error.jsp");
	}


%>
