<%-- 
    Document   : staff
    Created on : May 23, 2024, 5:43:29 PM
    Author     : DELL'
--%>

<%@page import="user_watch.watchDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <script src="https://kit.fontawesome.com/853d2cd4f0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body {
                font-family: serif;
                background-color: #ccc;
                margin: 0;
                padding: 0;
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
                width: 60%;
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
        </style>
    </head>
    <body>
        <%
            String search = "";
            String user = (String) session.getAttribute("user");
            if (session.getAttribute("search") != null) {
                search = (String) session.getAttribute("search");
            }
        %>
    <center>
        <jsp:include page="headershop.jsp"/>
            <br>
            <div class="container">
               <h1 class="animated-gradient-text"> <p> Welcome staff <%= user%> <i class="fa-solid fa-user-tie"></i> </p></h1>  
            </div>
            

            <div class="form-container">
                <form action="addwatch.jsp">
                    Add new watch &nbsp; <input type="submit" value="Add watch"> &nbsp; <i class="fa-solid fa-plus"></i>
                </form>
                <form action="MainController" method="post">
                    Search watch (ID or Name) &nbsp;  <input type="text" name="search" value="<%= search%>" > &nbsp; 
                    <input type="submit" name="action" value="Search watch"> &nbsp;  <i class="fa-solid fa-magnifying-glass"></i> <br> <br><br>
                </form>
            </div>
            <%
                if (request.getAttribute("deleted") != null) {
                    String deleted = (String) request.getAttribute("deleted");
            %>
            <div class="notification"><%= deleted%></div>
            <% }
                if (request.getAttribute("add") != null) {
                    String add = (String) request.getAttribute("add");
            %>
            <div class="notification"><%= add%></div>
            <%
                }
                if (request.getAttribute("update") != null) {
                    String update = (String) request.getAttribute("update");
            %>
            <div class="notification"><%= update%></div>
            <%
                }
                List<watchDTO> list = null;
                if (request.getAttribute("WATCH_LIST") != null) {
                    list = (List<watchDTO>) request.getAttribute("WATCH_LIST");
            %>
            <table>
                <tr>
                    <th>Watch ID</th>
                    <th>img</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Watch Name</th>
                    <th>Year of Production</th>
                    <th>Quantity</th>
                    <th>notSale</th>
                    <th>Action</th>
                </tr>
                <% for (watchDTO i : list) {%>
                <tr>
                    <td><%= i.getWatchId()%></td>
                    <td><img class="watchimg" src="images/<%= i.getImg()%>"></td>
                    <td><%= i.getDescription()%></td>
                    <td><%= i.getPrice()%> $</td>
                    <td><%= i.getWatchName()%></td>
                    <td><%= i.getYearOfProduction()%></td>
                    <td><%= i.getQuantity()%></td>
                    <td><%= i.isNotSale() ? 1 : 0%></td>
                    <td>
                        <a href="#" onclick="doDelete('<%= i.getWatchId()%>')">Delete</a> &nbsp; &nbsp; 
                        <a href="UpdateWatchController?watchId=<%= i.getWatchId()%>">Update</a>
                    </td>
                </tr>
                <% }
                } %>
            </table>

            <div class="form-container">
                <form action="LoginController" method="get">
                    <input type="submit" value="Loggout" > &nbsp; <i class="fa-solid fa-right-from-bracket"></i>
                </form>
            </div>
            <br>
            <div class="imgsetting">
                <%
                    List<watchDTO> list2 = null;
                    if (request.getAttribute("WATCH_LIST") != null) {
                        list2 = (List<watchDTO>) request.getAttribute("WATCH_LIST");

                %>
                <%                for (watchDTO i : list2) {

                %>    
                <img class="watchimg" src="images/<%=i.getImg()%>"> 
                <%
                        }
                    }
                %>
            </div>
    </center>
    <script type="text/javascript">
        function doDelete(watchId) {
            if (confirm("Are you sure to delete this watch with id:" + watchId + "?")) {
                window.location = "MainController?watchId=" + watchId + "&action=deletewatch";
            }
        }
    </script>
    <br> <br>
    <div class="footer"> 
        <jsp:include page="footer.html"/> 
    </div>
</body>
</html>
