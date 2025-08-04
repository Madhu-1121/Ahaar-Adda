<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ahaar Adda - Home</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/Images/aharadda.png">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #fff4e6, #ffe0f0);
            color: #333;
        }

        header {
            background: white;
            padding: 20px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
        }

        .logo-img {
            display: flex;
            align-items: center;
        }

        .logo-img img {
            width: 48px;
            margin-right: 10px;
        }

        .logo-text {
            font-size: 28px;
            font-weight: bold;
            background: linear-gradient(135deg, #e63946, #ff6b6b, #f06595);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        nav a {
            margin-left: 25px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
            font-size: 16px;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s ease;
            position: relative;
        }

        nav a img {
            margin-right: 6px;
            transition: transform 0.2s ease;
        }

        nav a:hover {
            color: #e63946;
            animation: glow 0.8s ease-in-out infinite alternate;
        }

        nav a:hover img {
            transform: scale(1.2);
        }

        @keyframes glow {
            from { text-shadow: 0 0 5px rgba(255, 100, 100, 0.4); }
            to { text-shadow: 0 0 10px rgba(255, 50, 150, 0.6); }
        }

        .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 60px;
            gap: 60px;
        }

        .text-area {
            flex: 1;
        }

        .text-area h1 {
            font-size: 60px;
            color: #e63946;
            margin-bottom: 20px;
        }

        .text-area h1 span {
            color: #222;
        }

        .text-area p {
            font-size: 18px;
            color: #4b4b4b;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .buttons {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
        }

        .buttons a {
            text-decoration: none;
            padding: 14px 28px;
            border-radius: 30px;
            font-weight: bold;
            font-size: 16px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .btn-primary {
            background: #e63946;
            color: white;
        }

        .btn-primary:hover {
            background: #c92a3b;
        }

        .btn-secondary {
            border: 2px solid #e63946;
            color: #e63946;
            background: transparent;
        }

        .btn-secondary:hover {
            background: #e63946;
            color: white;
        }

        .stars {
            color: #ffc107;
            font-size: 20px;
            margin-bottom: 5px;
        }

        small {
            font-size: 14px;
            color: #555;
        }

        .image-area img {
            width: 520px;
            max-width: 100%;
            display: block;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column-reverse;
                text-align: center;
                padding: 40px 20px;
            }

            .text-area, .image-area {
                max-width: 100%;
            }

            .image-area {
                margin-bottom: 30px;
            }
        }
    </style>
</head>
<body>

<header>
    <div class="logo-img">
        <img src="https://img.icons8.com/color/48/food.png" alt="Ahaar Adda Logo">
        <span class="logo-text">Ahaar Adda</span>
    </div>
    <nav>
        <a href="<%=request.getContextPath()%>/home">
            <img src="https://img.icons8.com/ios-filled/24/home.png" alt="Home"> Home
        </a>
        <a href="<%=request.getContextPath()%>/login.jsp">
            <img src="https://img.icons8.com/ios-filled/24/lock-2.png" alt="Login"> Login
        </a>
        <a href="<%=request.getContextPath()%>/register.jsp">
            <img src="https://img.icons8.com/ios-filled/24/add-user-male.png" alt="Register"> Register
        </a>
        <a href="<%=request.getContextPath()%>/cart.jsp">
            <img src="https://img.icons8.com/ios-filled/24/shopping-cart.png" alt="Cart"> Cart
        </a>
        <a href="<%=request.getContextPath()%>/orderHistory">
            <img src="https://img.icons8.com/ios-glyphs/24/box.png" alt="Orders"> Orders
        </a>
    </nav>
</header>

<div class="container">
    <div class="text-area">
        <h1>Fast <span>Food Delivery</span></h1>
        <p>Enjoy spicy biryani, buttery naan, creamy curries & more — delivered fresh from top Indian restaurants near you.</p>
        <div class="buttons">
            <!-- Make sure restaurantId=1 exists in DB -->
            <a href="<%=request.getContextPath()%>/menu?restaurantId=1" class="btn-primary">Order Now</a>
            <a href="https://www.youtube.com/watch?v=VbgvDrSbW64" class="btn-secondary" target="_blank">Watch Video</a>
        </div>
        <div class="stars">⭐ ⭐ ⭐ ⭐ ⭐</div>
        <small>Loved by 1,500+ foodies across India!</small>
    </div>

    <div class="image-area">
        <img src="<%=request.getContextPath()%>/Images/food-logo.png" alt="Indian Food">
    </div>
</div>

</body>
</html>
