<%@ page language="java"%>
<%@ page import="java.sql.*,java.util.*,javax.servlet.http.HttpSession"%>
<%@page import="vcare.mvc.beans.UserBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="vcare.mvc.dao.ServiceDAO"%>
<%@ page import="vcare.mvc.beans.ServiceBean"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/admin-welcome.css">
</head>
<body>
	<%
		HttpSession sessionObj = request.getSession();
		UserBean userBean = (UserBean) sessionObj.getAttribute("user");
		String name = null;

		if (userBean != null) {
			name = userBean.getName();
		}
	%>
	<label class="note">** The Service Charge Mentioned Is Only Applicable For The Service. Equipments And Vehicle Charge Need To Be Paid If Required</label>
	<h1>
		Welcome
		<%=name%>,
	</h1>
	<div class="center">
		<h3>SERVICES WE PROVIDE</h3>
		<table border="1">
		<tr>
			<th>SERIAL NO.</th>
			<th>SERVICE NAME</th>
			<th>SERVICE PRICE</th>
			<th>AVAILABLE STAFF</th>
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
			<td><a href="service-staff-list.jsp?id=<%=serv.getService_id()%>" class="get-staff-link">GET STAFF</a></td>
		</tr>
		<%
			}
		%>
	</table>
    </div>
</body>
</html>