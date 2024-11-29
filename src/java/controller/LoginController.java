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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user_watch.DAO;
import user_watch.userDTO;

/**
 *
 * @author DELL'
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        session.invalidate();
        request.getRequestDispatcher("home.html").forward(request, response);  
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            DAO dao = new DAO();
            String userId = request.getParameter("userID");
            String password_raw = request.getParameter("password");
            String remember_me = request.getParameter("rem");
            Cookie cu = new Cookie("cuser", userId);
            Cookie cp = new Cookie("cpass", password_raw);
            Cookie cr = new Cookie("crem", remember_me);
            HttpSession session = request.getSession();
            if (remember_me != null) {
                cu.setMaxAge(60 * 60 * 24);
                cp.setMaxAge(60 * 60 * 24);
                cr.setMaxAge(60 * 60 * 24);
            } else {
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);
            }
            int role = -1;
            String url = "login.jsp";
            try {
                int password = Integer.parseInt(password_raw);
                if (dao.getUserRole(userId, password) == 0) {
                    url = "ListWatchController";
                }
                if (dao.getUserRole(userId, password) == 1) {
                    role = 1;
                    url = "manager.jsp";
                }
                if (dao.getUserRole(userId, password) == 2) {
                    role = 2;
                    url = "staff.jsp";
                }
                

            } catch (NumberFormatException e) {
                System.out.println(e);
            } finally {
                String loi = "Invalid userId or password";
                session.setAttribute("user", userId);
                request.setAttribute("error", loi);
                response.addCookie(cu);
                response.addCookie(cp);
                response.addCookie(cr);
                request.getRequestDispatcher(url).forward(request, response);
            }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
