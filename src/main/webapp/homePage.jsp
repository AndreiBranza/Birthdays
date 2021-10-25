<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="tools.MySqlConnection" %>
<%@ page import = "java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
  margin: 0;
} 
.wrapper{
  min-height: 100vh;
  background: #ccc;
  display: flex;
  flex-direction: column;
}
.header, .footer{
  height: 50px;
  background: #666;
  color: #fff;
}
.content {
  display: flex;
  flex: 1;
  background: #999;
  color: #000; 
}
.columns{
  display: flex;
  flex:1;
}
.main{
  flex: 1;
  order: 2;
  background: #eee;
}
.sidebar-first{
  width: 10%;
  background: #ccc;
  order: 1;
}
.month{
	text-transform: uppercase;
	text-indent: -50px;	
	letter-spacing: 3px;
	line-height: 30px;
	text-shadow: 4px 2px gray;
	font-weight: bold;
	
}
</style>
</head>
<body>

<%-- The purpose of this jsp is to display the homepage of the user interface --%>
<%-- We are going to need 3 buttons: Add, Edit, Delete
	 For the delete button we will be needing a prompt to ask user if they are sure they want to delete the respective user.
	 In the center, we will need to display a title "Anniversaries" and under it, subtitles for each month. 
	 Under each subtitle, indented, the users will be displayed by name sorted in alphabetical order.
 --%>

<div class="wrapper">
  <header class="header">Header: Fixed height</header>
  <section class="content">
    <div class="columns">
      <main class="main">Content: Flexible width
      	<%-- here we will display the user information
      		 connect to the db and bring all of the persons (just persons) from the schema and display them alphabetically by first name
      		 actually easier would be to sort them already in the db base and then just retrieve and display them "ORDER BY"
      		 Also, selecting a user will enable the 2 buttons on the left hand side menu : Edit and Delete
      		 The add button will be permanently available for selection
      	 --%>
      	 
      	 <%-- SELECT firstName, lastName FROM birthdays.person, birthdays.birthday WHERE EXTRACT(MONTH FROM birthdays.birthday.birthday) = THE DESIRED month AND birthdays.person.id = birthdays.birthday.idPerson; --%>
      	 
      	 <%
      	 	int month = 1;
      				 //here i need to format the month so that it is a bit indented. so i need to write it in html
      				 while (month <= 12)
      				 {

      					switch (month)
      					{
      					case  1: 
      						out.println("<div class = \"month\">" + "January" + "</div>");
      						break;
      					case  2: 
      						out.println("<div class = \"month\">" + "February" + "</div>");
      						break;
      					case  3: 
      						out.println("<div class = \"month\">" + "March" + "</div>");
      						break;
      					case  4: 
      						out.println("<div class = \"month\">" + "April" + "</div>");
      						break;
      					case  5: 
      						out.println("<div class = \"month\">" + "May" + "</div>");
      						break;
      					case  6: 
      						out.println("<div class = \"month\">" + "June" + "</div>");
      						break;
      					case  7: 
      						out.println("<div class = \"month\">" + "July" + "</div>");
      						break;
      					case  8: 
      						out.println("<div class = \"month\">" + "August" + "</div>");
      						break;
      					case  9: 
      						out.println("<div class = \"month\">" + "September" + "</div>");
      						break;
      					case 10: 
      						out.println("<div class = \"month\">" + "October" + "</div>");
      						break;
      					case 11: 
      						out.println("<div class = \"month\">" + "November" + "</div>");
      						break;
      					case 12: 
      						out.println("<div class = \"month\">" + "December" + "</div>");
      						break;
      					}
      					
   
      					String sql = "SELECT firstName, lastName FROM birthdays.person, birthdays.birthday" +
      							 " WHERE EXTRACT(MONTH FROM birthdays.birthday.birthday) =" + month +" AND birthdays.person.id = birthdays.birthday.idPerson ORDER BY firstName";
      					ResultSet firstAndLastName = MySqlConnection.runQuery(sql);
      				
      					while (firstAndLastName.next())
      					{
      						out.println(firstAndLastName.getString(1) + " " + firstAndLastName.getString(2));
      					}
      					month++;
      				 }
      	 %>
      </main>
      <aside class="sidebar-first">Sidebar first: Fixed width
      		<%-- here we will display the 3 buttons --%>
      		<form action = "JSPDataCollectionForms/newPersoane.jsp">
      			<input type = "submit" value = "Add New Person" name = "addButton">
      		</form>
      		<form action = "JSPDataCollectionForms/editPerson.jsp"> <%-- this editPerson.jsp needs to be created --%>
      			<input type = "submit" value = "Edit Selected Person" name = "editButton">
      		</form>
      		<form action = "DeletePerson.java">
      			<input type = "submit" value = "Delete Selected Person" name = "deleteButton"> <%-- this button needs to send the id of the selected person to the servlet so the person can be deleted from the database --%>
      		</form>
      </aside>
    </div>
  </section>
  <footer class="footer">Footer: Fixed height</footer>
</div>

</body>
</html>
