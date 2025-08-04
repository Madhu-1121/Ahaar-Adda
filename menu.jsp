<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String, String>> menuItems = (List<Map<String, String>>) request.getAttribute("menuItems");

    int restaurantId = 0;
    if (request.getAttribute("restaurantId") != null) {
        restaurantId = (Integer) request.getAttribute("restaurantId");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fafafa;
            margin: 0;
            padding: 20px;
        }
        .menu-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
        }
        .item-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .item-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .item-details {
            padding: 15px;
        }
        .item-details h3 {
            margin: 0;
        }
        .item-details p {
            color: #777;
        }
        .item-details .price {
            color: green;
            font-weight: bold;
        }
        .item-details form {
            margin-top: 10px;
        }
        .add-btn {
            background-color: #e63946;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            opacity: 0.8;
            transition: all 0.3s ease;
        }
        .add-btn:hover {
            background-color: #c82333;
            opacity: 1;
            box-shadow: 0 4px 12px rgba(230, 57, 70, 0.4);
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<h2>Menu</h2>

<div class="menu-container">
<%
    if (menuItems != null) {
        for (Map<String, String> item : menuItems) {
%>
    <div class="item-card">
        <img src="Images/<%= item.get("imageUrl") %>" alt="Food">
        <div class="item-details">
            <h3><%= item.get("name") %></h3>
            <p><%= item.get("description") %></p>
            <p class="price">₹ <%= item.get("price") %></p>
            <form action="CartServlet" method="post">
                <input type="hidden" name="menuId" value="<%= item.get("id") %>">
                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                <button type="submit" class="add-btn">+ Add to Cart</button>
            </form>
        </div>
    </div>
<%
        }
    }
%>
</div>

</body>
</html>
