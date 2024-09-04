<%@ page language="java" import="java.sql.*,java.util.*"%>
<%@page import="vcare.mvc.beans.UserBean"%>
<%@page import="vcare.mvc.dao.UserDAO"%>
<%@page import="vcare.mvc.beans.ServicePersonBean"%>
<%@page import="vcare.mvc.dao.ServicePersonDAO"%>
<%
	String name = request.getParameter("staffName");
	String  qualification = request.getParameter("qualification");
	String email = request.getParameter("email");
	String contact = request.getParameter("contact");
	String address = request.getParameter("address");
	int service_id = Integer.parseInt(request.getParameter("service"));
	String uname = request.getParameter("uname");
	String pass = request.getParameter("pass");
    
	UserBean userBean = new UserBean();
	userBean.setAddress(address);
	userBean.setName(name);
	userBean.setEmail_id(email);
	userBean.setPhone_number(contact);
	userBean.setUser_name(uname);
	userBean.setUser_role("Staff");
	userBean.setPassword(pass);
	
	int user_id = UserDAO.insertUser(userBean);	
	if (user_id>0) {
		ServicePersonBean servicePersonBean = new ServicePersonBean();
		servicePersonBean.setPerson_id(user_id);
		servicePersonBean.setService_id(service_id);
		servicePersonBean.setQualification(qualification);
		
		boolean flag = ServicePersonDAO.insertServicePerson(servicePersonBean);
		if(flag){
			response.sendRedirect("admin-home.jsp");			
		}
		else {
			response.sendRedirect("Error.jsp");
		}
	}
	
%>
