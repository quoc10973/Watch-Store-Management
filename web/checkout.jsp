<%-- 
    Document   : checkout
    Created on : Jun 15, 2024, 8:21:34 PM
    Author     : DELL'
--%>

<%@page import="product.ProductDTO"%>
<%@page import="product.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <script src="https://kit.fontawesome.com/853d2cd4f0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            body {
                font-family: serif;
                background-color: #f1f1f1;
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
            .form-contact .container {
                max-width: 1000px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
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
            h4 {
                color: #007bff;
                text-align: center;
                margin-bottom: 20px;
            }

            /* Input field styling */
            input[type="number"], input[type="text"], select {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                display: block;
                margin-left: auto;
                margin-right: auto;
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
            .fomr-contact{
                border: 1px solid #ddd;
                padding: 15px;
                margin: 15px 0;
                text-align: center;
                transition: box-shadow 0.3s ease, transform 0.3s ease;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .cart{
                padding: 7px;
                text-align: start;
                border: solid 1px #ddd;
            }
            p{
                color: #dc3545;
            }
            h5{
                margin-top: -20px;
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
                    <h1><i>Please give us your information </i> <i class="fa-solid fa-circle-question"></i> </h1>
                    <h4 class="animated-gradient-text"> <p> &nbsp; <i class="fa-solid fa-heart"></i> </p></h4> 
                </div>
            </div>
        </div>
        <br>
        <div class="form-contact">
            <%
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                if (cart != null) {
                    if (cart.getCart().size() > 0) {
            %>
            <div class="fomr-contact"> 
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <form action="MainController">
                                <h4> How to contact you? </h4>
                                <input type="number" placeholder="Your phone number" name="phone" required> <br>    
                                <input type="text" placeholder="Your address" name="address" required> <br>
                                <select name="city" required>
                                    <option value="An Giang">An Giang</option>
                                    <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                                    <option value="Bắc Giang">Bắc Giang</option>
                                    <option value="Bắc Kạn">Bắc Kạn</option>
                                    <option value="Bạc Liêu">Bạc Liêu</option>
                                    <option value="Bắc Ninh">Bắc Ninh</option>
                                    <option value="Bến Tre">Bến Tre</option>
                                    <option value="Bình Định">Bình Định</option>
                                    <option value="Bình Dương">Bình Dương</option>
                                    <option value="Bình Phước">Bình Phước</option>
                                    <option value="Bình Thuận">Bình Thuận</option>
                                    <option value="Cà Mau">Cà Mau</option>
                                    <option value="Cần Thơ">Cần Thơ</option>
                                    <option value="Cao Bằng">Cao Bằng</option>
                                    <option value="Đà Nẵng">Đà Nẵng</option>
                                    <option value="Đắk Lắk">Đắk Lắk</option>
                                    <option value="Đắk Nông">Đắk Nông</option>
                                    <option value="Điện Biên">Điện Biên</option>
                                    <option value="Đồng Nai">Đồng Nai</option>
                                    <option value="Đồng Tháp">Đồng Tháp</option>
                                    <option value="Gia Lai">Gia Lai</option>
                                    <option value="Hà Giang">Hà Giang</option>
                                    <option value="Hà Nam">Hà Nam</option>
                                    <option value="Hà Nội">Hà Nội</option>
                                    <option value="Hà Tĩnh">Hà Tĩnh</option>
                                    <option value="Hải Dương">Hải Dương</option>
                                    <option value="Hải Phòng">Hải Phòng</option>
                                    <option value="Hậu Giang">Hậu Giang</option>
                                    <option value="Hòa Bình">Hòa Bình</option>
                                    <option value="Hưng Yên">Hưng Yên</option>
                                    <option value="Khánh Hòa">Khánh Hòa</option>
                                    <option value="Kiên Giang">Kiên Giang</option>
                                    <option value="Kon Tum">Kon Tum</option>
                                    <option value="Lai Châu">Lai Châu</option>
                                    <option value="Lâm Đồng">Lâm Đồng</option>
                                    <option value="Lạng Sơn">Lạng Sơn</option>
                                    <option value="Lào Cai">Lào Cai</option>
                                    <option value="Long An">Long An</option>
                                    <option value="Nam Định">Nam Định</option>
                                    <option value="Nghệ An">Nghệ An</option>
                                    <option value="Ninh Bình">Ninh Bình</option>
                                    <option value="Ninh Thuận">Ninh Thuận</option>
                                    <option value="Phú Thọ">Phú Thọ</option>
                                    <option value="Phú Yên">Phú Yên</option>
                                    <option value="Quảng Bình">Quảng Bình</option>
                                    <option value="Quảng Nam">Quảng Nam</option>
                                    <option value="Quảng Ngãi">Quảng Ngãi</option>
                                    <option value="Quảng Ninh">Quảng Ninh</option>
                                    <option value="Quảng Trị">Quảng Trị</option>
                                    <option value="Sóc Trăng">Sóc Trăng</option>
                                    <option value="Sơn La">Sơn La</option>
                                    <option value="Tây Ninh">Tây Ninh</option>
                                    <option value="Thái Bình">Thái Bình</option>
                                    <option value="Thái Nguyên">Thái Nguyên</option>
                                    <option value="Thanh Hóa">Thanh Hóa</option>
                                    <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                                    <option value="Tiền Giang">Tiền Giang</option>
                                    <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
                                    <option value="Trà Vinh">Trà Vinh</option>
                                    <option value="Tuyên Quang">Tuyên Quang</option>
                                    <option value="Vĩnh Long">Vĩnh Long</option>
                                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                    <option value="Yên Bái">Yên Bái</option>
                                </select><br>
                                <input type="submit" name="action" value="Place order">
                            </form>
                        </div>
                        <div class="col-md-6">
<form action="MainController">
                                <h4> Bill detail </h4>
                                <h5> Total $ <input type="number" readonly value="<%= cart.totalMoney()%>">  </h5><br>   
                            </form>
                            <div class="cart">
                                Your cart:
                                <%
                                    for (ProductDTO i : cart.getCart()) {
                                %>
                                <p style="margin-left: 30px;"><%= i.getName()%> x <%= i.getQuantity()%> </p>
                                <%
                                    }
                                %> 
                            </div>
                            

                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="shopagain">
                <form action="MainController">
                    <input type="submit" name="action" value="Shop again">
                </form> 
            </div>
            <div class="section2">
            <jsp:include page="section.jsp"/>
        </div>
            <div class="footer"> <jsp:include page="footer.html"/> </div>

    </body>
</html>
