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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Dialog - Modal confirmation</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#dialog-confirm" ).dialog({
      resizable: false,
      height: "auto",
      width: 400,
      modal: true,
      buttons: {
        "Delete all items": function() {
          $( this ).dialog( "close" );
        },
        Cancel: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  } );
  </script>
</head>
<body>
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
		out.println("		<a href = \"../DeleteCounty?id=" + rs.getInt("id") + "\" >");
		out.println("<img src=\"../images/deleteIcon.png\" alt=\"Delete Entry Icon\" width = 20 height = 20>");
		out.println("		</a>");
		out.println("		</td>");
		
		out.println("		<td align = center>");
		out.println("<div id=\"dialog-confirm\" title=\"Are you sure you want to delete this item?\">");
		out.println("<p><span class=\"ui-icon ui-icon-alert\" style=\"float:left; margin:12px 12px 20px 0;\"></span>This item will be permanently deleted and cannot be recovered. Are you sure?</p>");
		out.println("</div>");
		out.println("		<a href = \"../EditJSPs/editCounty.jsp?id=" + rs.getInt("id") + "\" >");
		out.println("<img src = \"../images/editIcon.png\" alt =\"Edit Icon\" width = 20 height = 20>");
		out.println("		</a>");
		out.println("		</td>");
		
		
		out.println("</tr>");
		
		i++;
	}
	%>
</body>
</html>