<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page  import="java.sql.*" %>
<%@page import="com.ibm.as400.access.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
<link rel="stylesheet" href="styles.css">
<style>
h2{
		text=shadow: 0px 2px 3px #555; font-size: 40px; font-family: Tahoma;
		font-variant: small-caps; color: green; letter-spacing: 2px;
	}
	h3, p{color: green; font-family: tahoma;}
	h3{font-size: 24px;}
	p{font-size: 0.9em; }`
	fieldset{
		background: url('background.jpg'); border: 1px solid green;
		border-radius: 8px; padding: 1em; width: 500px; margin: 5px;
	}
	legend{
		padding: 0.2em 0.5em; border: 1px solid green; color: green;
		font-size: 0.9em; text-align: right;
	}
	label{
		float: left; width: 40%; margin-right: 0.5em; padding-top: 0.2em;
		text-align: right; font-weight: bold; color:green;
	}
</style>
</head>
<body>
<h2 style ="text-align: center;
    		text-shadow: 0px 2px 3px #555;
    		font-size: 40px;
    		font-family: Tahoma;
    		font-variant: small-caps;
   			color: green;
    		letter-spacing: 2px;">Select From CompBows23 Database Table</h2><!-- Had to add inline css - wasn't applying the css from stylesheet -->
<%@ include file="sitenav.html" %>
<%	
	//check that session attributes are not empty, if empty redirect to login
	if(session.getAttribute("username")!=null && session.getAttribute("password")!=null)
	{//all program logic
		
		%>
			<Form method="post" action="delete.jsp">
			<fieldset>
				<legend>Delete Bow</legend>
				<label>Bow ID:</label>
				<select name="bid">		
		<%
		Connection conn = null;
		Statement stmt = null;
		AS400JDBCDriver driver = new AS400JDBCDriver();
		DriverManager.registerDriver(driver);
		String url = "jdbc:as400:deathstar.gtc.edu;prompt=false";
		String un = (String) session.getAttribute("username");
		String ps = (String) session.getAttribute("password");
		
		conn = DriverManager.getConnection(url,un,ps);
		stmt = conn.createStatement();
		String sql = "SELECT bid FROM COMPBOWS23";
		try{
			ResultSet rst = stmt.executeQuery(sql);			
			
				while(rst.next()){//traverse through data set
					String b = rst.getString(1);
					out.println("<option value='" + b + "'>");
					out.println(b);					
					out.println("</option>");
				}
				
		}
		catch(Exception e){
			out.println("Error: " + e.getMessage());
		}
		%>
		</select>
		<br><br>
		<input type="submit" value="Delete Bow">
		</fieldset>
		</Form>
		<%
		String bid = request.getParameter("bid");
		if(bid!=null){
			sql = "Delete from COMPBOWS23 where bid='" + bid + "'";
			try{
				stmt.executeUpdate(sql);
				response.sendRedirect("delete.jsp");
			}
			catch(Exception e){
				out.println(e.getMessage());
			}
		}
	}

%>
</body>
</html>