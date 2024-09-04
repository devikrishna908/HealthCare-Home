<%@ page language="java"%>
<%@page import="vcare.mvc.beans.ServiceBean"%>
<%@page import="vcare.mvc.dao.ServiceDAO"%>
<%
	int serviceID = Integer.parseInt(request.getParameter("serviceID"));
	String serviceName = request.getParameter("serviceName");
	double servicePrice = Double.parseDouble(request.getParameter("servicePrice").trim());
    
	ServiceBean serviceBean = new ServiceBean();
	serviceBean.setService_id(serviceID);
	serviceBean.setService_name(serviceName.trim());
	serviceBean.setPrice(servicePrice);
	
	boolean flag = ServiceDAO.updateService(serviceBean);
	
	if (flag) {
		response.sendRedirect("admin-home.jsp");
	} else {
		response.sendRedirect("Error.jsp");
	}
	
%>
