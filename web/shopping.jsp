<%-- 
    Document   : shopping
    Created on : May 25, 2024, 2:10:30 AM
    Author     : DELL'
--%>

<%@page import="product.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user_mobile.mobileDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            #cart{
                width: 30px;
                height: 30px;
                margin-left: 10px
            }
            span{
                display: inline;
                width: 200px;
                height: 200px;
                background-color: red;
                opacity: 0.9;
                border-radius: 10px;
                color: white;

                margin-bottom: 10px
            }
            img{
                width: 300px;
                height: 400px;
                margin-top: 0px;
                margin-left: 20px;
            }
            form{
                position: relative;
            }
            body{
                margin: 0;
	font-family: sans-serif;
	font-weight: 100;
            }
        </style>
    </head>
    <body>
    <center>
        <%
            CartDTO cart = (CartDTO) session.getAttribute("CART");
        %>

        <h1>Mobile Shopping</h1>
            
         <%
                    List<mobileDTO> list2 = (List<mobileDTO>) session.getAttribute("data");
                    if(list2 !=null ) {
                        
         %>
         <table border="1px" width="50%">
             <th> Mobile Name  </th>
             <th> Price </th>
             <th> Quantity </th>
             <th> Action </th>
         <%   for (mobileDTO i : list2){
             
         %> 
             <form action="MainController">
             <tr>
             <td> <%= i.getMobileName()%> 
                 <input type="hidden" name="name" value="<%=i.getMobileName()%>">
             </td>          
             <td> <%= i.getPrice() %> $
                 <input type="hidden" name="price" value="<%=i.getPrice()%>">
             </td>  
             <td> 1 
                  <input type="hidden" name="quantity" value="1">
             </td>
             <td> 
                 <input type="submit" name="action" value="Add To Cart">
             </td>
             </tr>
             </form>
         <%
             }
}
             %>
         
         </table>
        <br>
        <form action="user.jsp">
            <input type="submit" value="Go Back">
        </form>
        ***--------------------------------------------------------------------------------------------------------***<br>

        <form action="MainController">
            <input type="submit" name="action" value="View Cart">
            <img id="cart" src="images/images.png"> 
            <%
                if (cart != null) {
            %>
            <span id="quantity"> &nbsp; <%= cart.getCart().size()%> &nbsp; </span>
            <%
                }
            %>
        </form>
<!--                             <img src="https://media.tenor.com/Lb9rxAribsUAAAAi/cat.gif">-->


        <%
            if (request.getAttribute("done") != null) {
                String done = (String) request.getAttribute("done");
        %>
        <h3 style="color: brown"> <%= done%> </h3>
        <%
            }
        %> 
    </center>

</body>
</html>
