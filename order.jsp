<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmed</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #fff0f5, #f0fff0);
            text-align: center;
            padding: 100px 20px;
            position: relative;
        }

        .confirmation {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            display: inline-block;
            animation: fadeIn 1s ease-out;
        }

        h2 {
            color: #28a745;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .sparkle {
            font-size: 40px;
            animation: sparkle 1s ease-in-out infinite;
        }

        a {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
            background-color: #f44336;
            color: white;
            padding: 12px 28px;
            border-radius: 8px;
            font-size: 16px;
            transition: background 0.3s;
        }

        a:hover {
            background-color: #d32f2f;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes sparkle {
            0%, 100% { color: #f1c40f; transform: scale(1); }
            50% { color: #ff9800; transform: scale(1.2); }
        }
    </style>
</head>
<body>

    <div class="confirmation">
        <div class="sparkle">✨</div>
        <h2>Thank you! Your order has been placed successfully.</h2>
        <div class="sparkle">✨</div>
        <a href="index.jsp">Back to Home</a>
    </div>

</body>
</html>