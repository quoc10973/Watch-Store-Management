<%-- 
    Document   : updatemobile
    Created on : May 24, 2024, 9:38:03 AM
    Author     : DELL'
--%>


<%@page import="user_watch.watchDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
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
                text-align: start;
                
            }

            .form h1 {
                margin-bottom: 20px;
                font-size: 24px;
                margin-left: 50px;
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
        <%
            watchDTO w = null;
            if (request.getAttribute("watch") != null) {
                w = (watchDTO) request.getAttribute("watch");
            }
        %>
        <div class="container"> 
            <div class="row"> 
            </div>
            <div class="col-md"> &nbsp;</div>
            <div class="row"> 
                <div class="col-md-12">
                    <div class="form">
                        <h1>Update form  <i class="fa-solid fa-pen-to-square"></i> </h1>
                        <form action="UpdateWatchController" method="Post">
                            <div class="input"> 
                            Enter new price: &nbsp; &nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="price"> <br> <br>
                            Enter new description: <input type="text" name="description"><br> <br>
                            Enter new quantity:  &nbsp; &nbsp; &nbsp;<input type="number" name="quantity"><br>  <br><br>
                            Enter notSale  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <select name="notSale"> 
                                <option value="1"> 1 - Sale </option>
                                <option value="0"> 0 - Not Sale </option>
                            </select> 
                            <input type="hidden" name="watchId" value="<%= w.getWatchId()%>"> <br>
                            <input type="hidden" name="watchName" value="<%= w.getWatchName()%>"> <br>
                            <input type="hidden" name="yearOfProduction" value="<%= w.getYearOfProduction()%>"> <br>
                            <input type="hidden" name="discount" value="<%= w.getDiscount() %>"> <br>
                            <input type="submit" name="action" value="Update watch"> &nbsp <i class="fa-solid fa-file-circle-check"></i>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.html"/>
    </body>
</html>
