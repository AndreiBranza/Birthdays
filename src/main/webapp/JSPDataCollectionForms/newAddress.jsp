<%@ page language = "java" contentType = "text/html; charset = ISO-8859-1"
    pageEncoding = "ISO-8859-1"%>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "tools.MySqlConnection" %>
<%@ page import = "tools.CancelButton" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "newAddress" method = "GET">
		<table>
			<tr>
				<td>
					Strada
				</td>
				<td>
					<input type="text" name = "name">
				</td>
			</tr>
			<tr>
				<td>
					Oras
				</td>
				<td>
					  <select name="idCity">
					  	<%
					  	String tableName = "cities";
						String sql = "SELECT * FROM " + tableName;
						 
						ResultSet rs = MySqlConnection.runQuery(sql);

						while (rs.next())
						{
							out.println("<option value=\"" + rs.getInt("id") + "\">" + rs.getString("city") + "</option>");
						}
					  	%>
					  </select>					  
				</td>
			</tr>
			<tr>
				<td >
					<input type="submit" value="Insert">
					
				</td>
				<td >
					<a href = "newPersons.jsp" >  Go back </a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>