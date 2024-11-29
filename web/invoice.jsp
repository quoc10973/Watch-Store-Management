<%-- 
    Document   : invoice
    Created on : Jun 26, 2024, 1:30:09 AM
    Author     : DELL'
--%>

<%@page import="invoice.invoiceDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice Page</title>
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
                height: 600px;
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
                margin-top: 40px;
                margin-bottom: 290px;
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
                position: fixed;
                bottom: 0;
            }

            a {
                text-decoration: none;
                color: #50b3a2;
                font-weight: bold;
            }
            a:hover {
                color: #45a089;
            }
            h3{
                margin-top: 50px;
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
            h4{
                color: tomato
            }
        </style>
    </head>
    <jsp:include page="headershop.jsp"/>
    <h3> Your invoice history </h3>
    <%
        String user = (String) session.getAttribute("user");

        List<invoiceDTO> list = (List<invoiceDTO>) session.getAttribute("INVOICE");
        if (list != null && list.size() > 0) {
    %>
    <table>
        <tr>
            <th>Invoice ID</th>
            <th>User ID</th>
            <th>Total</th>
            <th>Date buy</th>
            <th>Address</th>
            <th>Phone</th>
            <th>City</th>
        </tr>
        <% for (invoiceDTO i : list) {
        %>
        <tr>
            <td><%= i.getInvId()%></td>
            <td><%= i.getUserId()%></td>
            <td><%= i.getTotal()%> $</td>
            <td><%= i.getDateBuy()%></td>
            <td><%= i.getAddress()%></td>
            <td><%= i.getPhone()%></td>
            <td><%= i.getCity()%> </td>        
        </tr>

        <%
            }
        %>
        <div class="shopagain">
            <a href="ListWatchController"> Go back </a>
        </div>
        <a href="DownLoadUserBillController?user=<%= user%>" download="bill.txt" >
            Download your bill
        </a>
    </table>

    <%
    } else {
    %>

    <h4 style="margin: 60px"> You have not bought anything yet</h4>
     <div class="shopagain">
            <a href="ListWatchController"> Go back </a>
        </div>
    <% }
    %>
    <div class="section2">
        <jsp:include page="section.jsp"/>
    </div>  
    <div class="footer"> 
        <jsp:include page="footer.html"/> 
    </div>
    <body>

    </body>
</html>
