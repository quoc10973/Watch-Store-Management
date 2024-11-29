/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import invoice.invoiceDTO;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import product.CartDTO;
import product.ProductDTO;
import user_watch.DAO;
import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import user_watch.watchDTO;

/**
 *
 * @author DELL'
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        DAO dao = new DAO();
        int numb[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
        String word[] = {"B", "A", "E", "S", "U", "Z", "Y", "S", "O", "J", "I"};
        Random r = new Random();
        String invoiceId = word[r.nextInt(word.length)] + word[r.nextInt(word.length)] + word[r.nextInt(word.length)] + "-"
                + numb[r.nextInt(numb.length)] + numb[r.nextInt(numb.length)] + numb[r.nextInt(numb.length)];
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        CartDTO cart = (CartDTO) session.getAttribute("CART");
        LocalDateTime TimeCheckOut = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String formattedDateTime = TimeCheckOut.format(dtf);
        invoiceDTO inv = new invoiceDTO(invoiceId, user, cart.totalMoney(), formattedDateTime, phone, address, city, false);
        List<ProductDTO> order = cart.getCart();
        if (cart.getCart().size() > 0) {
            for (ProductDTO i : cart.getCart()) {
                watchDTO w = dao.getWatchById(i.getpId());
                w.setQuantity(w.getQuantity() - i.getQuantity());
                dao.updateWatch(w);
                dao.createInvoice(inv);
                session.setAttribute("ORDER", order);
                session.removeAttribute("CART");
                request.getRequestDispatcher("finish.jsp").forward(request, response);
            }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
