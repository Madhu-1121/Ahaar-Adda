<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,db.DBConnection" %>
<%
    Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement(
        "SELECT ci.id, m.name, m.price, ci.quantity, (m.price * ci.quantity) AS total " +
        "FROM cart_item ci JOIN cart c ON ci.cart_id = c.id " +
        "JOIN menu m ON ci.menu_id = m.id WHERE c.user_id = ?"
    );
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();

    double grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f44336;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .total {
            text-align: right;
            margin-right: 10%;
            font-size: 18px;
            margin-top: 20px;
        }
        .btn-submit {
            display: block;
            margin: 20px auto;
            background-color: #ff6347;
            color: white;
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #e6492d;
        }
        .btn-remove {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<h2>Your Cart</h2>

<table>
    <tr>
        <th>Item</th>
        <th>Price (₹)</th>
        <th>Quantity</th>
        <th>Total (₹)</th>
        <th>Action</th>
    </tr>

    <%
        while (rs.next()) {
            double total = rs.getDouble("total");
            grandTotal += total;
    %>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getDouble("price") %></td>
        <td><%= rs.getInt("quantity") %></td>
        <td><%= total %></td>
        <td>
            <form action="CartServlet" method="post" style="margin:0;">
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="cartItemId" value="<%= rs.getInt("id") %>">
                <input type="submit" value="Remove" class="btn-remove">
            </form>
        </td>
    </tr>
    <%
        }
        rs.close();
        ps.close();
        con.close();
    %>
</table>

<%
    if (grandTotal > 0) {
%>
    <p class="total">Grand Total: ₹ <strong><%= grandTotal %></strong></p>

    <form action="payment.jsp" method="post">
        <input type="hidden" name="amount" value="<%= grandTotal %>">
        <input type="submit" class="btn-submit" value="Place Order">
    </form>
<%
    } else {
%>
    <p class="total" style="text-align:center;color:gray;">Your cart is empty.</p>
<%
    }
%>

</body>
</html>
