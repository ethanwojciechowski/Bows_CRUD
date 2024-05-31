<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
	h2{
		text=shadow: 0px 2px 3px #555; font-size: 40px; font-family: Tahoma;
		font-variant: small-caps; color: green; letter-spacing: 2px;
	}
	h3, p{color: green; font-family: tahoma;}
	h3{font-size: 24px;}
	p{font-size: 0.9em; }`

</style>
</head>
<body>
<h2>Gateway Courses Application</h2>
<%@ include file="sitenav.html" %>
<%	
	//check that session attributes are not empty, if empty redirect to login
	//all pages will have this logic 
	if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
	{//all program logic
		out.println("<h3>Information</h3>");
		out.println("<p>Gateway Course App to insert, delete, select " +
					"and update courses</p>");
		%>
			<hr>
			Copyright &copy; 2023<br>
			All rights reserved! &trade; GTC Inc.
		<%
		
	}
	else
	{
		response.sendRedirect("login.jsp");
	}

%>
</body>
</html>