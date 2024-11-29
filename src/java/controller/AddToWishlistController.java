/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user_watch.DAO;
import user_watch.watchDTO;
import wishlist.WishList;

/**
 *
 * @author DELL'
 */
@WebServlet(name = "AddToWishlistController", urlPatterns = {"/AddToWishlistController"})
public class AddToWishlistController extends HttpServlet {

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
        DAO dao = new DAO();
        String watchId = request.getParameter("watchId");
        String userId = request.getParameter("userId");
        watchDTO m = dao.getWatchById(watchId);
        WishList w = new WishList(userId, m.getWatchName(), m.getPrice(), m.getDescription(), m.getYearOfProduction(), m.getImg(),m.getWatchId());
        if(dao.addItem(w)){
            String done = "Added to wishlist done!!";
            request.setAttribute("done", done);
            request.getRequestDispatcher("ListWatchController").forward(request, response);
        }else{
            String fail = "Already in wishlist !!";
            request.setAttribute("fail", fail);
            request.getRequestDispatcher("ListWatchController").forward(request, response);
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
