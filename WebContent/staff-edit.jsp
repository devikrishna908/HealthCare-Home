<%@ page language="java"%>
<%@ page import="vcare.mvc.beans.UserAndServiceConnectionBean"%>
<%@ page import="vcare.mvc.dao.UserAndServiceDAO"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STAFF DETAILS UPDATE</title>
<link rel="stylesheet" href="css/staff-style.css">
<script>
	function validateForm() {
		var staffName = document.getElementById("staffName").value;
		var qualification = document.getElementById("qualification").value;
		var email = document.getElementById("email").value;
		var contact = document.getElementById("contact").value;
		var address = document.getElementById("address").value;

		if (staffName.trim() === "" || qualification.trim() === ""
				|| email.trim() === "" || contact.trim() === ""
				|| address.trim() === "") {
			alert("All the fields are mandatory.");
			return false;
		}

		// Validate contact number
		if (!/^\d{10}$/.test(contact)) {
			alert("Please enter a valid 10-digit contact number.");
			return false;
		}

		// Validate email formatting
		if (!/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/.test(email)) {
			alert("Please enter a valid email address.");
			return false;
		}

		// Form validation passed
		return true;
	}
	function cancelAction() {
		//			alert('Cancel button clicked. Redirecting to homepage...');
		window.history.back();
	}
</script>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		int spid = Integer.parseInt(request.getParameter("spid"));
		UserAndServiceConnectionBean userservice = new UserAndServiceConnectionBean();
		userservice.setUserId(id);

		UserAndServiceConnectionBean userServiceBean = UserAndServiceDAO
				.getUsersWithServiceDetailsByID(userservice);
	%>

	<div class="container">
		<h2>STAFF DETAILS UPDATE</h2>
		<div class="form-container">
			<form name="create" method="post" action="staff-update-action.jsp"
				onsubmit="return validateForm()">

				<label for="staffName">Staff Name</label> <input type="text"
					name="staffName" id="staffName"
					value="<%=userServiceBean.getName()%>"> <label
					for="qualification">Qualification</label> <input type="text"
					name="qualification" id="qualification"
					value="<%=userServiceBean.getQualification()%>"> <label
					for="email">Email ID</label> <input type="text" name="email"
					id="email" value="<%=userServiceBean.getEmailId()%>"> <label
					for="contact">Contact Number</label> <input type="text"
					name="contact" id="contact"
					value="<%=userServiceBean.getPhoneNumber()%>"> <label
					for="address">Address</label>
				<textarea name="address" id="address"><%=userServiceBean.getAddress()%></textarea>

				<label for="service">Service</label> <input type="text"
					name="service" id="service"
					value="<%=userServiceBean.getServiceName()%>" readonly> <input
					type="hidden" name="user_id" id="user_id"
					value="<%=userServiceBean.getUserId()%>"> <input
					type="hidden" name="service_person_id" id="service_person_id"
					value="<%=userServiceBean.getService_person_id()%>">

				<div class="input-button">
					<input type="submit" value="UPDATE" class="insert"> <input
						type="button" value="CANCEL" class="cancel"
						onclick="cancelAction()"> <br>
				</div>
			</form>
		</div>

	</div>
</body>
</html>
