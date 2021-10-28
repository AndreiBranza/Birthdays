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
	<style>
		.popup
		{
			background-color:#FAAC58;
			
			width:200px;
			height:130px;
			
			position:absolute;
			top:100px;
			left:100px;
			
			display:none;
		}
	</style>
</head>
<body>
	<script>
		var whatToDelete = '0';
	</script>
	<div class="popup" id="popup">
		<table>
			<tr>
				<td colspan=2 height=20 bgcolor="#B45F04">
					Delete
				</td>
			</tr>
			<tr>
				<td colspan=2 height=50 >
					Do you want to delete the record with id
					<span id="whatToDeleteValue"></span>
					?
				</td>
			</tr>
			<tr>
				<td align="center">
					<!--  onclick="../DeleteCounty?id=" + rs.getInt("id") + "\ -->
					<button onclick="window.location.href='../DeleteCounty?id=' + whatToDelete;">Delete</button>
				</td>
				<td align="center">
					<button onclick="setDisplay( 'none' );">Cancel</button>
				</td>
			</tr>
		</table>
	</div>
	<% 
	String sql = "SELECT * FROM birthdays.counties";
	 
	ResultSet rs = MySqlConnection.runQuery(sql);
	out.println("<a href=\"../JSPDataCollectionForms/newCounty.jsp\">Add new</a><br>");
	out.println("<table border = 0, cellpadding = 5>");
	
	int i = 0;
	
	out.println("	<tr bgcolor =\"#2D44E5\">");
	out.println("		<td width=\"25\" align = center>");
	out.println(" <font color=\"#FFFFFF\"> ID");
	out.println("		<td width=\"25\" align = center>");
	out.println("<font color=\"#FFFFFF\"> County");
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
		out.println(rs.getInt("id") + " ");
		out.println("		</td>");

		out.println("		<td width=\"200\">");
		out.println(rs.getString("county") + " ");
		out.println("		</td>");
		
		out.println("		<td align = center>");
		out.println("		<a onclick=\"whatToDelete = " + rs.getInt("id") + "; setWhatToDeleteValue( whatToDelete ); setDisplay('block');\" >");
		out.println("<img src=\"../images/deleteIcon.png\" alt=\"Delete Entry Icon\" width = 20 height = 20>");
		out.println("		</a>");
		out.println("		</td>");
		
		out.println("		<td align = center>");
		out.println("		<a href = \"../EditJSPs/editCounty.jsp?id=" + rs.getInt("id") + "\" >");
		//out.println("<form action = \"../EditJSPs/editCounty.jsp?id=" + rs.getInt("id") + "\">");
		out.println("<img src = \"../images/editIcon.png\" alt =\"Edit Icon\" width = 20 height = 20>");
		//out.println("<button type = \"submit\" class = \"btn btn-secondary\" data-dismiss = \"modal\">Edit</button>");
		//out.println("<button type = \"submit\" name = \"delete_student\" class = \"btn btn-primary\"> Delete</button>");
		out.println("		</a>");
		out.println("</form>");
		out.println("		</td>");
		
		
		out.println("</tr>");
		
		i++;
	}
	%>
	
	<script>
		function setDisplay( value)
		{
			var divPopup = document.getElementById('popup');
			divPopup.style.display = value;
		}
		
		function setWhatToDeleteValue( value)
		{
			var divWhatToDelete = document.getElementById("whatToDeleteValue");
			divWhatToDelete.innerHTML = value;
		}
	</script>
</body>
</html>