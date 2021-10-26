<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import="tools.MySqlConnection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!--  aici faci un div -> -->
	<%
		String status = request.getParameter("status");
	
		if (status != null) 
		{
			out.print("The result of Delete action is " + status);	
		}
		
		//aici completezi acel div
	%>
	
	<%	
	String sql =  "SELECT bp.id as idPerson, bp.firstName as firstName, bp.lastName as lastName, bp.email as email, bp.mobileNo as mobileNo, bcty.city as City, bc.county as County, ba.street as Street FROM birthdays.person as bp, birthdays.address as ba, birthdays.cities as bcty, birthdays.counties as bc" 
			+ " WHERE ba.id = bp.idAddress AND ba.idCity = bcty.id AND bcty.idCounty = bc.id";
	
	ResultSet rs = MySqlConnection.runQuery(sql);
	
	out.println("<a href=\"../JSPDataCollectionForms/newPersoane.jsp\">Add new</a><br>");
	
	out.println("<table border = 0, cellpadding = 5>");
	
int i = 0;

out.println("	<tr bgcolor =\"#2D44E5\">");
out.println("		<td align = center>");
out.println(" <font color=\"#FFFFFF\"> ID");
out.println("		</td>");	
out.println("		<td align = center>");
out.println("<font color=\"#FFFFFF\"> First Name");
out.println("		</td>");
out.println("		<td align = center>");
out.println("<font color=\"#FFFFFF\"> Last Name");
out.println("		</td>");
out.println("		<td align = center>");
out.println("<font color=\"#FFFFFF\"> Email");
out.println("		</td>");
out.println("		<td align = center>");
out.println("<font color=\"#FFFFFF\"> Phone Number");
out.println("		</td>");
out.println("		<td align = center>");
out.println("<font color=\"#FFFFFF\"> City");
out.println("		</td>");
out.println("		<td align = center>");
out.println("<font color=\"#FFFFFF\"> County");
out.println("		</td>");
out.println("		<td align = center>");
out.println("<font color=\"#FFFFFF\"> Street");
out.println("		</td>");
out.println("		<td align = center>");
out.println("<font color=\"#FFFFFF\"> Delete");
out.println("		</td>");
out.println("		<td align = center>");
out.println("<font color=\"#FFFFFF\"> Edit");
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
		
		out.println("	<td	white-space = nowrap>");
		out.println(rs.getInt("idPerson") + " ");
		out.println("		</td>");

		out.println("	<td		white-space = nowrap>");
		out.println(rs.getString("firstName") + " ");
		out.println("		</td>");
		
		out.println("	<td		white-space = nowrap>");
		out.println(rs.getString("lastName") + " ");
		out.println("		</td>");
		
		out.println("	<td		white-space = nowrap>");
		out.println(rs.getString("email") + " ");
		out.println("		</td>");
		
		out.println("	<td	white-space = nowrap>");
		out.println(rs.getString("mobileNo") + " ");
		out.println("		</td>");
				
		out.println("	<td	white-space = nowrap>");
		out.println(rs.getString("City") + " ");
		out.println("		</td>");
		
		out.println("	<td white-space = nowrap>");
		out.println(rs.getString("County") + " ");
		out.println("		</td>");
		
		out.println("	<td	white-space = nowrap>");
		out.println(rs.getString("Street") + " ");
		out.println("		</td>");
		
		out.println("		<td align = center>");
		//trebuie sa afisez iconita de delete si sa o linkuiesc cu servlet-l de deleteAddress
		out.println(		"<a href = \"../DeletePerson?id=" + rs.getInt("idPerson")+ "\">");
		out.println("<img src=\"../images/deleteIcon.png\" alt=\"Delete Entry Icon\" width = 20 height = 20>");
		out.println("		</a>");
		out.println("		</td>");
		
		out.println("		<td align = center width = 50>");
		//out.println("		<a href = \"../EditJSPs/editAddress.jsp?id=" + rs.getInt("idAddress") + "\" >");
		out.println("<img src = \"../images/editIcon.png\" alt =\"Edit Icon\" width = 20 height = 20>");
		
		out.println("</tr>");
		
		i++;
	}
	%>
</body>
</html>