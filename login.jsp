<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
  background-color: #f0f0f0; 
}

fieldset {
  width: 50%;
  background: #fff; 
  border: 2px solid #3498db; 
  border-radius: 10px; 
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
}

legend {
  padding: 0.5em;
  border: 1px solid #3498db;
  color: #3498db;
  font-size: 1.2em;
  text-align: center;
  background-color: #fff;
  border-radius: 5px;
}

label {
  float: left;
  width: 40%;
  margin-right: 1em;
  padding-top: 0.2em;
  text-align: right;
  font-weight: bold;
  color: #333; 
}

</style>
</head>
<body>
	<form method="post" action="sessionpage.jsp">
		<fieldset>
			<legend> IBM Login Info</legend>
			<label>Username:</label>			
			<input type="text" name="username"><br><br>
			<label>Password:</label>
			<input type="password" name="password"><br><br>
			<input type="reset">
			<input type="submit" value="Login">
		</fieldset>
	</form>
</body>
</html>