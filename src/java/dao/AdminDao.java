/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import initialize.ContextListener;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.HelpPojo;
import model.Member;
import model.ThanaPojo;
import servlet.RegisterMember;
import util.AppSettings;
import util.Encryption;

/**
 *
 * @author Bhaskor
 */
public class AdminDao {

    public boolean checkLogin(String username, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            ps = conn.prepareStatement("SELECT * FROM admin_login WHERE username = ? AND password = PASSWORD(?) AND isActive = \"1\"");
            ps.setString(1, username);
            ps.setString(2, password);
            System.out.println(ps);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Exception : " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {

            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {

            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {

            }
        }
        return false;
    }

    private List<HelpPojo> getHelpListApp(String id, Connection conn) {
        List<HelpPojo> helpList = new ArrayList<HelpPojo>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("SELECT a.description,a.quantity,a.help_seeker_giver,b.type_of_help FROM help_details_new a,type_of_help b WHERE a.fk_type_of_help = b.id AND a.fk_icmr_user_details = ?");
            ps.setString(1, id);
            System.out.println(ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                HelpPojo h = new HelpPojo();
                h.setHelpDetails(rs.getString(1));
                h.setHelpQuantity(rs.getString(2));
                h.setType(rs.getString(3));
                h.setHelpId(rs.getString(4));
                helpList.add(h);
            }
        } catch (Exception e) {
            System.out.println("Exception : " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {

            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {

            }
        }
        return helpList;
    }

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

    public List<Member> getMemberByDistrict(String district_code, String thana_code) {
        List<Member> memList = new ArrayList<Member>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            if (thana_code.equals("-1")) {
                ps = conn.prepareStatement("SELECT a.id,a.name,a.mobile_number,a.address,a.is_app_data FROM icmr_user_details a,address_code b WHERE a.fk_address_code = b.id AND b.district_id = ?");
                ps.setString(1, district_code);
            } else {
                ps = conn.prepareStatement("SELECT a.id,a.name,a.mobile_number,a.address,a.is_app_data FROM icmr_user_details a,address_code b WHERE a.fk_address_code = b.id AND b.thana_code = ?");
                ps.setString(1, thana_code);
            }
            System.out.println(ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString("name").equals("")) {
                    continue;
                }
                Member m = new Member();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                m.setMobile(Encryption.encrypt(rs.getString("mobile_number"), AppSettings.KEY));
                m.setMob(rs.getString("mobile_number"));
                m.setAddress(rs.getString("address"));
                m.setHelp_details(getHelpListApp(rs.getString("id"), conn));
                m.setSrc((rs.getInt("is_app_data") == 1) ? "APP" : "WEB");
                memList.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {

            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {

            }
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {

        }
        return memList;
    }
}
