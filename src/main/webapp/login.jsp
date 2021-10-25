<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	table
	{
		background-color:lightgreen;
		
		border-radius:5%;
	}
</style>
</head>
<body>
	<form action="LogIn" method="POST">
		<table> <!--  w3School -->
			<tr>
				<td>
					UserName
				</td>
				<td>
					<input type="text" name="userName">
				</td>
			</tr>
			<tr>
				<td>
					Password
				</td>
				<td>
					<input type="password" name="password">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="LogIn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>