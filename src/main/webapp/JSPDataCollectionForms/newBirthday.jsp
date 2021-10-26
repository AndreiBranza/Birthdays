<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "../NewBirthday" method = "GET">
		<table>
			<tr>
				<td>
					Person ID
				</td>
				<td>
					<input type="text" name = "idPerson" >
				</td>
			</tr>
			<tr>
				<td>
					Birthday
				</td>
				<td>
					 <input type="text" name = "birthday" value = "YYYY-MM-DD">		  
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Add New Birthday">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>