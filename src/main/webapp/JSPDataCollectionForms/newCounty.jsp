<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "../newCounty" method = "GET">
		<table>
			<tr>
				<td>
					County Name
				</td>
				<td>
					<input type="text" name = "name">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Add New County">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>