# Ahaar-Adda

# 🍽️ Ahaar Adda – Online Food Delivery Web Application

Ahaar Adda is a Java-based full-stack online food delivery web app built using **JSP**, **Servlets**, **MySQL**, and **HTML/CSS**. It provides a seamless experience for users to browse restaurants, view menus, add items to cart, and place food orders online — inspired by platforms like Zomato and Swiggy.

---

##  Features

-  User Registration & Login
-  Browse Menus from Restaurants
-  Add Items to Cart
-  Place and View Orders
-  Food Images in Menu
-  Navbar Icons with Interactive UI
-  Mobile Responsive Design

---

##  Tech Stack

| Layer       | Tools / Technologies             |
|-------------|----------------------------------|
| Frontend    | HTML, CSS, JSP                   |
| Backend     | Java (Servlets, JDBC)            |
| Database    | MySQL                            |
| Server      | Apache Tomcat (v10 recommended)  |
| IDE         | Eclipse (Dynamic Web Project)    |

---

##  Project Folder Structure

FoodDeliveryApp
|---src
|  |----main
|  |   |----java
|  |   |   |-----db
|  |   |   |    |----DBConnection.java
|  |   |   |------servlets
|  |   |   |    |-----CartServlet.java
|  |   |   |    |-----LoginServlet.java
|  |   |   |    |-----RegisterServlet.java
|  |   |   |    |-----MenuServlet.java
|  |   |   |    |-----HomeServlet.java
|  |   |   |    |-----OrderServlet.java
|  |   |   |    |-----OrderHistoryServlet.java
|  |   |   |    |-----PaymentServlet.java
|  |   |----webapp
|  |   |   |------Images
|  |   |   |   |----background2.jpeg,restaurant.jpeg,ahaaradda.png etc
|  |   |   |------cart.jsp
|  |   |   |------index.jsp
|  |   |   |------menu.jsp
|  |   |   |------home.jsp
|  |   |   |------login.jsp
|  |   |   |------order.jsp
|  |   |   |------orderHistory.jsp
|  |   |   |------payment.jsp
|  |   |   |------register.jsp
|  |   |   |------restaurant.jsp

---

##  How to Run the Project

1. **Clone or Download** this repository.
2. Import it in **Eclipse** as a **Dynamic Web Project**.
3. Setup Apache **Tomcat v10** as the server.
4. Configure MySQL DB in `DBConnection.java`:
   ```java
   String url = "jdbc:mysql://localhost:3306/food_delivery";
   String user = "your_username";
   String password = "your_password";

5. Create the required MySQL tables (see below).
6. Run the project and access it at:
    http://localhost:8080/FoodDeliveryApp/
