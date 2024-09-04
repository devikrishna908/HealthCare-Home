<%@ page language="java"%>
<%@page import="vcare.mvc.dao.UserAndServiceDAO"%>
<%@page import="vcare.mvc.beans.UserAndServiceConnectionBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="vcare.mvc.dao.ServiceDAO"%>
<%@ page import="vcare.mvc.beans.ServiceBean"%>
<%@ page import="java.util.List" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Services</title>
<link rel="stylesheet" href="css/admin-staff.css">
<script>
	function redirectToNewPage() {
		window.location.href = "new-staff.jsp"; // Change this to the URL of the new page
	}
	function confirmDelete(staffId) {
        if (confirm("Are you sure you want to delete this staff?")) {
            window.location.href = "staff-delete.jsp?id=" + staffId;
        }
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
			<th>SERVICE</th>
			<th>EDIT</th>
			<th>DELETE</th>
		</tr>

		<%
			int i = 1;
			UserAndServiceConnectionBean userserviceBean = new UserAndServiceConnectionBean();
			List<UserAndServiceConnectionBean> userservice = UserAndServiceDAO.getUsersWithServiceDetails();
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
			<td><%=userserv.getServiceName()%></td>
			<td><a href="staff-edit.jsp?id=<%=userserv.getUserId()%>&spid=<%=userserv.getService_person_id()%>">EDIT</a></td>
			<td><a href="javascript:confirmDelete(<%=userserv.getUserId()%>)">DELETE</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<button class="add-button" onclick="redirectToNewPage()">ADD NEW STAFF</button>
</body>
</html>