<%-- 
    Document   : AddMobile
    Created on : May 24, 2024, 1:18:12 AM
    Author     : DELL'
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            @keyframes gradientAnimation {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }

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
                margin: 40px auto;
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
                text-align: start;
                text-align: justify;

            }

            .form h1 {
                margin-bottom: 20px;
                font-size: 24px;
                margin-left: 50px;
            }

            .form input[type="text"],
            .form input[type="password"] {
                width: 470px; /* Adjust the width as needed */
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
            .input{
                text-align: start;
                margin-left: 50px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="form">
                    <h1>Add New Watch</h1>
                    <form action="MainController" method="post">
                        Enter Watch ID:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                        <input type="text" name="watchId"> <br>                      
                        Enter Description:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; 
                        <input type="text" name="description"> <br>
                        Enter Price:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; 
                        <input type="number" name="price"> <br>
                        Enter img location:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; 
                        <input type="text" name="img"> <br>
                        Enter Watch Name:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                        <input type="text" name="watchName"> <br>
                        Enter Year Of Production: <input type="number" name="yearOfProduction"> <br>
                        Enter Quantity:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                        <input type="number" name="quantity"> <br>
                        Enter notSale:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                        <select name="notSale">
                            <option value="1"> 1 - Sale </option>
                            <option value="0"> 0 - Not Sale </option>
                        </select> <br> <br>
                        <input type="submit" name="action" value="Add watch">
                    </form>
                    </div>
                    <%
                        if (request.getAttribute("loi") != null) {
                            String loi = (String) request.getAttribute("loi");
                    %>
                    <h3 style="color: red"> <%= loi%> </h3>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
                <jsp:include page="footer.html"/>
    </body>
</html>
