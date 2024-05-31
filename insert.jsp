<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page  import="java.sql.*" %>
<%@page import="com.ibm.as400.access.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert</title>
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
	{
		//all program logic		
		%>
			<form method="post" action="insert.jsp">
				<fieldset>
					<legend>Insert Course</legend>
					<label>Bow ID:</label>			
					<input type="text" name="bid"><br><br>
					<label>Model Name:</label>			
					<input type="text" name="cname"><br><br>
					<label>Price:</label>			
					<input type="text" name="price"><br><br>
					<label>Bow Draw Weight:</label>			
					<input type="text" name="drawweight"><br><br>
					<input type="reset">
					<input type="submit" value="Add Bow">
				</fieldset>
			</form>
		<% 	
		String bid = request.getParameter("bid");
		String cname = request.getParameter("cname");
		String price = request.getParameter("price");
		String drawweight = request.getParameter("drawweight");
		
		if(bid!=null && cname!=null && price!=null && drawweight!=null)
		{	
		Connection conn = null;
		Statement stmt = null;
		AS400JDBCDriver driver = new AS400JDBCDriver();
		DriverManager.registerDriver(driver);
		String url = "jdbc:as400:deathstar.gtc.edu;prompt=false";
		String un = (String) session.getAttribute("username");
		String ps = (String) session.getAttribute("password");
		
		conn = DriverManager.getConnection(url,un,ps);
		stmt = conn.createStatement();
		String sql = "INSERT INTO COMPBOWS23 VALUES('"+ bid + "','"+
					  cname + "'," + price + ",'" + drawweight + "')"; 
					
		try{
			stmt.executeUpdate(sql);
		}
		catch(Exception e){
			out.println("Error: " + e.getMessage());
		}//catch
	   }//form	
	}//session

%>
</body>
</html>