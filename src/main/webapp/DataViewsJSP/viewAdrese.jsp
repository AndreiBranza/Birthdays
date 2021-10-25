<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="tools.MySqlConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
	String sql = "SELECT ba.id as idAddress, bcty.city as cityAddress, bc.county as countyAddress, street FROM birthdays.address as ba, birthdays.cities as bcty, birthdays.counties as bc " +
					"WHERE bcty.id = ba.idCity AND bcty.idCounty = bc.id ORDER BY RIGHT(LEFT(bcty.city, 3), 1) " ;
	
	ResultSet rs = MySqlConnection.runQuery(sql);
	
	out.println("<a href=\"../JSPDataCollectionForms/newAddress.jsp\">Add new</a><br>");
	
	out.println("<table border = 0>");
	
	int i = 0;
	
out.println("	<tr bgcolor =\"#2D44E5\">");
	out.println("		<td width=\"25\" align = center>");
	out.println(" <font color=\"#FFFFFF\"> ID");
	out.println("		</td>");	
	out.println("		<td width=\"25\" align = center>");
	out.println("<font color=\"#FFFFFF\"> City");
	out.println("		</td>");
	out.println("		<td width=\"25\" align = center>");
	out.println("<font color=\"#FFFFFF\"> County");
	out.println("		</td>");
	out.println("		<td width=\"25\" align = center>");
	out.println("<font color=\"#FFFFFF\"> Address");
	out.println("		</td>");
	out.println("		<td width=\"25\" align = center>");
	out.println("<font color=\"#FFFFFF\"> Delete Entry");
	out.println("		</td>");
	out.println("		<td width=\"25\" align = center>");
	out.println("<font color=\"#FFFFFF\"> Edit entry");
	out.println("		</td>");
out.println("</tr>");
	
	while (rs.next())
	{
		
		if (i%2 == 0)
		{
			out.println("	<tr bgcolor =\"#FFAAAA\">");
		}
		else 
		{
			out.println("	<tr bgcolor=\"#AAAAFF\">");		
		}
		
		out.println("		<td width=\"25\" align = center>");
		out.println(rs.getInt("idAddress") + " ");
		out.println("		</td>");

		out.println("		<td width=\"200\">");
		out.println(rs.getString("cityAddress") + " ");
		out.println("		</td>");
		
		out.println("		<td width=\"200\">");
		out.println(rs.getString("countyAddress") + " ");
		out.println("		</td>");
		
		out.println("		<td width=\"200\">");
		out.println(rs.getString("street") + " ");
		out.println("		</td>");
		
		out.println("		<td align = center>");
		//trebuie sa afisez iconita de delete si sa o linkuiesc cu servlet-l de deleteAddress
		out.println(		"<a href = \"../DeleteAddress?id=" + rs.getInt("idAddress") + "\">");
		out.println("<img src=\"../images/deleteIcon.png\" alt=\"Delete Entry Icon\" width = 20 height = 20>");
		out.println("		</a>");
		out.println("		</td>");
		
		out.println("		<td width=\"200\">");
		//out.println("		<a href = \"../EditJSPs/editAddress.jsp?id=" + rs.getInt("idAddress") + "\" >");
		out.println("<img src = \"../images/editIcon.png\" alt =\"Edit Icon\" width = 20 height = 20>");		out.println("		</td>");
		
			out.println("</tr>");
		
		i++;
	}
	%>
</body>
</html>