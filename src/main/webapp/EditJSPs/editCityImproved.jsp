<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="tools.MySqlConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit city</title>
</head>
<body>
<%

	String id = request.getParameter("id");
	//System.out.println(id);
	String sql = "SELECT ct.id, city, idCounty FROM birthdays.cities as ct WHERE  ct.id=" + id;
	//System.out.println(sql);
	ResultSet rsCities = MySqlConnection.runQuery(sql);
	rsCities.next();
	
	String cityName = rsCities.getString(2);
	int idCounty = rsCities.getInt("idCounty");
%>

	<form action = "../EditCity" method = "GET">
		<table>
			<tr>
				<td>
					Nume Oras
				</td>
				<td>
					<input type="text" name = "newCityValue" value="<%=cityName %>">
					<input type="hidden" name = "id" value="<%= id %>">
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
						sql = "SELECT * FROM " + tableName;
						 
						ResultSet rsCounties = MySqlConnection.runQuery(sql);

						while (rsCounties.next())
						{
							///System.out.print("Adaug judetul " + rsCounties.getString("county") + " cu id-ul " + rsCounties.getInt("id"));
							out.print("<option value=\"" + rsCounties.getInt("id") + "\"");
							if(rsCounties.getInt("id") == idCounty )
							{
								out.print(" selected ");
								//System.out.print(" !!! acesta este judetul orasului pe care vreau sa il editez : " + cityName);
							}
							out.print(">" + rsCounties.getString("county") + "</option>");
							//System.out.println("");
						}
					  	%>
					  </select>	
					  <% 
					  	out.println("		<a href = \"../EditJSPs/editCounty.jsp?id=" + idCounty + "&source=EditJSPs/editCityv02.jsp?id=" + id + "\" >");
						out.println("<img src = \"../images/editIcon.png\" alt =\"Edit Icon\" width = 20 height = 20>");
						out.println("		</a>");
					  %>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Update City">
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>