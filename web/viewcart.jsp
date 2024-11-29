<%-- 
    Document   : viewcart
    Created on : May 25, 2024, 4:35:12 AM
    Author     : DELL'
--%>

<%@page import="product.CartDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viewcart Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body {
                font-family: serif;
                background-color: #ffffff;
                margin: 0;
                padding: 0;
                text-align: center;
                height: 700px;
            }
            .animated-gradient-text {
                font-size: 20px;
                font-weight: 900;
                background: linear-gradient(270deg, #ff6ec4, #7873f5, #7bdff2, #f7f881);
                background-size: 800% 800%;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                animation: gradientAnimation 8s ease infinite;
                text-transform: uppercase;

            }

            .social ul{
                margin-top: 20px;
                display: flex; 
                justify-content: space-around;
                list-style: none;
            }
            .social ul a{
                margin-top: 20px;
                color: black;
                text-decoration: none;
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
                opacity: 0.9;
                padding: 20px;
                margin-top: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            .notification {
                color: brown;
                font-size: 18px;
                text-align: center;
                margin-top: 20px;
            }
            table {
                width: 95%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: #f1f1f1;  
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
            img.watchimg {
                width: 70px;
                height: 70px;
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
            a {
                text-decoration: none;
                color: black;
                font-weight: bold;
            }
            a:hover {
                color: #45a089;
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
            footer {
                margin-top: 1000px;
                background-color: #f1f1f1;
                padding: 10px 0;
                text-align: center;
            }
            .noti{
                margin-top: 30px;
            }
            .checkout{
                margin-bottom: 150px;
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
            .body-chill{
                border: 1px solid #ddd;
                padding: 10px;
                margin: 1px 0;
                text-align: center;
                transition: box-shadow 0.3s ease, transform 0.3s ease;
                border-radius: 8px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                width: 1450px;
                margin: auto;
            }
        </style>
    </head>
    <body>
        <%
            String user = (String) session.getAttribute("user");
        %>
        <jsp:include page="headershop.jsp"/>
        <div class="container"> 
            <div class="row">
                <div class="col-md-12">  
                    <h1 style="margin-top: 25px"><i>My Cart</i> <i class="fa-solid fa-bag-shopping"></i> </h1>
                    <h4 class="animated-gradient-text"> <p> Welcome <%= user%> <i class="fa-regular fa-user"></i> </p></h4> 
                </div>
            </div>
        </div>
        <br>
        <div class="body-chill">
            <%
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                if (cart != null) {
                    if (cart.getCart().size() > 0) {
            %>
            <table border="1px">
                <tr>
                    <th> Watch name </th>
                    <th> Watch img </th>
                    <th> Description </th>
                    <th> Price </th>
                    <th> Quanity </th>
                    <th> Action </th>
                </tr>
                <%
                    for (ProductDTO i : cart.getCart()) {
                %>
                <form action="MainController"> 
                    <tr>
                        <td> 
                            <%=i.getName()%> 
                            <input type="hidden" name="productName" value="<%=i.getName()%>">
                        </td>
                        <td> <img class="watchimg" src="images/<%= i.getpImage()%>"  </td>
                        <td> <%=i.getpDescription()%>  </td>
                        <td> <%=i.getPrice()%> $ </td>
                        <td> 
                            <input type="number" name="productQuantity" min="1" max="'<%= i.getQuantity()%>" required="" value="<%=i.getQuantity()%>">
                        </td>
                        <td> 
                            <input type="hidden" name="pId" value="<%= i.getpId()%>"> 
                            <input type="submit" name="action" value="Edit"> 
                            <input type="submit" name="action" value="Remove">
                        </td>
                    </tr>
                </form>
                <%
                    }
                %>
            </table>
            <%
                    }
                }
                if (cart == null || cart.getCart().isEmpty()) {
            %>
            <div class="noti">
                <h3 style="color: red">
                    Your cart is empty !!
                </h3> 
            </div>
            <%
                }
                if (cart != null && !cart.getCart().isEmpty()) {
                    float total = cart.totalMoney();
            %>
            <h3 style="color: brown">
                Your total money is: <%= total%> $
            </h3>
            <%
                }
            %>

            <br>
            <h3 style="color: red"> ${requestScope.outOfStock}   </h3>
            <h3 style="color: red"> ${requestScope.error}  </h3>
            <h3 style="color: red"> ${requestScope.editError}  </h3>
            <h3 style="color: red"> ${requestScope.emptyCart}  </h3>
            <%
                if (request.getAttribute("emptyCart") != null) {
            %>
            <script type="text/javascript">
                alert("You haven't added any product yet !!")
            </script>
            <%
                }
            %>
            <h3 style="color: green"> ${requestScope.removed}  </h3>
            <h3 style="color: green"> ${requestScope.edited}  </h3>
            <div class="addmore">
                <form action="MainController">
                    <input type="submit" name="action" value="Add more">
                </form> 
            </div>
            <div class="checkout">
                <form action="BeforeCheckOutController">
                    <input type="submit" name="action" value="Check Out">
                </form> 
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div  class="social">
                        <ul>
                            <li> <a href="#"><i class="fa-brands fa-facebook"></i> &nbsp; Facebook </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-square-instagram"></i> &nbsp; Instagram </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-square-x-twitter"></i> &nbsp; X(Twitter) </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-square-threads"></i> &nbsp; Thread </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-tiktok"></i> &nbsp; Tiktok </a> </li>
                            <li> <a href="#"><i class="fa-brands fa-square-threads"></i> &nbsp; Thread </a> </li>
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
