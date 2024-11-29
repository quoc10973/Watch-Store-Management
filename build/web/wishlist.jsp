<%-- 
    Document   : wishlist
    Created on : Jun 2, 2024, 3:40:46 PM
    Author     : DELL'
--%>

<%@page import="wishlist.WishList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wish List</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <script src="https://kit.fontawesome.com/853d2cd4f0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body{
                font-family: serif;
                text-align: center;
                background-color: #ffffff;
            }
            .animated-gradient-text {
                font-size: 25px;
                font-weight: 900;
                background: linear-gradient(270deg, #ff6ec4, #7873f5, #7bdff2, #f7f881);
                background-size: 800% 800%;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                animation: gradientAnimation 8s ease infinite;
                text-transform: capitalize;        
            }

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
            a{
                text-decoration: none;
                color: black;
                font-weight: 100;
            }
            a:hover {
                text-decoration: none;
                color: #dc3545;
            }
            .navbar{
                background-color: blueviolet;
                width: 100%;
                background-color: #660066;
            }

            header{
                background-color: #660066;;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 15px;
                text-align: left;
            }

            th {
                background-color: #f8f9fa;
            }

            td {
                background-color: #fff;
            }

            table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            table tr:hover {
                background-color: #ddd;
            }

            input[type="submit"] {
                background-color: #dc3545;
                color: white;
                border: none;
                padding: 10px 20px;
                text-decoration: none;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 4px;
            }

            input[type="submit"]:hover {
                background-color: #c82333;
            }

            h4 {
                margin-top: 20px;
            }
            img.watchimg {
                width: 70px;
                height: 70px;
            }
            a.back {
                display: inline-block;
                padding: 10px 20px;
                color: #ffffff;
                background-color: #007bff; /* Bootstrap primary color */
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                transition: background-color 0.3s ease, color 0.3s ease;
                margin-bottom: 20px;
            }

            a.back:hover {
                background-color: #0056b3; /* Darker shade of blue */
                color: #ffffff;
            }
            .logo{
                width: 70px;
                height: 40px;
            }
            footer {
                background-color: #f1f1f1;
                padding: 10px 0;
                text-align: center;
            }
            h1{
                color: #c82333
            }
            .social ul{
                margin-top: 20px;
                display: flex; 
                justify-content: space-around;
            }
            #contact {
                display: flex;
                justify-content: space-around;
                flex-wrap: wrap;
                padding: 20px;
            }

            .showroom {
                flex: 1 1 300px;
                margin: 10px;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .showroom h3 {
                margin-top: 0;
                font-size: 1.2em;
                color: #333;
            }

            .showroom p {
                margin: 5px 0;
                font-size: 1em;
                color: #555;
            }

            .showroom p::before {
                margin-right: 5px;
            }

            .showroom p:first-of-type::before {
                content: "📍";
            }

            .showroom p:nth-of-type(2)::before {
                content: "📞";
            }

            .showroom p:last-of-type::before {
                content: "🕒";
            }
        </style>
    </head>
    <body>
        <%
            String user = (String) session.getAttribute("user");
        %>
        <jsp:include page="headershop.jsp"/>
        <br>
        <div class="container"> 
            <div class="row">
                <div class="col-md-12">  
                    <h1><i>My Wish List</i> <i class="fa-regular fa-heart"></i> </h1>
                    <h4 class="animated-gradient-text"> <p> Welcome <%= user%> <i class="fa-regular fa-user"></i> </p></h4> 
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <%
                        List<WishList> list = null;
                        if (request.getAttribute("WISHLIST") != null) {
                            list = (List<WishList>) request.getAttribute("WISHLIST");
                        }
                        if (list != null) {
                    %>
                    <table border="1px" width="80%" style="background-color: cornsilk">
                        <tr>
                            <th>User Name</th>
                            <th> Image </th>
                            <th> Watch Name </th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Year of Production</th>
                            <th>Action</th>
                        </tr>
                        <%                for (WishList i : list) {
                        %>
                        <form action="MainController"> 
                            <tr>
                                <td> <%= i.getuId()%> </td>
                                <td> <img class="watchimg" src="images/<%=i.getImage()%>"> </td>
                                <td> <%= i.getpName()%> </td>
                                <td> <%= i.getDescription()%> </td>
                                <td> <%= i.getpPrice()%> $ </td>
                                <td> <%= i.getYearOfProduction()%> </td>
                            <input type="hidden" name="uId" value="<%= i.getuId()%>">
                            <input type="hidden" name="pName" value="<%= i.getpName()%>">
                            <input type="hidden" name="watchId" value="<%= i.getpId()%>">
                            <input type="hidden" name="userId" value="<%= user%>">
                            <td> 
                                <input type="submit" name="action" value="Delete">
                                <input type="submit" name="action" value="Buy Now">
                            </td>
                            </tr>
                        </form>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 style="color: green"> ${removed} </h4> 
                    <a class="back" href="ListWatchController"> Go back </a>
                </div>
            </div>
        </div>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div  class="social">
                        <ul>
                            <li> <a class="social-link" href="#"><i class="fa-brands fa-facebook"></i> &nbsp; Facebook </a> </li>
                            <li> <a class="social-link" href="#"><i class="fa-brands fa-square-instagram"></i> &nbsp; Instagram </a> </li>
                            <li> <a class="social-link" href="#"><i class="fa-brands fa-square-x-twitter"></i> &nbsp; X(Twitter) </a> </li>
                            <li> <a class="social-link" href="#"><i class="fa-brands fa-square-threads"></i> &nbsp; Thread </a> </li>
                            <li> <a class="social-link" href="#"><i class="fa-brands fa-tiktok"></i> &nbsp; Tiktok </a> </li>
                            <li> <a class="social-link"href="#"><i class="fa-brands fa-square-threads"></i> &nbsp; Thread </a> </li>
                        </ul> 
                    </div>   
                </div>
            </div>
        </div>
        <div class="section2">
            <jsp:include page="section.jsp"/>
        </div>
        <div class="footer"> 
            <jsp:include page="footer.html"/> 
        </div>
    </body>
</html>
