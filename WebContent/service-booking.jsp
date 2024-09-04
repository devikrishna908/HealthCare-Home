<%@ page language="java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Booking</title>
<link rel="stylesheet" href="css/book-style.css">
<script>
	function validateForm() {
        var contact = document.getElementById("contact").value;
        var address = document.getElementById("address").value;
        var bdate = document.getElementById("bdate").value;
        var btime = document.getElementById("btime").value;
        var description = document.getElementById("description").value;

        if (contact === "" || address === "" || bdate === "" || btime === "" || description === "") {
            alert("All fields are required.");
            return false;
        }

        // Check if contact number is 10-digit numeric
        if (!/^\d{10}$/.test(contact)) {
            alert("Contact number must be a 10-digit numeric value.");
            return false;
        }

		if (btime == "nil") {
			alert("Please select a Time slot");
			return false;
		}

        var today = new Date();
        today.setHours(0, 0, 0, 0);

        // Get the selected booking date (without time)
        var selectedDate = new Date(bdate);
        selectedDate.setHours(0, 0, 0, 0);

        // Check if booking date is greater than current date
        if (selectedDate <= today) {
            alert("Booking date must be greater than today's date.");
            return false;
        }


        // Form validation successful
        return true;
	}
	function cancelAction() {
		//			alert('Cancel button clicked. Redirecting to homepage...');
		window.history.back();
	}
</script>

</head>
<body>
	<div class="container">
		<h2>BOOK THE SERVICE</h2>
		<div class="form-container">
			<form name="create" method="post" action="service-book-action.jsp"
				onsubmit="return validateForm()">

					
					<label for="contact">Contact Number</label> 
					<input type="text" name="contact" id="contact"> 
					
					<label for="address">Address</label>
					<textarea name="address" id="address"></textarea>

					<label for="date">Booking date</label> 
					<input type="date" name="bdate" id="bdate"> 
					
					<label for="btime">Preferred Time Slot</label>
					<select name="btime" id="btime">
						<option value="nil">Choose Time Slot</option>
						<option value="07 AM - 09 AM">07 AM - 09 AM</option>
						<option value="09 AM - 11 AM">09 AM - 11 AM</option>
						<option value="01 PM - 03 PM">01 PM - 03 PM</option>
						<option value="03 PM - 05 PM">03 PM - 05 PM</option>
						<option value="05 PM - 07 PM">05 PM - 07 PM</option>
					</select>
					
					<label for="description">Small Description About Requirement/Service</label>
					<textarea name="description" id="description"></textarea>

				<div class="input-button">
					<input type="submit" value="BOOK SERVICE" class="insert"> <input
						type="button" value="CANCEL" class="cancel"
						onclick="cancelAction()"> <br>
				</div>
			</form>
		</div>

	</div>

</body>
</html>