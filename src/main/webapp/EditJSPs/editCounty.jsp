<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="tools.MySqlConnection" %>
<%@ page import="tools.Validation" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String source = request.getParameter("source");
	//pot face asa..dar nu mi se pare ok..mai bine adaug hiddenul daca este cazul pe la linia 57
	//if( source == null || "null".equals(source) )
	//{
	//	source = "";
	//}
	// este necesar un select care in functie de id sa-mi returneze numele judetului
		//System.out.println(source);
	String sql = "SELECT county FROM birthdays.counties WHERE birthdays.counties.id = " + id;
	
	//trebuie sa ii gasesc o modalitate de a rula sql-ul pentru a imi retunrna numele
	//de cautat cum sa update cu un jsp
	//apeleaza MySqlConnection.run....
	ResultSet rs = MySqlConnection.runQuery(sql);
	rs.next();
	
	String result = rs.getString(1);
	//System.out.println(result);
		
%>
	<form action = "../EditCounty" method = "GET">
		<table>
			<tr>
				<td>
					Edit County Name
				</td>
				<td >
					<input type="text" name = "newStringValue" value = <%= result %> >
					
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Edit County Name">
				</td>
			</tr>
		</table>
		
		<input type="hidden" name = "idValue" value = <%= id %> >
		<%
			//constat ca aceasta conditie source != null && !"null".equals(source) && !source.trim().isEmpty() este de doua ori prin proiectul meu..
			//atunci o extrag intr-o clasa utilitara
			if( Validation.isSourceValid(source) )
			{
				out.print("<input type=\"hidden\" name = \"source\" value = \"" + source + "\">");
			}
		%>
		
	</form>
</body>
</html>