<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="tools.MySqlConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "../newOrase" method = "GET">
		<table>
			<tr>
				<td>
					Nume Oras
				</td>
				<td>
					<input type="text" name = "name">
				</td>
			</tr>
			<tr>
				<td>
					Judet
				</td>
				<td>
					  <select name="idJudet">
					  	<%
					  	String tableName = "counties";
						String sql = "SELECT * FROM " + tableName;
						 
						ResultSet rs = MySqlConnection.runQuery(sql);

						while (rs.next())
						{
							
							out.println("<option value=\"" + rs.getInt("id") + "\">" + rs.getString("county") + "</option>");

						}
					  	%>
					  </select>					  
				</td>
				<td>
					<a href="../JSPDataCollectionForms/newCounty.jsp"> Add new county </a>
					
				</td>
			</tr>
			<tr>
				<td >
					<input type="submit" value="Add New City">
				</td>				
			</tr>
		</table>
	</form>	
</body>
</html>