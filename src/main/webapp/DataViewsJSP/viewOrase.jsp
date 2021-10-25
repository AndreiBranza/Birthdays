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

	String sql = "SELECT ct.id, city, county FROM birthdays.cities as ct, birthdays.counties as co WHERE ct.idCounty = co.id;";
	
	ResultSet rs = MySqlConnection.runQuery(sql);
	
	out.println("<a href=\"../JSPDataCollectionForms/newOrase.jsp\">Add new</a><br>");
	
	out.println("<table border = 0, cellpadding = 5>");
	
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
		out.println("<font color=\"#FFFFFF\"> Delete City");
		out.println("		</td>");
		out.println("		<td width = \"25\" align = center>");
		out.println(" <font color = \"#FFFFFF\"> Edit entry");
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
		out.println(rs.getInt("id") + " ");
		out.println("		</td>");

		out.println("		<td width=\"200\">");
		out.println(rs.getString("city") + " ");
		out.println("		</td>");
		
		out.println("		<td width=\"200\">");
		out.println(rs.getString("county") + " ");
		out.println("		</td>");
		
		out.println("		<td align = center >");
		out.println("<a href = \"../DeleteCity?id=" + rs.getInt("id") + "\">");
		out.println("<img src=\"../images/deleteIcon.png\" alt=\"Delete Icon\" width = 20 height = 20>");
		out.println("</a>");
		out.println("		</td>");
		
		out.println("		<td width=\"25\" >");
		out.println("		<a href = \"../EditJSPs/editCityImproved.jsp?id=" + rs.getInt("id") + "\" >");
		out.println("<img src = \"../images/editIcon.png\" alt = \"Edit Icon\" width = 20 height = 20>");
		out.println("</a>");
		out.println("</td>");
		
		out.println("</tr>");
		
		i++;
	}
	%>
</body>
</html>