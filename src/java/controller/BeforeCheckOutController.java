/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import product.CartDTO;
import product.ProductDTO;
import user_watch.DAO;
import user_watch.watchDTO;

/**
 *
 * @author DELL'
 */
@WebServlet(name = "BeforeCheckOutController", urlPatterns = {"/BeforeCheckOutController"})
public class BeforeCheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        CartDTO cart = (CartDTO) session.getAttribute("CART");
        if (cart == null || cart.getCart().isEmpty()) {
            String emptyCart = "";
            request.setAttribute("emptyCart", emptyCart);
            request.getRequestDispatcher("viewcart.jsp").forward(request, response);
        }
        if(cart!=null){
            for (ProductDTO i : cart.getCart()) {
                watchDTO w =dao.getWatchById(i.getpId());
                if(w.getQuantity()<cart.getProduct(i.getName()).getQuantity()){
                    String error = "Can't buy more than " + w.getQuantity() + " of " +cart.getProduct(i.getName()).getName();
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("viewcart.jsp").forward(request, response);
                }
            }
            response.sendRedirect("checkout.jsp");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
