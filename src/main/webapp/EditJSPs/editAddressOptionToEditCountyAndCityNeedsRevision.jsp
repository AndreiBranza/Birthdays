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
//here is the city name for the placeholder
String city = request.getParameter("cityName");
//here is the county name for the placeholder
String county = request.getParameter("countyName");
String idCitySql = "SELECT idCity FROM address WHERE id = " + addressId;
//here is the address name for the placeholder
String addressName = request.getParameter("addressName");

idCityOrCountyRs = MySqlConnection.runQuery(idCitySql);
idCityOrCountyRs.next();
//here is the city id
idCity = idCityOrCountyRs.getInt(1);

String idCountySql = "SELECT idCounty FROM cities where id = " + idCity;

idCityOrCountyRs = MySqlConnection.runQuery(idCountySql);
idCityOrCountyRs.next();
//here is the county id
idCounty = idCityOrCountyRs.getInt(1);
//System.out.print(idCounty);

%>
<!-- ca sa pot edita adresa am nevoie de viewAdresses
idCity
idCounty
street
id de la adresa
noile valori le trimit prin sql catre baza de date sa fie 
actualizate intr-o lovitura

eu cunosc idul adresei pe care vreau sa o editez
din baza de date addresses cu idul adresei pot sa scot idul orasului
cu idul orasului pot sa scot idul countiului din cities

la edit entry poate edita adresa dar poate schimba orasul si countyul din drop down\

 -->
 
 <form action = "../EditAddress" method = "GET">
		<table>
			<tr>
				<td>
					City
				</td>
				<td>
					<select name="cityId">
					  	<%
					  	String tableNameCities = "cities";
						String sqlCities = "SELECT * FROM " + tableNameCities;
						 
						ResultSet rsCities = MySqlConnection.runQuery(sqlCities);

						while (rsCities.next())
						{
							///System.out.print("Adaug judetul " + rsCounties.getString("county") + " cu id-ul " + rsCounties.getInt("id"));
							out.print("<option value=\"" + rsCities.getInt("id") + "\"");
							if(rsCities.getInt("id") == idCity)
							{
								out.print(" selected ");
								//System.out.print(" !!! acesta este judetul orasului pe care vreau sa il editez : " + cityName);
							}
							out.print(">" + rsCities.getString("city") + "</option>");
							//System.out.println("");
						}
					  	%>
					  </select>	
					   <% 
					  	out.println("		<a href = \"../EditJSPs/editCity.jsp?id=" + idCity + "&source=EditJSPs/editAddress.jsp?id=" + addressId + "\" >");
						out.println("<img src = \"../images/editIcon.png\" alt =\"Edit Icon\" width = 20 height = 20>");
						out.println("		</a>");
					  %>
				</td>
			</tr>
			<tr>
				<td>
					County
				</td>
				<td>
					  <select name="countyId">
					  	<%
					  	String tableNameCounties = "counties";
						String sqlCounties = "SELECT * FROM " + tableNameCounties;
						 
						ResultSet rsCounties = MySqlConnection.runQuery(sqlCounties);

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
					  	out.println("		<a href = \"../EditJSPs/editCounty.jsp?id=" + idCounty + "&source=EditJSPs/editAddress.jsp?id=" + addressId + "\" >");
						out.println("<img src = \"../images/editIcon.png\" alt =\"Edit Icon\" width = 20 height = 20>");
						out.println("		</a>");
					  %>
				</td>
			</tr>
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