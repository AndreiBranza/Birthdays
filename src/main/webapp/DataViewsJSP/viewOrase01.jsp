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
	String tableName = "cities";
	String sql = "SELECT * FROM " + tableName;
	
	ResultSet rs = MySqlConnection.runQuery(sql);
	
	out.println("<a href=\"../JSPDataCollectionForms/newOrase.jsp\">Add new</a><br>");
	
	out.println("<table border = 0>");
	
	int i = 0;
	
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
		out.println(rs.getInt("idCounty") + " ");
		out.println("		</td>");
		
		out.println("</tr>");
		
		i++;
	}
	%>
</body>
</html>