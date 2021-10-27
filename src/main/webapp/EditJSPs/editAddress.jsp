<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="tools.MySqlConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
</head>
<body>
<%
int idCity = 0;
int idCounty = 0;
ResultSet idCityOrCountyRs = null;

//here is the address id
String addressId = request.getParameter("id");
//here is the address name for the placeholder
String addressName = request.getParameter("addressName");



%> 
 <form action = "../EditAddress" method = "GET">
		<table>
			<tr>
				<td>
					Address
				</td>
				<td>
					<input type="text" name = "newAddressValue" value="<%=addressName %>">
					<input type="hidden" name = "addressId" value="<%= addressId %>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Update">
				</td>
			</tr>
		</table>
	</form>	
 
</body>
</html>