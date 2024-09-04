<%@ page language="java"%>
<%@ page import="vcare.mvc.beans.ServiceBean"%>
<%@ page import="vcare.mvc.dao.ServiceDAO"%>
<%@ page import="java.util.ArrayList"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Service</title>
<link rel="stylesheet" href="css/new-service-style.css">
<script>
	function submitForm() {
		var serviceName = document.getElementById("serviceName").value;
		var servicePrice = document.getElementById("servicePrice").value;

		if (serviceName.trim() === ""||servicePrice.trim()==="") {
			alert("Service name and price cannot be empty");
			return false; // Prevent form submission
		}
		return true;
	}

	function cancelAction() {
		window.history.back();
		return false;
	}
</script>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		ServiceBean service = new ServiceBean();
		service.setService_id(id);
		ServiceBean serviceBean = ServiceDAO.getServiceDetailsById(service);
	%>
	<div class="container">
		<h2>UPDATE SERVICE</h2>
		<form id="updateService" action="service-edit-action.jsp" method="post" onsubmit="return submitForm()">
			<input type="hidden" id="serviceID" name="serviceID" value ="<%=serviceBean.getService_id() %>">
			<input type="text" id="serviceName" name="serviceName" value ="<%=serviceBean.getService_name() %>">
			<input type="text" id="servicePrice" name="servicePrice" value ="<%=serviceBean.getPrice()%>" >
			<div class="button-container">
				<input type="submit" class="update" value="UPDATE"> 
				<input type="button" class="cancel" value="CANCEL" onclick="cancelAction()"><br>
			</div>
		</form>
	</div>

</body>
</html>