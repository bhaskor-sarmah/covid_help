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
import model.PinPojo;
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

    public List<Member> getAllByDistrict(String district) {
        Connection conn = null;
        PreparedStatement ps = null, ps1 = null;
        ResultSet rs = null, rs1 = null;
        List<Member> memberList = new ArrayList<Member>();
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            ps = conn.prepareStatement("SELECT * FROM member WHERE district = ?");
            ps.setString(1, district.toUpperCase());
            System.out.println(ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                Member m = new Member();
                m.setName(rs.getString("name"));
                m.setSex(rs.getString("gender"));
                m.setAge(rs.getString("age"));
                m.setMobile(Encryption.encrypt(rs.getString("mobile"), AppSettings.KEY));
                m.setEmail(rs.getString("email"));
                m.setHouse_no(rs.getString("house_no"));
                m.setLocality(rs.getString("locality"));
                m.setRoad(rs.getString("road"));
                m.setPolice_station(rs.getString("police_station"));
                m.setPincode(rs.getString("pincode"));
                m.setState(rs.getString("state"));
                m.setDistrict(rs.getString("district"));
                m.setCircle(rs.getString("circle"));
                m.setType_of_help(getHelpList(rs.getString("id"), conn));
                m.setLat("");
                m.setLon("");
                m.setSrc("POR");
                memberList.add(m);
            }
        } catch (SQLException e) {
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

        try {
            List<String> pinList = getAllPinByDistrict(district, conn);
            String pin_str = "";
            for (String s : pinList) {
                pin_str += "" + s + ",";
            }
            if (pin_str.length() > 1) {
                pin_str = pin_str.substring(0, pin_str.length() - 1);
            }
            ps1 = conn.prepareStatement("SELECT a.`id`,a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode IN (" + pin_str + ")");
            System.out.println(ps1);
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                Member m = new Member();
                PinPojo p = getState(rs1.getString("pincode"), conn);
                if ((rs1.getString("name") == null) || rs1.getString("name").equals("")) {
                    continue;
                }
                if ((rs1.getString("help_required").equals("0")) && rs1.getString("willing_to_volunteer").equals("0")) {
                    continue;
                }
                m.setName((rs1.getString("name") == null) ? "" : rs1.getString("name").toUpperCase());
                m.setSex((rs1.getString("gender") == null) ? "" : rs1.getString("gender"));
                m.setAge((rs1.getString("age") == null) ? "" : rs1.getString("age"));
                m.setMobile((rs1.getString("mobile") == null) ? "" : Encryption.encrypt(rs1.getString("mobile"), AppSettings.KEY));
//                m.setEmail(rs1.getString("email"));
//                m.setHouse_no(rs1.getString("house_no"));
                m.setLocality((rs1.getString("locality") == null) ? "" : rs1.getString("locality").toUpperCase());
                m.setRoad((rs1.getString("road") == null) ? "" : rs1.getString("road").toUpperCase());
//                m.setPolice_station(rs1.getString("police_station"));
                m.setPincode((rs1.getString("pincode") == null) ? "" : rs1.getString("pincode"));
                m.setState((p.getState() == null) ? "" : p.getState());
                m.setDistrict((p.getDistrict() == null) ? "" : p.getDistrict());
//                m.setCircle(rs1.getString("circle"));
                m.setType_of_help(getHelpListApp(rs1.getString("id"), conn));
                m.setLat((rs1.getString("lat") == null) ? "" : rs1.getString("lat"));
                m.setLon((rs1.getString("lng") == null) ? "" : rs1.getString("lng"));
                m.setSrc("APP");
                memberList.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Exception : " + e.getMessage());
        } finally {
            try {
                if (rs1 != null) {
                    rs1.close();
                }
            } catch (Exception e) {

            }
            try {
                if (ps1 != null) {
                    ps1.close();
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
        return memberList;
    }

    private List<HelpPojo> getHelpList(String id, Connection conn) {
        List<HelpPojo> helpList = new ArrayList<HelpPojo>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            ps = conn.prepareStatement("SELECT a.description,a.quantity,a.help_seeker_giver,b.type_of_help FROM help_details_new a,type_of_help b WHERE a.fk_type_of_help = b.id AND a.fk_member = ?");
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

    public List<String> getAllPinByDistrict(String district, Connection conn) {
        List<String> pinList = new ArrayList<String>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("SELECT DISTINCT pincode FROM pincode WHERE Districtname = ?");
            ps.setString(1, district);
            System.out.println(ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                pinList.add(rs.getString(1));
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
        return pinList;
    }

    public PinPojo getState(String pin, Connection conn) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        PinPojo p = new PinPojo();
        try {
            ps = conn.prepareStatement("SELECT * FROM pincode WHERE pincode = ?");
            ps.setString(1, pin);
            System.out.println(ps);
            rs = ps.executeQuery();
            if (rs.next()) {
                p.setDistrict((rs.getString("Districtname") == null) ? "" : rs.getString("Districtname").toUpperCase());
                p.setState((rs.getString("statename") == null) ? "" : rs.getString("statename").toUpperCase());
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
        return p;
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
}
