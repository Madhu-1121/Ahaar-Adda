<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String, String>> orderList = (List<Map<String, String>>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fffaf0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            color: #d62828;
            margin-bottom: 30px;
        }

        .order-box {
            background: #fff;
            padding: 20px 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.06);
            position: relative;
            transition: transform 0.2s;
        }

        .order-box:hover {
            transform: scale(1.01);
        }

        .order-box h4 {
            margin: 0;
            font-size: 20px;
            color: #333;
        }

        .order-details {
            margin-top: 10px;
            color: #555;
            font-size: 15px;
        }

        .order-details span {
            display: inline-block;
            margin-right: 30px;
        }

        .empty {
            text-align: center;
            font-size: 18px;
            color: gray;
            margin-top: 50px;
        }

        .delete-form {
            position: absolute;
            top: 20px;
            right: 25px;
        }

        .delete-btn {
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

        .delete-btn:hover {
            background-color: #c82333;
            opacity: 1;
            box-shadow: 0 4px 12px rgba(230, 57, 70, 0.4);
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<h2>Your Order History</h2>

<%
    if (orderList != null && !orderList.isEmpty()) {
        for (Map<String, String> order : orderList) {
%>
    <div class="order-box">
        <h4><%= order.get("menuName") %> - ₹<%= order.get("price") %> × <%= order.get("quantity") %></h4>
        <div class="order-details">
            <span><strong>Restaurant:</strong> <%= order.get("restaurantName") %></span>
            <span><strong>Order ID:</strong> <%= order.get("orderId") %></span>
            <span><strong>Date:</strong> <%= order.get("order_date") %></span>
        </div>

        <form class="delete-form" method="post" action="orderHistory">
            <input type="hidden" name="orderId" value="<%= order.get("orderId") %>"/>
            <button type="submit" class="delete-btn" onclick="return confirm('Are you sure to delete this order?')">
                🗑 Delete
            </button>
        </form>
    </div>
<%
        }
    } else {
%>
    <div class="empty">You have no orders yet.</div>
<%
    }
%>

</body>
</html>
