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
import javax.servlet.http.HttpSession;
import model.Member;
import model.PinPojo;

/**
 *
 * @author Bhaskor
 */
@WebServlet(name = "RegisterMember", urlPatterns = {"/RegisterMember"})
public class RegisterMember extends HttpServlet {

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
        String type = request.getParameter("type").toUpperCase();
        if (session.getAttribute("captcha") == null || !session.getAttribute("captcha").toString().equals(captcha)) {
            request.setAttribute("msg", "<div class=\"alert alert-danger\">Invalid Captcha Code</div>");
            request.setAttribute("type", type);
            request.getRequestDispatcher("./register.jsp").forward(request, response);
        } else {
            String name = request.getParameter("name").toUpperCase();
            String mobile = request.getParameter("mobile");
            String ps = request.getParameter("ps").toUpperCase();
            String locality = request.getParameter("locality").toUpperCase();
            String road = request.getParameter("road").toUpperCase();
            String house = request.getParameter("house_no").toUpperCase();
            String pin = request.getParameter("pincode");
            String sex = request.getParameter("gender").toUpperCase();
            String age = request.getParameter("age");
            String email = request.getParameter("email");
            String type_of_help = request.getParameter("type_of_help").toUpperCase();
            PinPojo p = dao.getState(pin);
            Member m = new Member();
            m.setName(name);
            m.setPolice_station(ps);
            m.setPincode(pin);
            m.setLocality(locality);
            m.setRoad(road);
            m.setHouse_no(house);
            m.setAge(age);
            m.setCircle("");
            m.setDistrict(p.getDistrict());
            m.setEmail(email);
            m.setMobile(mobile);
            m.setSex(sex);
            m.setState(p.getState());
            m.setType(type);
            m.setType_of_help(type_of_help);

            if (dao.saveMember(m)) {
                request.setAttribute("msg", "<div class=\"alert alert-success\">Registration Successful !</div>");
                request.getRequestDispatcher("./index.jsp").forward(request, response);
            } else {
                request.setAttribute("type", type);
                request.setAttribute("msg", "<span style=\"color: reg\">Failed Saving Member</span>");
                request.getRequestDispatcher("./register.jsp").forward(request, response);
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
