<%@ page language="java"%>

<html>
<head>
<title>Admin Home</title>
<link rel="stylesheet" href="css/admin-home-style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		// Load default content
		$("#mainContent").load("admin-welcome.jsp");

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
		$(".sidenav a[href='admin-welcome.jsp']").addClass("active");
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
		<a href="admin-welcome.jsp">HOME</a> 
		<a href="admin-services.jsp">SERVICES</a>
		<a href="admin-staff.jsp">STAFF</a> 
		<a href="admin-report.jsp">REPORT</a>
		<a href="index.html">LOGOUT</a>

	</div>

	<div class="main" id="mainContent"></div>
</body>
</html>