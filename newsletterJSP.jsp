<%-- 
    Document   : newsletterJSP
    Created on : 02-Sept-2023, 12:57:22 am
    Author     : Sri Sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .result{
                display:flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            String e=request.getParameter("user_email");
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con=DriverManager.getConnection
                        ("jdbc:mysql://localhost/hotel","root","30012003");          
                Statement stmt=con.createStatement();
                int i=stmt.executeUpdate(
                "insert into newsletter values('"+e+"')");      
                if(i>0){%>
                <div class="result">
                    <span>Subscribbed</span>
                    <a href="newsletter.htm"><button>Head Back</button></a>
                </div>
                <%}
            }
            catch (Exception ex) {
            out.print(ex);
            }
            out.close();
    %>
    </body>
</html>
