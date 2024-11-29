<%-- 
    Document   : manager
    Created on : May 27, 2024, 2:37:44 PM
    Author     : DELL'
--%>

<%@page import="user_watch.watchDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="invoice.invoiceDTO"%>
<%@page import="user_watch.userDTO"%>
<%@page import="wishlist.WishList"%>
<%@page import="wishlist.WishList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body {
                font-family: serif;
                background-color: #ccc;
                margin: 0;
                padding: 0;
                overflow-x: hidden;
            }
            .animated-gradient-text {
                font-size: 50px;
                font-weight: 900;
                background: linear-gradient(270deg, #ff6ec4, #7873f5, #7bdff2, #f7f881);
                background-size: 800% 800%;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                animation: gradientAnimation 8s ease infinite;
                text-transform: uppercase;
                border-bottom: solid 1px;
                border-bottom-style: dashed

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
            .form-container {
                background: #f2f2f2;
                width: 1600px;
                opacity: 0.9;
                padding: 20px;
                margin-top: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .navbar{
                background-color: blueviolet;
                width: 100%;
                background-color: #660066;
            }

            header{
                background-color: #660066;;
            }
            .logo{
                width: 70px;
                height: 40px;
            }
            .form-container form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 10px;
            }
            .form-container input[type="text"] {
                width: 200px;
                padding: 10px;
                margin-right: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .form-container input[type="submit"] {
                padding: 10px 20px;
                background: #50b3a2;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .form-container input[type="submit"]:hover {
                background: #45a089;
            }
            table {
                width: 90%;
                margin: 20px 0px 0px 50px;
                border-collapse: collapse;
                background-color: #ccc;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #7873f5;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            a {
                text-decoration: none;
                color: #dc3545;
                font-weight: bold;
            }
            a:hover {
                color: #660066;
            }
            footer {
                background-color: #f1f1f1;
                padding: 10px 0;
                text-align: center;
            }
            ul{
                margin-right: 60px;
                list-style-type: none;
            }
            .form-style{
                display: flex;
                justify-content: center;
                justify-content: space-around;

            }
            img.watchimg {
                width: 70px;
                height: 70px;
            }
            h4{
                color: #7873f5
            }
            p{
                color: #009933;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
    <center>
        <%
            String search = "";
            String user = (String) session.getAttribute("user");
            if (session.getAttribute("search") != null) {
                search = (String) session.getAttribute("search");
            }

        %>
        <jsp:include page="headershop.jsp"/>
        <br>
        <div class="container">
            <h1 class="animated-gradient-text"> <p> Welcome Admin <%= user%> <i class="fa-solid fa-user-secret"></i> </p></h1>  
        </div>

        <div class="form-container">
            <form action="MainController" method="post">
                Search User &nbsp;  <input type="text" name="search" value="<%= search%>"> &nbsp; 
                <input type="submit" name="action" value="Search user"> &nbsp; <i class="fa-solid fa-magnifying-glass"></i>
            </form> <br>
            <ul>
                <li> <a href="MainController?action=Show Invoice"> 1. Show Invoice </a></li>
                <li> <a href="MainController?action=User wishlist"> 2. Show Wishlist </a></li>
                <li> <a href="MainController?action=Show Product"> 3. Show Product</a></li>
            </ul>


        </div>

        <div class="form-container">
            <h4> ${done}</h4>
            <div>
                <%
                    List<userDTO> list = null;
                    if (request.getAttribute("USER_LIST") != null) {
                        list = (List<userDTO>) request.getAttribute("USER_LIST");

                %>
                <table border="1px" width="60%" style="background-color: cornsilk">
                    <tr>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Password</th>
                        <th>Role</th>
                    </tr>
                    <%                for (userDTO i : list) {
                    %>
                    <tr>
                        <td> <%= i.getUserId()%> </td>
                        <td> <%= i.getFullName()%>  </td>
                        <td> <%= i.getPassword()%> </td>
                        <%
                            if (i.getRole() == 1) {
                        %>
                        <td> Manager </td>  
                        <%  }
                            if (i.getRole() == 0) {
                        %>
                        <td> User </td>  
                        <% }
                            if (i.getRole() == 2) {
                        %>
                        <td> Staff </td> 
                        <%
                                    }
                                }
                            }
                        %>
                    </tr>
                </table>

                <%
                    List<WishList> list2 = null;
                    if (request.getAttribute("WISHLISTDB") != null) {
                        list2 = (List<WishList>) request.getAttribute("WISHLISTDB");

                %>
                <table border="1px" width="60%" style="background-color: cornsilk">
                    <tr>
                        <th>User Id</th>
                        <th>Watch Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Year of Production</th>
                    </tr>
                    <%                for (WishList i : list2) {
                    %>
                    <tr>
                        <td> <%= i.getuId()%> </td>
                        <td> <%= i.getpName()%> </td>
                        <td> <%= i.getDescription()%> </td>
                        <td> <%= i.getpPrice()%> $ </td>
                        <td> <%= i.getYearOfProduction()%> </td>       
                    </tr>
                    <%
                            }
                        }
                    %>
                </table>

                <%
                    List<invoiceDTO> list3 = new ArrayList<invoiceDTO>();
                    if (request.getAttribute("INVOICE_LIST") != null) {
                        list3 = (List<invoiceDTO>) request.getAttribute("INVOICE_LIST");

                %>
                <table border="1px" width="60%" style="background-color: cornsilk">
                    <tr>
                        <th>Invoice Id</th>
                        <th>User ID</th>
                        <th>Total</th>
                        <th>Date Buy</th>
                        <th>Address</th>
                        <th>Phone number</th>
                        <th>City</th>
                        <th colspan="2"> Delivery </th>
                        <th> Action </th>
                    </tr>
                    <%                for (invoiceDTO i : list3) {
                    %>
                    <form action="DeliverStatusController"> 
                        <tr>
                            <td> <%= i.getInvId()%> </td>
                            <td> <%= i.getUserId()%> </td>
                            <td> <%= i.getTotal()%> $ </td>
                            <td> <%= i.getDateBuy()%>  </td>
                            <td> <%= i.getAddress()%> </td> 
                            <td> <%= i.getPhone()%> </td> 
                            <td> <%= i.getCity()%> </td> 
                            <td> <p>Status: 
                                <%
                                if (i.isDelivery()){
                                %>
                                    Delivered
                                <%
                                    }else{
                                %>
                                    Not Delivered Yet
                                <%
                                    }
                                %>
                                </p>
                            </td>
                            <td>
                                Change
                                <select name="status">
                                    <option value="1" > delivered </option>
                                    <option value="0"> not delivered </option>
                                </select>
                            </td>
                        <input type="hidden" name="invoiceId" value="<%= i.getInvId()%>">   
                        <td> <input type="submit" value="Save"> </td>
                        </tr>
                    </form>
                    <%
                            }
                        }

                    %>
                </table>
                <%            List<watchDTO> list4 = new ArrayList<watchDTO>();
                    if (request.getAttribute("WATCH") != null) {
                        list4 = (List<watchDTO>) request.getAttribute("WATCH");
                %>
                <table border="1px" width="60%" style="background-color: cornsilk">
                    <tr>
                        <th>Watch ID</th>
                        <th>Image</th>
                        <th>Watch name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Year production</th>
                        <th>Sale status</th>
                        <th>Discount %</th>
                        <th> Change discount </th>
                    </tr>
                    <%                for (watchDTO i : list4) {
                    %>
                    <form action="ChangeDiscountController">
                        <tr>
                            <td> <input type="hidden" name="watchId" value="<%= i.getWatchId()%>"> <%= i.getWatchId()%> </td>
                            <td> <img class="watchimg" src="images/<%= i.getImg()%>">
                            </td>
                            <td> <%= i.getWatchName()%> </td>
                            <td> <%= i.getDescription()%> $ </td>
                            <td> <%= i.getPrice()%>  </td>
                            <td> <%= i.getQuantity()%> </td> 
                            <td> <%= i.getYearOfProduction()%> </td>     
                            <%
                                if (i.isNotSale()) {
                            %>
                            <td>
                                Yes
                            </td>
                            <%
                            } else {
                            %>
                            <td>
                                No
                            </td>
                            <%
                                }
                            %>
                                <td> <input type="number" name="discount" value="<%= i.getDiscount()%>"></td>                               
                            <td> <input type="submit" name="action" value="Change"></td> 
                    </form>
                    </tr>
                    <%
                            }
                        }

                    %>
                </table>
                <form  action="LoginController" method="get">
                    <input type="submit" value="Loggout">
                </form>
            </div>
        </div>
        <div class="footer"> 
            <jsp:include page="footer.html"/> 
        </div>
    </center>
    <br> 
</body>
</html>
