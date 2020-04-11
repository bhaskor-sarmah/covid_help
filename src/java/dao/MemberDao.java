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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.HelpPojo;
import model.Member;
import model.PinPojo;
import model.TypeOfHelp;
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
            if (pin_str.length() > 1) {
                pin_str = pin_str.substring(0, pin_str.length() - 1);
            }
            multiple = true;
        }

        try {
            if (multiple) {
                if (pin_str.equals("")) {
                } else {
                    ps = conn.prepareStatement("SELECT * FROM member WHERE pincode IN (" + pin_str + ") AND type = ?");
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
                m.setType_of_help(getHelpList(rs.getString("id")));
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
                        ps = conn.prepareStatement("SELECT a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode IN (" + pin_str + ") AND help_required = ?");
//                        ps.setString(1, pin_str);
                        ps.setString(1, "1");
                    } else {
                        ps = conn.prepareStatement("SELECT a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode IN (" + pin_str + ") AND willing_to_volunteer = ?");
//                        ps.setString(1, pin_str);
                        ps.setString(1, "1");
                    }
                }
            } else {
                if (type.equals("HELP SEEKER")) {
                    ps = conn.prepareStatement("SELECT a.id,a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode = ? AND help_required = ?");
                    ps.setString(1, pin);
                    ps.setString(2, "1");
                } else {
                    ps = conn.prepareStatement("SELECT a.id,a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode = ? AND willing_to_volunteer = ?");
                    ps.setString(1, pin);
                    ps.setString(2, "1");
                }
            }
            System.out.println(ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                Member m = new Member();
                PinPojo p = getState(rs.getString("pincode"));
                if ((rs.getString("name") == null) || rs.getString("name").equals("")) {
                    continue;
                }
                m.setName((rs.getString("name") == null) ? "" : rs.getString("name").toUpperCase());
                m.setSex((rs.getString("gender") == null) ? "" : rs.getString("gender"));
                m.setAge((rs.getString("age") == null) ? "" : rs.getString("age"));
                m.setMobile((rs.getString("mobile") == null) ? "" : Encryption.encrypt(rs.getString("mobile"), AppSettings.KEY));
//                m.setEmail(rs.getString("email"));
//                m.setHouse_no(rs.getString("house_no"));
                m.setLocality((rs.getString("locality") == null) ? "" : rs.getString("locality").toUpperCase());
                m.setRoad((rs.getString("road") == null) ? "" : rs.getString("road").toUpperCase());
//                m.setPolice_station(rs.getString("police_station"));
                m.setPincode((rs.getString("pincode") == null) ? "" : rs.getString("pincode"));
                m.setState((p.getState() == null) ? "" : p.getState());
                m.setDistrict((p.getDistrict() == null) ? "" : p.getDistrict());
//                m.setCircle(rs.getString("circle"));
                m.setType_of_help(getHelpListApp(rs.getString("id")));
                m.setLat((rs.getString("lat") == null) ? "" : rs.getString("lat"));
                m.setLon((rs.getString("lng") == null) ? "" : rs.getString("lng"));
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
        int member_id = 0;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
            return false;
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
                    //                    + "	`type_of_help`, \n"
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
                    //                    + "	?, \n"
                    + "	NULL, \n"
                    + "	NULL\n"
                    + "	)", Statement.RETURN_GENERATED_KEYS);
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
//            ps.setString(index++, m.getType_of_help());
            System.out.println(ps);
            ps.executeUpdate();
            ResultSet rsGen = ps.getGeneratedKeys();
            if (rsGen.next()) {
                member_id = rsGen.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Exception : " + e.getMessage());
            return false;
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
        if (member_id != 0) {
            for (HelpPojo h : m.getType_of_help()) {
                try {
                    int index = 1;
                    ps = conn.prepareStatement("INSERT INTO `help_details_new` \n"
                            + "	(`id`, \n"
                            + "	`description`, \n"
                            + "	`quantity`, \n"
                            + "	`fk_type_of_help`, \n"
                            + "	`help_seeker_giver`, \n"
                            + "	`fk_icmr_user_details`, \n"
                            + "	`fk_member`, \n"
                            + "	`flag`\n"
                            + "	)\n"
                            + "	VALUES\n"
                            + "	(NULL, \n"
                            + "	?, \n"
                            + "	?, \n"
                            + "	?, \n"
                            + "	?, \n"
                            + "	NULL, \n"
                            + "	?, \n"
                            + "	NULL\n"
                            + "	)");
                    ps.setString(index++, h.getHelpDetails());
                    ps.setString(index++, h.getHelpQuantity());
                    ps.setString(index++, h.getHelpId());
                    if (m.getType().equals("HELP GIVER")) {
                        ps.setString(index++, "GIVER");
                    } else if (m.getType().equals("HELP SEEKER")) {
                        ps.setString(index++, "SEEKER");
                    }
                    ps.setInt(index++, member_id);
                    System.out.println(ps);
                    ps.executeUpdate();
//                    return true;
                } catch (Exception e) {
                    System.out.println("Exception : " + e.getMessage());
                    return false;
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
            }
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {

        }
        return true;
    }

    public boolean doSaveSearchDetails(String pin, String mobile, String search_type, String search_for, String captcha, String name) {
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
                    + "	`name`, \n"
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
                    + "	?, \n"
                    + "	NOW(), \n"
                    + " NULL\n"
                    + "	)");
            ps.setString(index++, pin);
            ps.setString(index++, name);
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
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {

            }
        }
        return pinList;
    }

    public boolean doSaveContactDetails(String mobile_no, String receiver_mobile, String type, String name) {
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
                    + "	`contact_by_name`, \n"
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
                    + "	?, \n"
                    + "	NOW(), \n"
                    + "	NULL\n"
                    + "	)");
            ps.setString(index++, mobile_no);
            ps.setString(index++, name);
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

    public List<TypeOfHelp> getTypeOfHelp() {
        List<TypeOfHelp> helpList = new ArrayList<TypeOfHelp>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            ps = conn.prepareStatement("SELECT id,type_of_help FROM type_of_help WHERE is_enable = 1");
            System.out.println(ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                TypeOfHelp h = new TypeOfHelp();
                h.setId(rs.getString(1));
                h.setHelpDetails(rs.getString(2));
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
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {

            }
        }
        return helpList;
    }

    private List<HelpPojo> getHelpList(String id) {
        List<HelpPojo> helpList = new ArrayList<HelpPojo>();
        Connection conn = null;
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
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {

            }
        }
        return helpList;
    }

    private List<HelpPojo> getHelpListApp(String id) {
        List<HelpPojo> helpList = new ArrayList<HelpPojo>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
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
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {

            }
        }
        return helpList;
    }
}
