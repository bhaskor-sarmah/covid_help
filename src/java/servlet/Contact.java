/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.AppSettings;
import util.Encryption;
import util.SmsUtil;

/**
 *
 * @author Bhaskor
 */
@WebServlet(name = "Contact", urlPatterns = {"/Contact"})
public class Contact extends HttpServlet {

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
        String c = request.getParameter("c");
        HttpSession session = request.getSession();
        if (session.getAttribute("captcha") == null || !session.getAttribute("captcha").toString().equals(c)) {
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print("{message: false}");
            out.flush();
        } else {
            SmsUtil sms = new SmsUtil();
            String mobile = request.getParameter("m");
            String receiver_mobile = Encryption.decrypt(request.getParameter("mm"), AppSettings.KEY);
            System.out.println(receiver_mobile);
            String type = request.getParameter("t");
            if (sms.doFireSms(receiver_mobile.replaceAll("==", ""), mobile, type)) {
                PrintWriter out = response.getWriter();
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
                out.print("{message: true}");
                out.flush();
            } else {
                PrintWriter out = response.getWriter();
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
                out.print("{message: false}");
                out.flush();
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
