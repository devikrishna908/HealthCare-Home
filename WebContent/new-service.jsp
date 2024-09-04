<%@ page language="java"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Service</title>
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
		//		alert("Cancel button clicked. Redirecting to homepage...");
		window.history.back();
		return false;
	}
</script>
</head>
<body>
	<div class="container">
		<h2>ADD NEW SERVICE</h2>
		<form id="addService" action="service-save.jsp" method="post" onsubmit="return submitForm()">
			<input type="text" id="serviceName" name="serviceName" placeholder="Enter Service Name">
			<input type="text" id="servicePrice" name="servicePrice" placeholder="Enter Service Price">
			<div class="button-container">
				<input type="submit" class="insert" value="INSERT"> 
				<input type="button" class="cancel" value="CANCEL" onclick="cancelAction()"><br>
			</div>
		</form>
	</div>

</body>
</html>
