<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Compound Bow Emporium</title>
<style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 1em;
            text-align: center;
        }

        nav {
            background-color: #555;
            padding: 1em;
            text-align: center;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 1em;
            margin: 0 1em;
        }

        .hero-section {
            background-image: url('hero-image.jpg');
            background-size: cover;
            color: black;
            text-align: center;
            padding: 4em 0;
        }

        .hero-section h1 {
            font-size: 3em; 
            margin-bottom: 0.5em;

        }

        .cta-button {
            background-color: #ff6600;
            color: #fff;
            padding: 1em 2em;
            text-decoration: none;
            font-size: 1.2em;
            border-radius: 5px;
        }

        .product-section {
            padding: 2em;
            text-align: center;
        }

        .product-card {
            display: inline-block;
            margin: 1em;
            border: 1px solid #ddd;
            padding: 1em;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .footer {
            background-color: #333;
            color: #fff;
            padding: 2em 0;
            text-align: center;
        }
    </style>
</head>
<body>

<%
	if(session.getAttribute("username")!=null & session.getAttribute("password") != null){
		%><!-- HTML -->
		   <header>
        <h1>Compound Bow Emporium - Data Base Manipulation Home</h1>
    </header>

   <%@include file="sitenav.html" %>

    <div class="hero-section">
        <h1>Explore the World of Precision</h1>
        <p>Find the perfect compound bow for your hunting adventures.</p>
        <br>
        <a href="#" class="cta-button">Shop Now</a>
    </div>

    <div class="product-section">
        <div class="product-card">
            <img src="bow1.jpg" alt="Compound Bow 1">
            <h3>Bow Model 1</h3>
            <p>Highly accurate and lightweight. Perfect for beginners.</p>
            <p>$499.99</p>
            <a href="#">View Details</a>
        </div>

        <div class="product-card">
            <img src="bow2.jpg" alt="Compound Bow 2">
            <h3>Bow Model 2</h3>
            <p>Advanced technology for seasoned hunters. Exceptional speed and precision.</p>
            <p>$799.99</p>
            <a href="#">View Details</a>
        </div>

        <div class="product-card">
            <img src="bow3.jpg" alt="Compound Bow 3">
            <h3>Bow Model 3</h3>
            <p>Compact design with adjustable draw weight. Suitable for all skill levels.</p>
            <p>$599.99</p>
            <a href="#">View Details</a>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2023 Compound Bow Emporium. All rights reserved.</p>
    </div>
		
		<%
	}
	else{
		response.sendRedirect("login.jsp");
	}
		


%>
</body>
</html>