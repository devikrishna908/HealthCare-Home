<%@ page language="java" import="java.sql.*,java.util.*"%>
<%@page import="vcare.mvc.beans.ServiceBean"%>
<%@page import="vcare.mvc.dao.ServiceDAO"%>
<%
	String serviceName = request.getParameter("serviceName");
	double servicePrice = Double.parseDouble(request.getParameter("servicePrice").trim());
    
	ServiceBean serviceBean = new ServiceBean();

	serviceBean.setService_name(serviceName.trim());
	serviceBean.setPrice(servicePrice);
	
	boolean flag = ServiceDAO.insertService(serviceBean);
	
	if (flag) {
		response.sendRedirect("admin-home.jsp");
	} else {
		response.sendRedirect("Error.jsp");
	}
	
%>
