<%-- 
    Document   : reserv_roomJSP
    Created on : 02-Sept-2023, 1:25:36 am
    Author     : Sri Sai
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Table Reservation</title>
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
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        int guests = Integer.parseInt(request.getParameter("guests"));
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotel", "root", "30012003");
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate(
                "INSERT INTO table_reservations (name, phone, email, guests, preferred_date, preferred_time) VALUES " +
                "('" + name + "', '" + phone + "', '" + email + "', " + guests + ", '" + date + "', '" + time + "')"
            );

            if (i > 0) { %>
                <div class="result">
                    <span>Reservation Successful</span>
                    <a href="reservation.htm"><button>Head Back</button></a>
                </div>
            <% }
        } catch (Exception ex) {
            out.print(ex);
        }
        out.close();
    %>
</body>
</html>
