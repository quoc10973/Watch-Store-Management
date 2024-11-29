<%-- 
    Document   : register
    Created on : Jun 18, 2024, 6:54:54 PM
    Author     : DELL'
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body {
                background: linear-gradient(-45deg, #ff9a9e, #fad0c4, #fad0c4, #fbc2eb);
                background-size: 400% 400%;
                animation: gradientAnimation 15s ease infinite;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 20px;
            }

            .col-md {
                flex: 1;
                padding: 10px;
            }

            .form {
                background-color: #f1f1f1;
                padding: 80px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .form h1 {
                margin-bottom: 20px;
                font-size: 24px;
            }

            .form input[type="text"],
            .form input[type="password"] {
                width: 50%; /* Adjust the width as needed */
                padding: 5px; /* Reduce padding to make the input smaller */
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px; /* Adjust font size as needed */
            }
            .form input[type="number"] {
                width: 50%; /* Adjust the width as needed */
                padding: 5px; /* Reduce padding to make the input smaller */
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px; /* Adjust font size as needed */
            }

            .form input[type="submit"] {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                background-color: #007bff;
                color: white;
                cursor: pointer;
            }

            .form input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .form input[type="checkbox"] {
                margin-right: 10px;
            }

            .form h3 {
                color: red;
                margin-top: 20px;
            }

            img {
                max-width: 100%;
                height: auto;
                display: block;
                margin: 0 auto;
            }
            footer {
                background-color: #f1f1f1;
                padding: 10px 0;
                text-align: center;
            }
        </style>
    </head>
    <body>
             <div class="container"> 
            <div class="row">
            </div>
            <div class="col-md"> &nbsp;</div>

            <div class="row"> 
                <div class="col-md-12">
                    <div class="form">
                        <h1>REGISTER</h1>
                        <form action="MainController" method="post">
                            Enter user ID: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <input type="text" name="userID"> <br><br>
                            Enter your full name: &nbsp;&nbsp;   <input type="text" name="fullname"> <br><br>
                            Enter password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="number" name="password"> <br><br>
                            <input type="submit" name="action" value="Register">
                        </form>
                        <br>
                        <%
                            if (request.getAttribute("error") != null) {
                                String loi = (String) request.getAttribute("error");
                        %>  
                        <h3 style="color: red"> <%= loi%> </h3>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer"> 
            <jsp:include page="footer.html"/> 
        </div>
    </body>
</html>
