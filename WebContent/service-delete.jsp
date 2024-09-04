<%@ page language="java"%>
<%@page import="vcare.mvc.beans.ServiceBean"%>
<%@page import="vcare.mvc.dao.ServiceDAO"%>
<%
	int serviceID = Integer.parseInt(request.getParameter("id"));
    
	ServiceBean serviceBean = new ServiceBean();
	serviceBean.setService_id(serviceID);
	
	boolean flag = ServiceDAO.deleteService(serviceBean);
	
	if (flag) {
		response.sendRedirect("admin-home.jsp");
	} else {
		response.sendRedirect("Error.jsp");
	}
	
%>
