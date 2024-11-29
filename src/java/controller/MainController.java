/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL'
 */
public class MainController extends HttpServlet {

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String SEARCH_USER = "Search user";
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";
    private static final String SEARCH_WATCH = "Search watch";
    private static final String SEARCH_IN_CONTROLLER = "SearchINController";
    private static final String ADD_WATCH = "Add watch";
    private static final String ADD_WATCH_CONTROLLER = "AddWatchController";
    private static final String UPDATE_MB = "Update watch";
    private static final String UPDATE_MOBILE_CONTROLLER = "UpdateMobileController";
    private static final String DELETE_WATCH = "deletewatch";
    private static final String DELETE_WATCH_CONTROLLER = "DeleteController";
    private static final String SEARCH_PRICE = "Search price";
    private static final String SEARCH_PRICE_CONTROLLER = "SearchPriceController";
    private static final String BUY_MOBILE = "Add To Cart";
    private static final String ADDTOCART_CONTROLLER = "AddToCartController";
    private static final String VIEW = "View Cart";
    private static final String YOURCART = "viewcart.jsp";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditQuantityController";
    private static final String WISHLIST = "wishlist";
    private static final String ADD_TO_WISHLIST_CONTROLLER = "AddToWishlistController";
    private static final String DELETE_WISHLIST = "Delete";
    private static final String DELETE_WISHLIST_CONTROLLER = "DeleteWishListController";
    private static final String ADD_MORE = "Add more";
    private static final String LISTWATCH_CONTROLLER = "ListWatchController";
    private static final String BUY_NOW = "Buy Now";
    private static final String BUYNOW_CONTROLLER = "AddToCartController";
    private static final String SHOP_AGAIN = "Shop again";
    private static final String SHOP_AGAIN_CONTROLLER = "ListWatchController";
    private static final String CHECK_OUT = "Place order";
    private static final String CHECK_OUT_CONTROLLER = "CheckOutController";
    private static final String SHOW_INVOICE = "Show Invoice";
    private static final String GET_INVOICE_CONTROLLER = "GetInvoiceController";
    private static final String SHOW_WISHTLIST = "User wishlist";
    private static final String SHOW_WISHLIST_CONTROLLER = "WishListDBController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String REGISTER_NOW = "registernow";
    private static final String REGISTER_PAGE = "register.jsp";
    private static final String WATCHPRODUCT = "Show Product";
    private static final String WATCH_LIST_CONTROLLER = "ProductListController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (SEARCH_WATCH.equals(action)) {
                url = SEARCH_IN_CONTROLLER;
            } else if (ADD_WATCH.equals(action)) {
                url = ADD_WATCH_CONTROLLER;
            } else if (UPDATE_MB.equals(action)) {
                url = UPDATE_MOBILE_CONTROLLER;
            } else if (DELETE_WATCH.equals(action)) {
                url = DELETE_WATCH_CONTROLLER;
            } else if (SEARCH_PRICE.equals(action)) {
                url = SEARCH_PRICE_CONTROLLER;
            } else if (BUY_MOBILE.equals(action)) {
                url = ADDTOCART_CONTROLLER;
            } else if (VIEW.equals(action)) {
                url = YOURCART;
            } else if (VIEW.equals(action)) {
                url = YOURCART;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (SEARCH_USER.equals(action)) {
                url = SEARCH_USER_CONTROLLER;
            } else if (WISHLIST.equals(action)) {
                url = ADD_TO_WISHLIST_CONTROLLER;
            } else if (DELETE_WISHLIST.equals(action)) {
                url = DELETE_WISHLIST_CONTROLLER;
            } else if (ADD_MORE.equals(action)) {
                url = LISTWATCH_CONTROLLER;
            } else if (BUY_NOW.equals(action)) {
                url = BUYNOW_CONTROLLER;
            } else if (SHOP_AGAIN.equals(action)) {
                url = SHOP_AGAIN_CONTROLLER;
            } else if (CHECK_OUT.equals(action)) {
                url = CHECK_OUT_CONTROLLER;
            } else if (SHOW_INVOICE.equals(action)) {
                url = GET_INVOICE_CONTROLLER;
            } else if (SHOW_WISHTLIST.equals(action)) {
                url = SHOW_WISHLIST_CONTROLLER;
            } else if (REGISTER.equals(action)) {
                url = REGISTER_CONTROLLER;
            } else if (REGISTER_NOW.equals(action)) {
                url = REGISTER_PAGE;
            }else if (WATCHPRODUCT.equals(action)) {
                url = WATCH_LIST_CONTROLLER;
            }else {
                request.setAttribute("ERROR", "Your action not support");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
