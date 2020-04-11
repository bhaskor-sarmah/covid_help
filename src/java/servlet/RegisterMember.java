/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.MemberDao;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HelpPojo;
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
            request.setAttribute("msg", "<div class=\"alert alert-danger\"><label>Invalid Captcha Code</label></div>");
            request.setAttribute("type", type);
            request.setAttribute("helpList", dao.getTypeOfHelp());
            request.getRequestDispatcher("./register.jsp").forward(request, response);
        } else {
            
//            int helpDivCount = Integer.parseInt(request.getParameter("helpDivCount"));
            
            String[] type_of_help = request.getParameterValues("type_of_help");
            String[] help_details = request.getParameterValues("help_details");
            String[] help_quantity = request.getParameterValues("help_quantity");
            List<HelpPojo> helpList = new ArrayList<HelpPojo>();
            int i= 0;
            for(String s: type_of_help){
                HelpPojo h = new HelpPojo();
                h.setHelpId(s);
                h.setHelpDetails(help_details[i]);
                h.setHelpDetails(help_quantity[i]);
                helpList.add(h);
                i++;
            }
            String name = request.getParameter("name");
            name = getUTF8(name).toUpperCase();
            
            String mobile = request.getParameter("mobile");
            
            String ps = request.getParameter("ps");
            ps = getUTF8(ps).toUpperCase();
            
            String locality = request.getParameter("locality");
            locality = getUTF8(locality).toUpperCase();
            
            String road = request.getParameter("road");
            road = getUTF8(road).toUpperCase();
            
            String house = request.getParameter("house_no");
            house = getUTF8(house).toUpperCase();
            
            String pin = request.getParameter("pincode");
            
            String sex = request.getParameter("gender").toUpperCase();
//            sex = getUTF8(sex).toUpperCase();
            
            String age = request.getParameter("age");
            String email = request.getParameter("email");
//            String type_of_help = request.getParameter("type_of_help").toUpperCase();
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
            m.setType_of_help(helpList);

            if (dao.saveMember(m)) {
                request.setAttribute("msg", "<div class=\"alert alert-success\"><label>Registration Successful !</label></div>");
                request.getRequestDispatcher("./index.jsp").forward(request, response);
            } else {
                request.setAttribute("type", type);
                request.setAttribute("msg", "<span style=\"color: reg\"><label>Failed Saving Member</label></span>");
                request.setAttribute("helpList", dao.getTypeOfHelp());
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

    private String getUTF8(String text) {
        try {
            byte textArr[] = text.getBytes("ISO-8859-1");
            text = new String(textArr, "UTF-8");
            return text;
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(RegisterMember.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

}
