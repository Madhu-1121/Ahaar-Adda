<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Payment Method</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f1f8e9);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .payment-box {
            background: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 10px 0 5px;
            font-weight: bold;
        }

        select, button {
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }

        button {
            background-color: #4caf50;
            color: white;
            cursor: pointer;
            transition: background 0.3s;
            font-weight: bold;
        }

        button:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

    <div class="payment-box">
        <h2>Select Payment Method</h2>
        <form action="PaymentServlet" method="post">
            <label for="paymentMethod">Payment Method:</label>
            <select name="paymentMethod" id="paymentMethod" required>
                <option value="">--Select--</option>
                <option value="UPI">UPI</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Cash on Delivery">Cash on Delivery</option>
            </select>
            <button type="submit">Pay & Place Order</button>
        </form>
    </div>

</body>
</html>
