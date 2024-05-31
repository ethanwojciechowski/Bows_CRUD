<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page  import="java.sql.*" %>
<%@page import="com.ibm.as400.access.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Data</title>

</head>
<body>
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
		//read data coming from client
		String bid = request.getParameter("bid");
		String cname = request.getParameter("cname");
		String price = request.getParameter("price");
		String drawweight = request.getParameter("drawweight");
		
		if(bid!=null && cname!=null && price!=null && drawweight!=null)
		{
		String sql = "UPDATE COMPBOWS23 set CNAME='" +
				  cname + "', price=" + price + ", drawweight='" + drawweight + "'"+
				 "WHERE bid ='" + bid + "'";
		try{
			stmt.executeUpdate(sql);
			response.sendRedirect("update.jsp");
		}
		catch(Exception e){
			out.println("Error: " + e.getMessage());
		}//catch
      }
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
	


%>
</body>
</html>