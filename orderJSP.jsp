<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Food Order</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .result {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
    <%@page import="java.sql.*" %>
    <%
        String name = request.getParameter("name");
        String orderType = request.getParameter("order-type");
        String deliveryAddress = request.getParameter("address");
        String phone = request.getParameter("phone");
        String[] foodItems = null;
        
        // Check if the "food" parameter is not null before accessing it
        String foodItemsStr = request.getParameter("selected-food-items");
        if (foodItemsStr != null && !foodItemsStr.isEmpty()) {
            foodItems = foodItemsStr.split(", ");
        }
        
        // Read the total cost from the hidden input field
        String totalCostParam = request.getParameter("total-cost");
        
        double totalCost = 0;
        
        // Validate and parse the total cost parameter
        if (totalCostParam != null && !totalCostParam.isEmpty()) {
            try {
                totalCost = Double.parseDouble(totalCostParam);
            } catch (NumberFormatException e) {
                // Handle parsing error (e.g., invalid number format)
                out.print("Invalid total cost format: " + totalCostParam);
            }
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotel", "root", "30012003");
            
            // Create a comma-separated list of selected food items
            String foodItemsStrDB = (foodItems != null) ? String.join(", ", foodItems) : "";
            
            PreparedStatement pstmt = con.prepareStatement(
                "INSERT INTO food_orders (name, order_type, delivery_address, phone, food_items, total_cost) VALUES (?, ?, ?, ?, ?, ?)"
            );
            
            pstmt.setString(1, name);
            pstmt.setString(2, orderType);
            pstmt.setString(3, deliveryAddress);
            pstmt.setString(4, phone);
            pstmt.setString(5, foodItemsStrDB);
            pstmt.setDouble(6, totalCost);
            
            int i = pstmt.executeUpdate();

            if (i > 0) { %>
                <div class="result">
                    <span>Order Placed Successfully</span>
                    <a href="menu_h.htm"><button>Back to Menu</button></a>
                </div>
            <% }
        } catch (Exception ex) {
            out.print(ex);
        }
        out.close();
    %>
</body>
</html>
