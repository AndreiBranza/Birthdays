<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import="tools.MySqlConnection" %>
<%@ page import="tools.BirthdayStringFormatter" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String sql = "SELECT bb.id as id, bp.firstName as firstName, bp.lastName as lastName, bb.birthday FROM birthdays.birthday as bb, birthdays.person as bp WHERE bp.id = bb.idPerson ;";
	//String sql = "SELECT bb.id as id, bp.firstName as firstName, bp.lastName as lastName, DATE_FORMAT (bb.birthday, '%D  %M  %Y') as birthday  FROM birthdays.birthday as bb, birthdays.person as bp WHERE bp.id = bb.idPerson ;";

	/*
	de identificat o posibilitate in java de a formata birthdays sa arate ca pe linia 19.
	hint: sa creez o clasa noua care primeste acel sir de caractere si il formateaza in ce este nevoie
	*/
	
	ResultSet rs = MySqlConnection.runQuery(sql);
	
	out.println("<a href=\"../JSPDataCollectionForms/newBirthday.jsp\">Add new</a><br>");

	
	out.println("<table border = 0, cellpadding = 5>");
	
int i = 0;
	
out.println("	<tr bgcolor =\"#2D44E5\">");
out.println("		<td width=\"25\" align = center>");
out.println(" <font color=\"#FFFFFF\"> ID");
out.println("		</td>");	
out.println("		<td width=\"25\" align = center>");
out.println("<font color=\"#FFFFFF\"> First Name");
out.println("		</td>");
out.println("		<td width=\"25\" align = center>");
out.println("<font color=\"#FFFFFF\"> Last Name");
out.println("		</td>");
out.println("		<td width=\"25\" align = center>");
out.println("<font color=\"#FFFFFF\"> Birthday");
out.println("		</td>");

	while (rs.next()){
		
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
		out.println(rs.getString("firstName") + " ");
		out.println("		</td>");
		
		out.println("		<td width=\"200\">");
		out.println(rs.getString("lastName") + " ");
		out.println("		</td>");
		
		out.println("		<td width=\"200\">");
		String birthday = rs.getString("birthday");
		String formattedBirthday = BirthdayStringFormatter.birthdayStringFormatter(birthday);
		out.println(formattedBirthday + " ");
		out.println("		</td>");
		
		out.println("</tr>");
		
		i++;
	}
	%>
</body>
</html>