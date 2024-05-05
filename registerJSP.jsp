<%-- 
    Document   : registerJSP.jsp
    Created on : 03-Sept-2023, 11:13:49 am
    Author     : Sri Sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Result</title>
</head>
<body>
    <%
        String fullName = request.getParameter("full_name");
        String username = request.getParameter("usr_r");
        String password = request.getParameter("pwd_r");
        String phoneNumber = request.getParameter("contact");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotel", "root", "30012003");
            
            // Hash and salt the password (You should implement this securely in a real application)
            // For simplicity, we're storing the plain text password here.
            
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate(
                "INSERT INTO users (full_name, username, password, phone_number) " +
                "VALUES ('" + fullName + "', '" + username + "', '" + password + "', '" + phoneNumber + "')"
            );

            if (i > 0) {
                %>
                <script>
                    setTimeout(function () {
                        window.location.href = "login.htm"; // Redirect to login page after a delay
                    }, 000); // Delay in milliseconds (3 seconds in this example)
                </script>
                <%
            } else {
                // Registration failed
                out.println("Registration failed!");
            }
            
            con.close();
        } catch (Exception ex) {
            out.println("Error: " + ex.getMessage());
        }
    %>
</body>
</html>

