<%@ page language="java"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="vcare.mvc.dao.ServiceDAO"%>
<%@ page import="vcare.mvc.beans.ServiceBean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Services</title>
<link rel="stylesheet" href="css/admin-welcome.css">
<script>
	function redirectToNewPage() {
		window.location.href = "new-service.jsp"; // Change this to the URL of the new page
	}
	function confirmDelete(serviceId) {
        if (confirm("Are you sure you want to delete this service?")) {
            window.location.href = "service-delete.jsp?id=" + serviceId;
        }
    }
</script>
</head>
<body>
	<div class="services-container">
		<h1 class="services">SERVICES</h1>
		<div class="image-container">
			<img class="service-img" src="images/services.jpg" alt="Image"
				width="200">
		</div>
	</div>
	<table border="1">
		<tr>
			<th>SERIAL NO.</th>
			<th>SERVICE NAME</th>
			<th>SERVICE PRICE</th>
			<th>EDIT</th>
			<th>DELETE</th>
		</tr>

		<%
			int i = 1;
			ServiceBean serviceBean = new ServiceBean();
			ArrayList<ServiceBean> service = ServiceDAO.getAllServices();
			for (ServiceBean serv : service) {
		%>
		<tr>
			<%-- <td><%=cat.getCaId()%></td> --%>
			<td><%=i++%></td>
			<td><%=serv.getService_name()%></td>
			<td><%=serv.getPrice()%></td>
			<td><a href="service-edit.jsp?id=<%=serv.getService_id()%>">EDIT</a></td>
			<td><a href="javascript:confirmDelete(<%=serv.getService_id()%>)">DELETE</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<button class="add-button" onclick="redirectToNewPage()">ADD NEW SERVICE</button>
</body>
</html>