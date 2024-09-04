<%@ page language="java" %>
<%@page import="vcare.mvc.beans.UserAndServiceConnectionBean"%>
<%@page import="vcare.mvc.dao.UserAndServiceDAO"%>

<%

	int service_person_id = Integer.parseInt(request.getParameter("service_person_id"));
	int user_id = Integer.parseInt(request.getParameter("user_id"));
	String staffName = request.getParameter("staffName").trim();
	String qualification = request.getParameter("qualification").trim();
	String email = request.getParameter("email").trim();
	String contact = request.getParameter("contact").trim();
	String address = request.getParameter("address").trim();
    
	UserAndServiceConnectionBean userserviceBean = new UserAndServiceConnectionBean();
	userserviceBean.setName(staffName);
	userserviceBean.setAddress(address);
	userserviceBean.setEmailId(email);
	userserviceBean.setPhoneNumber(contact);
	userserviceBean.setQualification(qualification);
	userserviceBean.setUserId(user_id);
	userserviceBean.setService_person_id(service_person_id);
	
	
	boolean flag = UserAndServiceDAO.updateUserAndService(userserviceBean);
	
	if (flag) {
		response.sendRedirect("admin-home.jsp");
	} else {
		response.sendRedirect("Error.jsp");
	}
	
%>

