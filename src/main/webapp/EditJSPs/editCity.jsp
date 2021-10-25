<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="tools.MySqlConnection" %>
<%@ page import="java.sql.ResultSet"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

	String id = request.getParameter("id");
	//System.out.println(id);
	String sql = "SELECT city FROM birthdays.cities WHERE birthdays.cities.id = " + id;
	//System.out.println(sql);
	ResultSet rs = MySqlConnection.runQuery(sql);
	rs.next();
	
	String cityName = rs.getString(1);
	//System.out.println(cityName);

%>
	<form action = "../EditCity" method = "GET">
		<table>
			<tr>
				<td>
					Edit city name:
				</td>
				<td>
					<input type = "text" name = "newCityValue" value = <%=cityName %>>
				</td>
			</tr>
			<tr>
				<td colspan = "2">
					<input type = "submit" value = "Edit City Name">
					<input type ="hidden" name = "id" value = <%= id %> >
				</td>
			</tr>
		</table>
	</form>
</body>
</html>