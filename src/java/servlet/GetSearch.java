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
@WebServlet(name = "GetSearch", urlPatterns = {"/GetSearch"})
public class GetSearch extends HttpServlet {

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
//            request.setAttribute("helpMsg", "<div class=\"alert alert-success\"><label>Fill up the parameters below to view the list of persons willing to help in your locality or District.</label></div>");
            request.setAttribute("distList", dao.getDistList());
            request.setAttribute("helpMsg", "<div class=\"alert alert-info\"><label>Fill up the parameters below to view the list of persons willing to help in your locality or District.<br/>একে জিলাৰে বা অঞ্ছলৰে সহায় দাতাৰ তালিকাখন চাবলৈ নিম্নোক্ত ফৰ্ম খন ভৰ্তি কৰক</label></div>");
            request.getRequestDispatcher("./pinSearch.jsp").forward(request, response);
        }else if(type.equals("HELP SEEKER")){
            request.setAttribute("type", type);
//            request.setAttribute("helpMsg", "<div class=\"alert alert-success\"><label>Fill up the parameters below to view the list of persons who wants help in your locality or District.</label></div>");
            request.setAttribute("distList", dao.getDistList());
            request.setAttribute("helpMsg", "<div class=\"alert alert-danger\"><label>Fill up the parameters below to view the list of persons who wants help in your locality or District.<br/>একে জিলাৰে বা অঞ্ছলৰে সহায় বিচাৰোতাৰ তালিকাখন চাবলৈ নিম্নোক্ত ফৰ্ম খন ভৰ্তি কৰক</label></div>");
            request.getRequestDispatcher("./pinSearch.jsp").forward(request, response);
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
