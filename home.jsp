<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, db.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - Restaurants</title>
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f8f8;
}

.rotating-bg2 {
	background-image:
		url('<%=request.getContextPath()%>/Images/background2.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
	z-index: -1;
	opacity: 0.25;
}

.navbar {
	background-color: rgba(0, 0, 0, 0.75);
	padding: 18px 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	position: sticky;
	top: 0;
	z-index: 999;
}

.navbar-left span {
	font-size: 40px;
	font-weight: bold;
	color: #ffcb05;
	text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.7);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

h2 {
	color: #fff;
	text-align: center;
	margin-top: 40px;
	background-color: rgba(0, 0, 0, 0.7);
	display: inline-block;
	padding: 12px 35px;
	border-radius: 10px;
	font-size: 28px;
}

.container {
	padding: 40px 20px;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 30px;
}

.restaurant {
	background-color: #ffffffcc;
	padding: 15px;
	border-radius: 12px;
	width: 300px;
	text-align: center;
	box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
}

.restaurant img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border-radius: 10px;
	margin-bottom: 10px;
}

.restaurant h3 {
	margin: 8px 0;
	color: darkgreen;
	font-size: 20px;
}

.restaurant p {
	margin: 4px 0;
	color: #555;
	font-size: 14px;
}

.restaurant a {
	text-decoration: none;
	color: white;
	background-color: green;
	padding: 8px 16px;
	border-radius: 6px;
	display: inline-block;
	margin-top: 12px;
	font-size: 14px;
}

.restaurant a:hover {
	background-color: black;
}

.rating-badge {
	background-color: #f8a805;
	color: #fff;
	font-size: 13px;
	font-weight: bold;
	padding: 4px 8px;
	border-radius: 8px;
	display: inline-block;
	margin-bottom: 6px;
}

@media ( max-width : 768px) {
	.container {
		padding: 20px 10px;
	}
	.restaurant {
		width: 90%;
	}
	.navbar-left span {
		font-size: 28px;
		text-align: center;
	}
	h2 {
		font-size: 22px;
	}
}
</style>
</head>
<body>

	<!-- Background -->
	<div class="rotating-bg2"></div>

	<!-- Top Navbar -->
	<header class="navbar">
		<div class="navbar-left">
			<span>🍛🥘Welcome to Ahaar Adda🥘🍛</span>
		</div>
	</header>

	<!-- Heading Row: Available Restaurants + Search -->
	<div
		style="display: flex; justify-content: space-between; align-items: center; padding: 0 40px; margin-top: 40px; flex-wrap: wrap;">
		<h2 style="margin: 0; font-size: 28px;">
			Available Restaurants <span style="font-size: 30px;">🍽️</span>
		</h2>

		<div style="text-align: right;">
			<p
				style="margin: 4px 0; color: black; font-style: italic; font-size: 14px;">
				"Enjoy tasty dishes from your favorite places!"</p>
			<input type="text" placeholder="Search restaurants..."
				style="padding: 8px 16px; border-radius: 20px; border: 1px solid #ccc; font-size: 14px; width: 250px;">
		</div>
	</div>



	<!-- Restaurant Cards -->
	<div class="container">
		<%
            List<Map<String, String>> restaurants = (List<Map<String, String>>) request.getAttribute("restaurants");
            if (restaurants != null && !restaurants.isEmpty()) {
                for (Map<String, String> r : restaurants) {
        %>
		<div class="restaurant">
			<img
				src="<%= request.getContextPath() %>/Images/<%= r.get("imageUrl") %>"
				alt="Restaurant Image" />
			<div class="rating-badge">
				<%= r.get("rating") != null ? r.get("rating") : "N/A" %>
				★
			</div>
			<h3><%= r.get("name") %></h3>
			<p>
				<strong>Address:</strong>
				<%= r.get("address") %></p>
			<p>
				<strong>Phone:</strong>
				<%= r.get("phoneNumber") %></p>
			<a href="menu?restaurantId=<%= r.get("id") %>">View Menu</a>
		</div>
		<%
                }
            } else {
        %>
		<p style="color: red; font-size: 16px;">No restaurants available.</p>
		<%
            }
        %>
	</div>

</body>
</html>
