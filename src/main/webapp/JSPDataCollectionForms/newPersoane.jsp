<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "view.AddressViewHtml" %>
<%@ page import = "tools.MySqlConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
		label 
		{
    		display: block;
    		font: 1rem 'Fira Sans', sans-serif;
		}

		input, label 
		{
    		margin: .4rem 0;
		}
</style>
</head>
<body>
	<% //am citit pe net ca by default the method attribute is set to GET %>
	<%/*
	Data from a form is sent to the action URL when a submit button is clicked.
	https://careerkarma.com/blog/html-form-action/
	Cum se trimite informatia de aici in servlet cand pare ca de fapt servlet-ul ia
	informatia de aici, avand in vedere configuratia din headerul servlet-ului
	@WebServlet(name = "newAddress", urlPatterns = { "/newAddress" })
	Putem efectua acest proces invers?
			Adica sa punem in acest jsp la action sa trimita informatia catre
			servlet iar in servlet sa lasam headerul gol?
	*/
	%>
	<form action = "../NewPerson">
		<table>
			<tr>
				<td>
					First Name
				</td>
				<td>
					<input type = "text" name = "firstName">
				</td>
			</tr>
			<tr>
				<td>
					Last Name
				</td>
				<td>
					<input type = "text" name = "lastName">
				</td>
			</tr>
			<tr>
				<td>
					Email
				</td>
				<td>
					<input type = "text" name = "email">
				</td>
			</tr>
			<tr>
				<td>
					Mobile Number
				</td>
				<td>
					<input type = "tel" name = "phoneNumber">
				</td>
			</tr>
			<tr>
				<td>
					<% //problema aici este ca ar fi aiurea pentru utilizator
					//sa il pun sa aleaga id-ul unei adrese din lista.
					//in plus, aceasta alegere presupune ca utilizatorul a introdus deja
					//adresa pentru aceasta persoana
					//daca nu, inseamna ca acum trebuie ori sa lase campul liber ori 
					//sa schimbe meniul si sa introduca o noua adresa%>
					Address
				</td>
				<td>

					<%
					  	AddressViewHtml addressView = new AddressViewHtml();
						addressView.drawSelector( out );
					%>	

					<a href="../JSPDataCollectionForms/newAddress.jsp">add</a>  
				</td>
			</tr>
			<tr>
				<td>
					Select birthday
				</td>
				<td>
					<input type="date" id="start" name="birthday_yyyy_mm_dd" value="2018-07-22" min="1920-01-01" max="2004-12-31">
				</td>
			</tr>
			<tr>
				<td >
					<input type = "submit" value = "Add new person" >
				</td>
				<td>
					<a href = "../homePage.jsp"> Back to homepage</a>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>