<%-- 
    Document   : loginJSP
    Created on : 03-Sept-2023, 11:13:27 am
    Author     : Sri Sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Result</title>
</head>
<body>
    <%
        String username = request.getParameter("usr_l");
        String password = request.getParameter("pwd_l");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotel", "root", "30012003");
            
            // Hash and salt the password and compare it with the stored hash in the database (for security)
            // For simplicity, we're comparing plain text passwords here.
            
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(
                "SELECT * FROM users WHERE username='" + username + "' AND password='" + password + "'"
            );

            if (rs.next()) {
                // Login successful
                %>
                <script>
                    window.location.href = "home.html";
                </script>
                <%
            } else {
                // Login failed
                out.println("Login failed! Please check your username and password.");
            }
            
            con.close();
        } catch (Exception ex) {
            out.println("Error: " + ex.getMessage());
        }
    %>
</body>
</html>

