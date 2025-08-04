<%@ page import="java.sql.*,db.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Restaurants</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .navbar {
            background-color: #ffffff;
            padding: 15px;
            border-bottom: 2px solid #ddd;
            margin-bottom: 20px;
            text-align: center;
        }
        .navbar a {
            margin: 0 15px;
            text-decoration: none;
            color: darkgreen;
            font-weight: bold;
        }
        h2 {
            color: darkgreen;
            text-align: center;
        }
        .restaurant-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .restaurant-card {
            width: 300px;
            margin: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 15px;
            background-color: #fff;
            box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
        }
        .restaurant-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
            margin-top: 10px;
        }
        .restaurant-card h3, .restaurant-card p {
            margin: 8px 0;
            color: #333;
        }
        .restaurant-card a {
            display: inline-block;
            margin-top: 10px;
            color: darkgreen;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <a href="home">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="menu.jsp">Menu</a>
        <a href="cart.jsp">Cart</a>
        <a href="order.jsp">Order</a>
    </div>

    <h2>Available Restaurants</h2>

    <div class="restaurant-container">
        <%
            Connection con = DBConnection.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM restaurant");
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
        %>
            <div class="restaurant-card">
                <p><strong>ID:</strong> <%= rs.getInt("restaurantId") %></p>
                <h3><%= rs.getString("name") %></h3>
                <p><strong>Address:</strong> <%= rs.getString("address") %></p>
                <p><strong>Phone:</strong> <%= rs.getString("phoneNumber") %></p>
                <img src="Images/<%= rs.getString("imageUrl") %>" alt="Restaurant Image">
                <a href="menu.jsp?rid=<%= rs.getInt("restaurantId") %>">View Menu</a>
            </div>
        <%
                }
            } else {
        %>
            <p style="color: red; text-align: center;">Database connection failed.</p>
        <%
            }
        %>
    </div>

</body>
</html>
