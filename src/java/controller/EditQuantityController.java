/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import product.CartDTO;
import user_watch.DAO;
import user_watch.watchDTO;

/**
 *
 * @author DELL'
 */
@WebServlet(name = "EditQuantityController", urlPatterns = {"/EditQuantityController"})
public class EditQuantityController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String pId = request.getParameter("pId");
        String productName = request.getParameter("productName");
        String productQuantity = request.getParameter("productQuantity");
        DAO dao = new DAO();
        watchDTO w = dao.getWatchById(pId);
        try {
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (w.getQuantity() >= Integer.parseInt(productQuantity)) {
                cart.editQuantity(productName, Integer.parseInt(productQuantity));
                session.setAttribute("CART", cart);
                String edited = "The quantity of " + productName + " is edited!!";
                request.setAttribute("edited", edited);
            }else{
                String editError = "We only have " + w.getQuantity()+" of " + productName + ". Please try again!";
                request.setAttribute("editError", editError);
                session.setAttribute("CART", cart);
            }
            request.getRequestDispatcher("viewcart.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.out.println(e);
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
