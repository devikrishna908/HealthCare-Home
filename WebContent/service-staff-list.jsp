<%@ page language="java"%>
<%@page import="vcare.mvc.dao.UserAndServiceDAO"%>
<%@page import="vcare.mvc.beans.UserAndServiceConnectionBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service-Staff List</title>
<link rel="stylesheet" href="css/admin-welcome.css">
<script>
function backAction() {
	window.location.href = "user-home.jsp";
}
</script>
</head>
<body>
	<div class="services-container">
		<h1 class="services">STAFF DETAILS</h1>
	</div>
	<table border="1">
		<tr>
			<th>SERIAL NO.</th>
			<th>STAFF NAME</th>
			<th>QUALIFICATION</th>			
			<th>EMAIL ID</th>
			<th>CONTACT NUMBER</th>
			<th>ADDRESS</th>
			<th>BOOK STAFF</th>
		</tr>

		<%
			int i = 1;
			int id = Integer.parseInt(request.getParameter("id"));
			UserAndServiceConnectionBean userserviceBean = new UserAndServiceConnectionBean();
			userserviceBean.setServiceId(id);
			List<UserAndServiceConnectionBean> userservice = UserAndServiceDAO.getStaffDetailsByServiceID(userserviceBean);
			for (UserAndServiceConnectionBean userserv : userservice) {
		%>
		<tr>
			<%-- <td><%=cat.getCaId()%></td> --%>
			<td><%=i++%></td>
			<td><%=userserv.getName()%></td>
			<td><%=userserv.getQualification()%></td>
			<td><%=userserv.getEmailId()%></td>
			<td><%=userserv.getPhoneNumber()%></td>
			<td><%=userserv.getAddress()%></td>
			<td><a href="service-booking.jsp?id=<%=userserv.getService_person_id()%>">BOOK NOW</a></td>
		</tr>
		<%
			}
		%>
	</table>
	
	<input type="button" value="BACK" class="back" onclick="backAction()">
	
</body>
</html>