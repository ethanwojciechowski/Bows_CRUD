<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String uname = request.getParameter("username");
String pass = request.getParameter("password");

if(uname!=null && uname.length() != 0 && pass!=null && pass.length() !=0)
{
	session.setAttribute("username", uname);
	session.setAttribute("password", pass);
	response.sendRedirect("home.jsp");
}
else
{
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>