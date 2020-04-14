/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.MemberDao;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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

            if (dao.checkPinAssam(pin)) {
                String mobile = request.getParameter("mobile");
                String state = request.getParameter("state");
                String name = request.getParameter("name");
                name = getUTF8(name).toUpperCase();
                dao.doSaveSearchDetails(pin, mobile, state, type, captcha, name);
                if (type.equals("HELP SEEKER")) {
                    List<Member> memberList = dao.getMemberByPinCode(pin, type, state);
                    if (memberList == null || memberList.isEmpty()) {
                        request.setAttribute("msg", "<div class=\"alert alert-danger\">No Data Found</div>");
                        request.getRequestDispatcher("./index.jsp").forward(request, response);
                    } else {
                        request.setAttribute("memberList", memberList);
                        if (state.equals("PINCODE")) {
                            request.setAttribute("msg", "<div class=\"alert alert-success alertHeader\">List of Help Seeker at pincode - " + pin + "<br/>এই পিনক'ডটোত থকা সহায় বিচাৰোতাৰ তালিকা</div>");

                        } else {
                            request.setAttribute("msg", "<div class=\"alert alert-success alertHeader\">List of Help Seeker at parent District of pincode - " + pin + "<br/>এই পিনক'ডৰ জিলাত থকা সহায় বিচাৰোতাৰ তালিকা</div>");

                        }
                        request.setAttribute("mobile", mobile);
                        request.setAttribute("name", name);
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
                        if (state.equals("PINCODE")) {
                            request.setAttribute("msg", "<div class=\"alert alert-success alertHeader\">List of Persons willing to help at pincode - " + pin + "<br/>এই পিনক'ড টোত থকা সহায় কৰিব বিচাৰোতাৰ তালিকা</div>");

                        } else {
                            request.setAttribute("msg", "<div class=\"alert alert-success alertHeader\">List of Persons willing to help at parent District of pincode - " + pin + "</br>এই পিনক'ডৰ জিলাত থকা সহায় কৰিব বিচাৰোতাৰ তালিকা</div>");

                        }
                        request.setAttribute("mobile", mobile);
                        request.setAttribute("name", name);
                        request.setAttribute("searchType", state);
                        request.setAttribute("pin", pin);
                        request.setAttribute("type", type);
                        request.getRequestDispatcher("./search.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("msg", "<div class=\"alert alert-danger\">Some Error has ocurred</div>");
                    request.getRequestDispatcher("./index.jsp").forward(request, response);
                }
            } else {
                if (type.equals("HELP GIVER")) {
                    request.setAttribute("type", type);
                    request.setAttribute("msg", "<div class=\"alert alert-danger\">Please enter a valid Pin Code of Assam</div>");request.setAttribute("helpMsg", "<div class=\"alert alert-info\"><label>Fill up the parameters below to view the list of persons willing to help in your locality or District.<br/>একে জিলাৰে বা অঞ্ছলৰে সহায় দাতাৰ তালিকাখন চাবলৈ নিম্নোক্ত ফৰ্ম খন ভৰ্তি কৰক</label></div>");
                    request.getRequestDispatcher("./pinSearch.jsp").forward(request, response);
                } else if (type.equals("HELP SEEKER")) {
                    request.setAttribute("type", type);
                    request.setAttribute("msg", "<div class=\"alert alert-danger\">Please enter a valid Pin Code of Assam</div>");request.setAttribute("helpMsg", "<div class=\"alert alert-info\"><label>Fill up the parameters below to view the list of persons willing to help in your locality or District.<br/>একে জিলাৰে বা অঞ্ছলৰে সহায় দাতাৰ তালিকাখন চাবলৈ নিম্নোক্ত ফৰ্ম খন ভৰ্তি কৰক</label></div>");
                    request.setAttribute("helpMsg", "<div class=\"alert alert-danger\"><label>Fill up the parameters below to view the list of persons who wants help in your locality or District.<br/>একে জিলাৰে বা অঞ্ছলৰে সহায় বিচাৰোতাৰ তালিকাখন চাবলৈ নিম্নোক্ত ফৰ্ম খন ভৰ্তি কৰক</label></div>");
                    request.getRequestDispatcher("./pinSearch.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("./error.jsp").forward(request, response);
                }
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
