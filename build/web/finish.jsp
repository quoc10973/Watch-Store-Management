<%-- 
    Document   : finish
    Created on : Jun 15, 2024, 3:21:01 PM
    Author     : DELL'
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finish Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <script src="https://kit.fontawesome.com/853d2cd4f0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body {
                font-family: serif;
                background-color: #ccc;
                margin: 0;
                padding: 0;
                text-align: center;
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
                width: 70%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: cornsilk;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #50b3a2;
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
                color: #50b3a2;
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
                background-color: #f1f1f1;
                padding: 10px 0;
                text-align: center;
            }
            a {
                text-decoration: none;
                color: #50b3a2;
                font-weight: bold;
            }
            a:hover {
                color: #45a089;
            }
            .shopagain{
                margin: 50px auto 20px;
            }
            .thanks{
                margin-top: 40px;
            }
            .order{
                margin: auto ;
                text-align: center;
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
            List<ProductDTO> order = new ArrayList<>();
            if (session.getAttribute("ORDER") != null) {
                order = (List<ProductDTO>) session.getAttribute("ORDER");
            }
        %>
        <jsp:include page="headershop.jsp"/>
        <div class="container"> 
            <div class="row">
                <div class="col-md-12">  
                    <h1 style="margin-top: 25px"><i>My Cart</i> <i class="fa-regular fa-heart"></i> </h1>
                    <h4 class="animated-gradient-text"> <p> Love You <i class="fa-solid fa-heart"></i> </p></h4> 
                </div>
            </div>
        </div>

        <br>
        <div class="body-chill">
            <div class="thanks">
                <jsp:include page="thankyou.jsp"/> 
            </div>
            <div class="order">
                <p> Your order:
                    <%
                        for (ProductDTO i : order) {
                    %>
                    <%= i.getName()%> x <%=i.getQuantity()%>. 
                    <%
                        }
                    %>
                </P>
            </div>
            <center>
                <a href="GetUserInvoiceController?user=<%= user%>">
                    View your bill history
                </a>
            </center>
            <div class="shopagain">
                <form action="MainController">
                    <input type="submit" name="action" value="Shop again">
                </form> 
            </div>
        </div>
        <div class="section2">
            <jsp:include page="section.jsp"/>
        </div>
        <div class="footer"> <jsp:include page="footer.html"/> </div>
    </body>
</html>
