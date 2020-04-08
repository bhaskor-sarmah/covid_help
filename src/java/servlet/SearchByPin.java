/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.MemberDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Member;

/**
 *
 * @author Bhaskor
 */
@WebServlet(name = "SearchByPin", urlPatterns = {"/SearchByPin"})
public class SearchByPin extends HttpServlet {

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
        String captcha = request.getParameter("captcha");
        HttpSession session = request.getSession();
        if (session.getAttribute("captcha") == null || !session.getAttribute("captcha").toString().equals(captcha)) {
            request.setAttribute("msg", "<div class=\"alert alert-danger\">Invalid Captcha Code</div>");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
        } else {
            String type = request.getParameter("type");
            String pin = request.getParameter("search");
            String mobile = request.getParameter("mobile");
            String state = request.getParameter("state");
            dao.doSaveSearchDetails(pin, mobile, state, type, captcha);
            if (type.equals("HELP SEEKER")) {
                List<Member> memberList = dao.getMemberByPinCode(pin, type, state);
                if (memberList == null || memberList.isEmpty()) {
                    request.setAttribute("msg", "<div class=\"alert alert-danger\">No Data Found</div>");
                    request.getRequestDispatcher("./index.jsp").forward(request, response);
                } else {
                    request.setAttribute("memberList", memberList);
                    request.setAttribute("msg", "<div class=\"alert alert-success\">List of Help Seeker at pincode - " + pin + "</div>");
                    request.setAttribute("mobile", mobile);
                    request.setAttribute("searchType", state);
                    request.setAttribute("pin", pin);
                    request.setAttribute("type", type);
                    request.getRequestDispatcher("./search.jsp").forward(request, response);
                }
            } else if (type.equals("HELP GIVER")) {
                List<Member> memberList = dao.getMemberByPinCode(pin, type, state);
                if (memberList == null || memberList.isEmpty()) {
                    request.setAttribute("msg", "<div class=\"alert alert-danger\">No Data Found</div>");
                    request.getRequestDispatcher("./index.jsp").forward(request, response);
                } else {
                    request.setAttribute("memberList", memberList);
                    request.setAttribute("msg", "<div class=\"alert alert-success\">List of Help Giver at pincode - " + pin + "</div>");
                    request.setAttribute("mobile", mobile);
                    request.setAttribute("searchType", state);
                    request.setAttribute("pin", pin);
                    request.setAttribute("type", type);
                    request.getRequestDispatcher("./search.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("msg", "<div class=\"alert alert-danger\">Some Error has ocurred</div>");
                request.getRequestDispatcher("./index.jsp").forward(request, response);
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
