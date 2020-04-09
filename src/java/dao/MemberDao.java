/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import initialize.ContextListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Member;
import model.PinPojo;
import util.AppSettings;
import util.Encryption;

/**
 *
 * @author Bhaskor
 */
public class MemberDao {

    public List<Member> getMemberByPinCode(String pin, String type, String state) {
        Connection conn = null;
        PreparedStatement ps = null, ps1 = null;
        ResultSet rs = null, rs1 = null;
        List<Member> memberList = new ArrayList<Member>();
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        String pin_str = pin;
        boolean multiple = false;
        if (state.equals("DISTRICT") || state.equals("STATE")) {
            List<String> pinList = getAllPin(pin, state);
            pin_str = "";
            for (String s : pinList) {
                pin_str += "" + s + ",";
            }
            pin_str = pin_str.substring(0, pin_str.length() - 1);
            multiple = true;
        }

        try {
            if (multiple) {
                if (pin_str.equals("")) {
                } else {
                    ps = conn.prepareStatement("SELECT * FROM member WHERE pincode IN ("+pin_str+") AND type = ?");
//                    ps.setString(1, pin_str);
                    ps.setString(1, type);
                }
            } else {
                ps = conn.prepareStatement("SELECT * FROM member WHERE pincode = ? AND type = ?");
                ps.setString(1, pin_str);
                ps.setString(2, type);
            }
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
                m.setType_of_help(rs.getString("type_of_help"));
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
            if (multiple) {
                if (pin_str.equals("")) {
                } else {
                    if (type.equals("HELP SEEKER")) {
                        ps = conn.prepareStatement("SELECT a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode IN ("+pin_str+") AND help_required = ?");
//                        ps.setString(1, pin_str);
                        ps.setString(1, "1");
                    } else {
                        ps = conn.prepareStatement("SELECT a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode IN ("+pin_str+") AND willing_to_volunteer = ?");
//                        ps.setString(1, pin_str);
                        ps.setString(1, "1");
                    }
                }
            } else {
                if (type.equals("HELP SEEKER")) {
                    ps = conn.prepareStatement("SELECT a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode = ? AND help_required = ?");
                    ps.setString(1, pin);
                    ps.setString(2, "1");
                } else {
                    ps = conn.prepareStatement("SELECT a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode = ? AND willing_to_volunteer = ?");
                    ps.setString(1, pin);
                    ps.setString(2, "1");
                }
            }
            System.out.println(ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                Member m = new Member();
                PinPojo p = getState(rs.getString("pincode"));
                m.setName(rs.getString("name").toUpperCase());
                m.setSex(rs.getString("gender"));
                m.setAge(rs.getString("age"));
                m.setMobile(Encryption.encrypt(rs.getString("mobile"), AppSettings.KEY));
//                m.setEmail(rs.getString("email"));
//                m.setHouse_no(rs.getString("house_no"));
                m.setLocality(rs.getString("locality").toUpperCase());
                m.setRoad(rs.getString("road").toUpperCase());
//                m.setPolice_station(rs.getString("police_station"));
                m.setPincode(rs.getString("pincode"));
                m.setState(p.getState());
                m.setDistrict(p.getDistrict());
//                m.setCircle(rs.getString("circle"));
                m.setType_of_help(type);
                m.setLat(rs.getString("lat"));
                m.setLon(rs.getString("lng"));
                m.setSrc("APP");
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
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {

        }
        return memberList;
    }

    public PinPojo getState(String pin) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PinPojo p = new PinPojo();
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            ps = conn.prepareStatement("SELECT * FROM pincode WHERE pincode = ?");
            ps.setString(1, pin);
            System.out.println(ps);
            rs = ps.executeQuery();
            if (rs.next()) {
                p.setDistrict(rs.getString("Districtname").toUpperCase());
                p.setState(rs.getString("statename").toUpperCase());
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
        return p;
    }

    public boolean saveMember(Member m) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            int index = 1;
            ps = conn.prepareStatement("INSERT INTO `member` \n"
                    + "	(`id`, \n"
                    + "	`name`, \n"
                    + "	`gender`, \n"
                    + "	`age`, \n"
                    + "	`mobile`, \n"
                    + "	`email`, \n"
                    + "	`police_station`, \n"
                    + "	`locality`, \n"
                    + "	`road`, \n"
                    + "	`house_no`, \n"
                    + "	`pincode`, \n"
                    + "	`state`, \n"
                    + "	`district`, \n"
                    + "	`circle`, \n"
                    + "	`type`, \n"
                    + "	`type_of_help`, \n"
                    + "	`flag`, \n"
                    + "	`flag1`\n"
                    + "	)\n"
                    + "	VALUES\n"
                    + "	(NULL, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	NULL, \n"
                    + "	NULL\n"
                    + "	)");
            ps.setString(index++, m.getName());
            ps.setString(index++, m.getSex());
            ps.setString(index++, m.getAge());
            ps.setString(index++, m.getMobile());
            ps.setString(index++, m.getEmail());
            ps.setString(index++, m.getPolice_station());
            ps.setString(index++, m.getLocality());
            ps.setString(index++, m.getRoad());
            ps.setString(index++, m.getHouse_no());
            ps.setString(index++, m.getPincode());
            ps.setString(index++, m.getState());
            ps.setString(index++, m.getDistrict());
            ps.setString(index++, m.getCircle());
            ps.setString(index++, m.getType());
            ps.setString(index++, m.getType_of_help());
            System.out.println(ps);
            ps.executeUpdate();
            return true;
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

    public boolean doSaveSearchDetails(String pin, String mobile, String search_type, String search_for, String captcha) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            int index = 1;
            ps = conn.prepareStatement("INSERT INTO `search_details` \n"
                    + "	(`id`, \n"
                    + "	`pin`, \n"
                    + "	`mobile`, \n"
                    + "	`search_type`, \n"
                    + "	`search_for`, \n"
                    + "	`captcha`, \n"
                    + "	`datetime`, \n"
                    + "	`flag`\n"
                    + "	)\n"
                    + "	VALUES\n"
                    + "	(NULL, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	NOW(), \n"
                    + " NULL\n"
                    + "	)");
            ps.setString(index++, pin);
            ps.setString(index++, mobile);
            ps.setString(index++, search_type);
            ps.setString(index++, search_for);
            ps.setString(index++, captcha);
            System.out.println(ps);
            ps.executeUpdate();
            return true;
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

    public List<String> getAllPin(String pin, String type) {
        System.out.println("RECEIVED PARAMETER - " + type);
        PinPojo p = getState(pin);
        List<String> pinList = new ArrayList<String>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            if (type.equals("STATE")) {
                ps = conn.prepareStatement("SELECT DISTINCT pincode FROM pincode WHERE statename = ?");
                ps.setString(1, p.getState());
            } else {
                ps = conn.prepareStatement("SELECT DISTINCT pincode FROM pincode WHERE Districtname = ?");
                ps.setString(1, p.getDistrict());
            }
            System.out.println(ps);
            rs = ps.executeQuery();
            while(rs.next()) {
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
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {

            }
        }
        return pinList;
    }

    public boolean doSaveContactDetails(String mobile_no, String receiver_mobile, String type) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            int index = 1;
            ps = conn.prepareStatement("INSERT INTO `contact_details` \n"
                    + "	(`id`, \n"
                    + "	`contact_by`, \n"
                    + "	`contact_to`, \n"
                    + "	`contact_type`, \n"
                    + "	`datetime`, \n"
                    + "	`flag`\n"
                    + "	)\n"
                    + "	VALUES\n"
                    + "	(NULL, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	?, \n"
                    + "	NOW(), \n"
                    + "	NULL\n"
                    + "	)");
            ps.setString(index++, mobile_no);
            ps.setString(index++, receiver_mobile);
            ps.setString(index++, type);
            System.out.println(ps);
            ps.executeUpdate();
            return true;
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
}
