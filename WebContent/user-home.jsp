<%@ page language="java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Home</title>
<link rel="stylesheet" href="css/user-home-style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		// Load default content
		$("#mainContent").load("user-welcome.jsp");

		// Handle menu item clicks
		$(".sidenav a").click(function() {
			// Remove active class from all links
			$(".sidenav a").removeClass("active");
			// Add active class to the clicked link
			$(this).addClass("active");

			var page = $(this).attr("href");
			if (page === "index.html") {
				window.location.href = page; // Redirect to the logout page
			} else {
				$("#mainContent").load(page); // Load content for other links
			}
			return false;
		});

		// Set initial active link
		$(".sidenav a[href='user-welcome.jsp']").addClass("active");
		
		
	    $(document).on("click", ".get-staff-link", function(e) {
	        e.preventDefault(); // Prevent default link behavior
	        
	        var url = $(this).attr("href"); // Get the href attribute of the clicked link
	        $.get(url, function(data) { // Make a GET request to the URL
	            $("#mainContent").html(data); // Replace the content of mainContent with the response
	        });
	    });
	});
</script>
</head>
<body>
	<div class="navbar">
		<div class="logo">
			<img class="icon" alt="logo" src="images/favico.png">
			<h1>VCare</h1>
		</div>
	</div>

	<div class="sidenav">
		<a href="user-welcome.jsp">HOME</a> 
		<a href="user-bookings.jsp">MY BOOKINGS</a>
		<a href="user-profile.jsp">MY PROFILE</a>
		<a href="index.html">LOGOUT</a>

	</div>

	<div class="main" id="mainContent"></div>
</body>
</html>