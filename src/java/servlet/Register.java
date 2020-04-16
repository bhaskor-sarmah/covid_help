/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.MemberDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bhaskor
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    MemberDao dao = new MemberDao();
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
        String type = request.getParameter("type");
        if (type.equals("HELP GIVER")) {
            request.setAttribute("type", type);
            request.setAttribute("distList", dao.getDistList());
            request.setAttribute("helpList", dao.getTypeOfHelp());
            request.setAttribute("registerMsg", "<div class=\"alert alert-info\"><label>Fill up the form below to register as a Help Giver.<br/>সহায়কৰ্ত্তা হিচাপে ৰেজিষ্টাৰ কৰিবলৈ নিম্নোক্ত ফৰ্ম খন ভৰ্তি কৰক</label></div>");
            request.getRequestDispatcher("./register.jsp").forward(request, response);
        }else if(type.equals("HELP SEEKER")){
            request.setAttribute("type", type);
            request.setAttribute("distList", dao.getDistList());
            request.setAttribute("helpList", dao.getTypeOfHelp());
            request.setAttribute("registerMsg", "<div class=\"alert alert-danger\"><label>Fill up the form below to register as a Help Seeker</br>সহায় বিচাৰোতা হিচাপে ৰেজিষ্টাৰ কৰিবলৈ নিম্নোক্ত ফৰ্ম খন ভৰ্তি কৰক</label></div>");
            request.getRequestDispatcher("./register.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("./error.jsp").forward(request, response);
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
