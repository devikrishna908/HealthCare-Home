<%@page import="java.util.ArrayList"%>
<%@page import="vcare.mvc.dao.ServiceDAO"%>
<%@page import="vcare.mvc.beans.ServiceBean"%>
<%@ page language="java"%>
<%@ page import="vcare.mvc.beans.UserAndServiceConnectionBean"%>
<%@ page import="vcare.mvc.dao.UserAndServiceDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD A NEW STAFF</title>
<link rel="stylesheet" href="css/staff-style.css">
<script>
	function validateForm() {
		var staffName = document.getElementById("staffName").value;
		var qualification = document.getElementById("qualification").value;
		var email = document.getElementById("email").value;
		var contact = document.getElementById("contact").value;
		var address = document.getElementById("address").value;
		var password = document.getElementById("pass").value;
		var confirmPassword = document.getElementById("cpass").value;
		var username = document.getElementById("uname").value;
		var selectedValue = document.getElementById("service").value;

		if (staffName.trim() === "" || qualification.trim() === ""
				|| email.trim() === "" || contact.trim() === ""
				|| address.trim() === "" || password.trim() === ""
				|| confirmPassword.trim() === "" || username.trim() === "") {
			
			alert("All the fields are mandatory.");
			return false;
		}
		
		if (selectedValue == "nil") {
			alert("Please select a service");
			return false;
		}

		if (!/^\d{10}$/.test(contact)) {
			alert("Please enter a valid 10-digit contact number.");
			return false;
		}

		if (!/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/.test(email)) {
			alert("Please enter a valid email address.");
			return false;
		}

		if (password.length < 6) {
			alert("Password must be at least 6 characters long.");
			return false;
		}

		if (password !== confirmPassword) {
			alert("Password and confirm password do not match.");
			return false;
		}

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
		ArrayList<ServiceBean> serviceList = new ArrayList<ServiceBean>();
		serviceList = ServiceDAO.getAllServices();
	%>

	<div class="container">
		<h2>ADD NEW STAFF</h2>
		<div class="form-container">
			<form name="create" method="post" action="staff-add-action.jsp"
				onsubmit="return validateForm()">

				<label for="staffName">Staff Name</label> <input type="text"
					name="staffName" id="staffName"> <label
					for="qualification">Qualification</label> <input type="text"
					name="qualification" id="qualification"> <label for="email">Email
					ID</label> <input type="text" name="email" id="email"> <label
					for="contact">Contact Number</label> <input type="text"
					name="contact" id="contact"> <label for="address">Address</label>
				<textarea name="address" id="address"></textarea>

				<label for="service">Choose Service</label> <select id="service"
					name="service">
					<option value="nil">Select Service</option>
					<%
						for (ServiceBean service : serviceList) {
					%>
					<option value="<%=service.getService_id()%>"><%=service.getService_name()%></option>
					<%
						}
					%>
				</select> <label for="uname">User Name</label> <input type="text"
					name="uname" id="uname"> <label for="pass">Password</label>
				<input type="password" name="pass" id="pass"> <label
					for="cpass">Confirm Password</label> <input type="password"
					name="cpass" id="cpass">

				<div class="input-button">
					<input type="submit" value="SAVE" class="insert"> <input
						type="button" value="CANCEL" class="cancel"
						onclick="cancelAction()"> <br>
				</div>
			</form>
		</div>

	</div>
</body>
</html>
