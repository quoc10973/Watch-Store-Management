<%-- 
    Document   : user
    Created on : May 24, 2024, 1:13:24 PM
    Author     : DELL'
--%>

<%@page import="product.ProductDTO"%>
<%@page import="user_watch.watchDTO"%>
<%@page import="user_watch.DAO"%>
<%@page import="wishlist.WishList"%>
<%@page import="product.CartDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <script src="https://kit.fontawesome.com/853d2cd4f0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body{
                font-family: serif;
                background-color: #ffffff;
            }
            .animated-gradient-text {
                margin-top: 350px;
                margin-bottom: -300px;
                font-size: 30px;
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
            .navbar{
                background-color: blueviolet;
                width: 100%;
                background-color: #660066;
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
            ul{
                list-style: none;
            }
            ul.product{
                text-align: center;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;

            }
            header{
                background-color: #660066;;

            }
            .search-bar{
                text-align: center;
            }
            .search-bar {
                margin-top: 30px;
                padding: 15px;
            }

            .search-bar h3 {
                margin-bottom: 10px;
            }

            .search-bar input[type="number"] {
                width: 230px;
            }

            .search-bar input[type="submit"] {
                margin-top: 10px;
                padding: 5px 10px;
                background-color: #28a745;
                color: white;
                border: none;
                cursor: pointer;
            }

            .search-bar input[type="submit"]:hover {
                background-color: #218838;
            }
            .logo{
                width: 70px;
                height: 40px;
            }
            .banner{
                margin-top: 10px;
                width: 1200px;
                height: 40px;
                background-color: black;
            }
            .img-banner{
                width: 1518px;
                height: 350px;
            }
            img.watchimg {
                width: 300px;
                height: 300px;
            }
            .span{
                margin-left: 100px;
            }
            img{
                width: 230px;
                height: 230px;
            }
            .shop{
                margin-top: 330px;
            }
            .cart-icon{
                display: flex;
                justify-content: center;
                align-content: center;
                font-size: 40px;
                color: #333;
                margin-top: 50px;
            }
            .your-cart{
                font-family: serif;
                font-size: 25px;
                color: #333;
            }
            .your-wishlist{
                font-family: serif;
                font-size: 25px;
                color: #333;
            }

            .section{
                border: 1px solid #ccc;
                background-color: whitesmoke;
                max-width: 1200px;
                margin: auto;
                padding: 20px;
                margin-bottom: 20px;
                opacity: 0.9;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            }
            #quantity{
                display: inline;
                width: 25px;
                height: 30px;
                font-size: 16px;
                background-color: red;
                opacity: 0.9;
                border-radius: 15px;
                color: white;
            }
            .product {
                list-style: none;
                padding: 0;

            }
            .container{
                width: 1500px;
            }

            .product-item {
                border: 1px solid #ddd;
                padding: 15px;
                margin: 15px 0;
                text-align: center;
                transition: box-shadow 0.3s ease, transform 0.3s ease;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: aliceblue;
            }

            .product-item:hover {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transform: translateY(-5px);
            }

            .product-img img {
                transition: transform 0.3s ease;
            }

            .product-item:hover .product-img img {
                transform: scale(1.1);
            }

            .addcart a, .addtowishlist a {
                display: block;
                background-color: #007bff;
                color: white;
                padding: 10px;
                text-decoration: none;
                margin: 10px 0;
                transition: background-color 0.3s ease;
            }

            .addcart a:hover, .addtowishlist a:hover {
                background-color: #0056b3;
            }
            .product-img img {
                width: 230px;
                height: 230px;
            }

            .product-name {
                font-size: 16px;
                margin: 10px 0;
            }
            
            
            .product-price {
                color: #28a745;
                font-size: 14px;
                margin-bottom: 10px;
            }
            .addcart a {
                text-decoration: none;
                color: white;
                background-color: #007bff;
                padding: 5px 10px;
                display: inline-block;
                margin-top: 10px;
            }

            .addcart a:hover {
                background-color: #0056b3;
            }
            .addtowishlist a {
                text-decoration: none;
                color: white;
                background-color: red;
                padding: 5px 10px;
                display: inline-block;
                margin-top: 10px;
            }

            .addtowishlist a:hover {
                background-color: #0056b3;
            }
            footer {
                background-color: #f1f1f1;
                padding: 10px 0;
                text-align: center;
            }
            .form-container {
                text-align: center;
                margin-top: 20px;
            }

            .form-container input[type="submit"] {
                padding: 5px 10px;
                background-color: #dc3545;
                color: white;
                border: none;
                cursor: pointer;
            }
            .social ul{
                margin-top: 20px;
                display: flex; 
                justify-content: space-around;
            }
            .sold-out{
                color: red;
                text-decoration: line-through;
            }
            .tilte{
                color: #666600;
            }

            #openSidebarBtn {
                margin: 20px;
                padding: 10px 20px;
                font-size: 16px;
            }

            .sidebar {
                height: 100%;
                width: 0;
                position: fixed;
                top: 0;
                right: 0;
                background-color: #ddd;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
                color: white;
            }

            .sidebar h2, .sidebar p {
                margin-left: 20px;
                margin-right: 20px;
            }

            #closeSidebarBtn {
                position: absolute;
                top: 20px;
                left: 20px;
                padding: 10px 20px;
                font-size: 16px;
            }
            .invoice{
                text-align: center;
            }
            .banner-container {
                overflow: hidden;
                width: 100%;
                height: 300px; /* Chiều cao của banner */
                position: relative;
            }

            .banner2 {
                display: flex;
                width: 300%; /* Gấp 3 lần chiều rộng container để chứa 3 hình ảnh */
                animation: moveBanner 50s linear infinite;
            }

            .banner2 img {
                width: 400px;
                height: 300px;

            }

            @keyframes moveBanner {
                0% {
                    transform: translateX(0);
                }
                100% {
                    transform: translateX(-100%);
                }
            }
            head{
                border: 1px solid #ddd;
                padding: 15px;
                margin: 15px 0;
                text-align: center;
                transition: box-shadow 0.3s ease, transform 0.3s ease;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            .product-sale{  
                position: absolute;
                background-color: #cc0000;
                border-radius: 8px;
                width: 55px;
                height: 40px;
                margin-top: -175px;
                margin-left: 4px;
                opacity: 0.9;
            }
            .product-sale p{
                margin-top: 2px;
                color: white;
            }
            .product-price-discount {
                color: #ff3333;
                font-size: 14px;
                margin-bottom: 10px;
                text-decoration: line-through;
            }
        </style>
    </head>
    <body>
        <%
            String user = (String) session.getAttribute("user");
            DAO dao = new DAO();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            List<WishList> wishlist = dao.showWishList(user);
            String min = "0";
            String max = "0";
            if (session.getAttribute("min") != null) {
                min = (String) session.getAttribute("min");
            }
            if (session.getAttribute("max") != null) {
                max = (String) session.getAttribute("max");
            }
        %>
        <jsp:include page="headershop.jsp"/>
        <div class="banner">
            <img class="img-banner"  src="images/Logo-The-Gioi-Dong-Ho-Dep-Desktop.jpg">
        </div>
        <div class="container"> 
            <div class="col-12">
                <h4 class="animated-gradient-text"> <p> Welcome <%= user%> <i class="fa-regular fa-user"></i> </p></h4> 
            </div>
        </div>

        <div class="shop">
<!--        <h1 style="color: green"> Welcome user <%= user%> </h1> <br>-->
            <div class="container">
                <div class="section">
                    <div class="row">
                        <div class="search-bar col-md-6">
                            <h3> Filter By Price <i class="fa-solid fa-hand-holding-dollar"></i> </h3>
                            <form action="MainController" method="post">
                                From <input type="number" name="min" value="<%= min%>"> <br>
                                To &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="max" value="<%= max%>"> <br>
                                <input type="submit" name="action" value="Search price"> &nbsp; <i class="fa-solid fa-magnifying-glass"></i> <br> <br><br>
                            </form>
                        </div>

                        <div class="col-md-6">
                            <div class="cart-icon" >
                                <a class="your-cart" href="viewcart.jsp"> Your cart </a> &nbsp; <i class="fa-solid fa-cart-shopping"></i>
                                <%
                                    if (cart != null) {
                                %>
                                <span id="quantity"> &nbsp; <%= cart.getCart().size()%> &nbsp; </span>
                                <%
                                    }
                                %>
                            </div>
                            <div class="cart-icon">
                                <a class="your-wishlist" href="WistListController?uId=<%=user%>"> Your wishlist </a> &nbsp; <i class="fa-brands fa-gratipay"></i>
                                <%
                                    if (wishlist != null && wishlist.size() != 0) {
                                %>
                                <span id="quantity"> &nbsp; <%= wishlist.size()%> &nbsp; </span>
                                <%
                                    }
                                %>
                            </div>
                        </div>

                    </div>
                </div>
                <br>
                <div class="banner-container">
                    <div class="banner2">
                        <img src="images/ogival-og358.jpg" alt="Image 1" n> 
                        <img src="images/jumbo-5402ST.jpg" alt="Image 2">
                        <img src="images/sky-moon-tourbillon.jpg" alt="Image 4">
                        <img src="images/nautilus-5990-1400G-001.jpg" alt="Image 5">
                        <img src="images/ogival-og358.jpg" alt="Image 6">
                        <img src="images/rolex-gmt-master-ii.jpg" alt="Image 7">
                        <img src="images/ogival-og358.jpg" alt="Image 1">
                        <img src="images/jumbo-5402ST.jpg" alt="Image 2">
                        <img src="images/sky-moon-tourbillon.jpg" alt="Image 4">
                        <img src="images/nautilus-5990-1400G-001.jpg" alt="Image 5">
                        <img src="images/ogival-og358.jpg" alt="Image 6">
                        <img src="images/rolex-gmt-master-ii.jpg" alt="Image 7">
                    </div>
                </div>

                <div class="container">
                    <div class="head">
                        <div class="tilte">
                            <div class="col-md-12">
                                <h4 style="margin-top: 20px;" class="tilte"> OUR PRODUCTS <i class="fa-brands fa-slack"></i> </h3>
                            </div>
                        </div>

                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <p style="color: green"> ${done} </p>
                                    <p style="color: red"> ${fail} </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <a class="invoice"  href="GetUserInvoiceController?user=<%= user%>"> Your invoice history &nbsp;   <i class="fa-regular fa-file-lines"></i> </a>
                    </div>
                </div>



                <div class="col-md-12">
                    <ul class="product">
                        <%
                            List<watchDTO> list2 = null;
                            if (request.getAttribute("data") != null) {
                                list2 = (List<watchDTO>) request.getAttribute("data");
                                for (watchDTO i : list2) {
                        %>
                        <li>
                            <div class="product-item">
                                <div class="product-img">
                                    <img class="product-img-src" src="images/<%=i.getImg()%>">
                                </div>
                                <div class="product-name">
                                    <%=i.getWatchName()%> 
                                </div>
                                 <% if (i.getDiscount() > 0) {
                                %> 
                                <div class="product-price-discount">
                                    <%=i.getPrice()%>$
                                </div>
                                <div class="product-price">
                                    Sale: <%=i.getPrice() - (i.getPrice() *  i.getDiscount()/100) %> $
                                </div>
                                <%
                                    }else{
                                %>
                                <div class="product-price">
                                    <%=i.getPrice()%>$
                                </div>
                                <% 
                                }
                                %>
                                <div class="product-name">
                                    Stock: <%=i.getQuantity()%>
                                </div>
                                
                                <% if (i.getDiscount() > 0) {
                                %> 
                                <div class="product-sale">
                                    <p> -   <%=i.getDiscount()%> % </p>
                                </div>
                                <%
                                    }
                                %>
                                <%
                                    if (i.getQuantity() > 0 && i.isNotSale()) {
                                %>
                                <div class="addcart">
                                    <a href="AddToCartController?watchId=<%=i.getWatchId()%>&price=<%=i.getPrice() - (i.getPrice() *  i.getDiscount()/100) %>" > Add to cart &nbsp; <i class="fa-solid fa-cart-plus"></i> </a>
                                </div>
                                <div class="addtowishlist">
                                    <a href="AddToWishlistController?watchId=<%=i.getWatchId()%>&userId=<%=user%>" > &nbsp;&nbsp;&nbsp; Favorite &nbsp;&nbsp;&nbsp;<i class="fa-regular fa-heart"></i> </a>
                                </div>
                                <%
                                } else {
                                %>
                                <h4 class="sold-out"> Sold Out !! </h4>
                                <%
                                    }
                                %>
                            </div>        
                            <form>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                </div>

            </div>

        </div>
        <div class="form-container">
            <form action="LoginController" method="get">
                <input type="submit" value="Loggout" > &nbsp; <i class="fa-solid fa-right-from-bracket"></i>
            </form>
        </div>
        <br>
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
