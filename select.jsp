<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page  import="java.sql.*" %>
<%@page import="com.ibm.as400.access.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select</title>
<link rel="stylesheet" href="styles.css">
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
		
		Connection conn = null;
		Statement stmt = null;
		
		AS400JDBCDriver driver = new AS400JDBCDriver();
		DriverManager.registerDriver(driver);
		//jdbc:as400
		String url="jdbc:as400:deathstar.gtc.edu;prompt=false";
		String un = (String) session.getAttribute("username");
		String ps = (String) session.getAttribute("password");
		
		conn = DriverManager.getConnection(url,un,ps);
		stmt = conn.createStatement();
		String sql = "SELECT * FROM COMPBOWS23";
		try{
			ResultSet rst = stmt.executeQuery(sql);
			%>
			 <table>
					<tr>
						<th>Bow ID</th>
						<th>Name</th>
						<th>Price</th>
						<th>Draw Weight</th>
					</tr>
			<%
			while(rst.next()){//traverse through data set
				out.println("<tr>");
				out.println("<td>" + rst.getString(1) + "</td>");
				out.println("<td>" + rst.getString(2) + "</td>");
				out.println("<td>$" + rst.getInt(3) + "</td>");
				out.println("<td>" + rst.getInt(4) + " lbs</td>");
				out.println("</tr>");
			}
			
			%>
			</table>
			<%
		}
		catch(Exception e){
			out.println("Error: " + e.getMessage());
		}
		%>
			
			
		<%
		
	}
	else
	{
		response.sendRedirect("login.jsp");
	}

%>
</body>
</html>