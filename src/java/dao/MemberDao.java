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
import model.DistrictModel;
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

    public List<Member> getMemberByPinCode(String pin, String type, String state, String dist) {
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
            if (state.equals("DISTRICT")) {
                ps = conn.prepareStatement("SELECT * FROM member WHERE district = ? AND type = ?");
                ps.setString(1, dist);
                ps.setString(2, type);
            } else {
                ps = conn.prepareStatement("SELECT * FROM member WHERE pincode = ? AND type = ?");
                ps.setString(1, pin);
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
                m.setDistrict(getDistrictByCode(rs.getString("district")));
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
            if (state.equals("DISTRICT")) {
                if (type.equals("HELP SEEKER")) {
                    ps1 = conn.prepareStatement("SELECT a.`fk_address_code`, a.id,a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a LEFT OUTER JOIN address_code b ON a.fk_address_code=b.id WHERE b.district_code = ? AND help_required = ?");
                    ps1.setString(1, dist);
                    ps1.setString(2, "1");
                } else {
                    ps1 = conn.prepareStatement("SELECT a.`fk_address_code`,a.id,a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a LEFT OUTER JOIN address_code b ON a.fk_address_code=b.id WHERE b.district_code = ? AND willing_to_volunteer = ?");
                    ps1.setString(1, dist);
                    ps1.setString(2, "1");
                }
            } else {
                if (type.equals("HELP SEEKER")) {
                    ps1 = conn.prepareStatement("SELECT a.`fk_address_code`,a.id,a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode = ? AND help_required = ?");
                    ps1.setString(1, pin);
                    ps1.setString(2, "1");
                } else {
                    ps1 = conn.prepareStatement("SELECT a.`fk_address_code`,a.id,a.`name`,a.address AS road,a.village_ward_name AS locality,a.pincode,IF(a.age = 0,\"---\",a.age) AS age,a.mobile_number AS mobile,IF(a.gender = \"1\",\"MALE\",IF(a.gender = \"2\",\"FEMALE\",IF(a.gender IS NULL,\"---\",\"OTHER\"))) AS gender,a.lat,a.lng FROM icmr_user_details a WHERE pincode = ? AND willing_to_volunteer = ?");
                    ps1.setString(1, pin);
                    ps1.setString(2, "1");
                }
            }
            System.out.println(ps1);
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                Member m = new Member();
//                PinPojo p = getState(rs1.getString("pincode"));
                if ((rs1.getString("name") == null) || rs1.getString("name").equals("")) {
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
                m.setState("ASSAM");
                m.setDistrict(getDistrictById(rs1.getInt("fk_address_code")));
//                m.setCircle(rs1.getString("circle"));
                m.setType_of_help(getHelpListApp(rs1.getString("id")));
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

    public boolean doSaveSearchDetails(String pin, String mobile, String search_type, String search_for, String captcha, String name, String dist) {
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
                    + "	`district`, \n"
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
                    + "	?, \n"
                    + "	NOW(), \n"
                    + " NULL\n"
                    + "	)");
            ps.setString(index++, pin);
            ps.setString(index++, name);
            ps.setString(index++, mobile);
            ps.setString(index++, search_type);
            ps.setString(index++, search_for);
            ps.setString(index++, dist);
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

    public boolean checkPinAssam(String pin) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            ps = conn.prepareStatement("SELECT * FROM pincode WHERE pincode = ? AND statename = ?");
            ps.setString(1, pin);
            ps.setString(2, "ASSAM");
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

    public boolean doCheckSms(String mobile, String mobile_no) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
            return false;
        }
        try {
            ps = conn.prepareStatement("SELECT count(*) FROM contact_details WHERE contact_by = ? AND contact_to = ?");
            ps.setString(1, mobile);
            ps.setString(2, mobile_no);
            System.out.println(ps);
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1) >= 2) {
                    return false;
                }
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
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {

            }
        }
        return true;
    }

    public List<DistrictModel> getDistList() {
        List<DistrictModel> distList = new ArrayList<DistrictModel>();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            ps = conn.prepareStatement("SELECT district_code, UPPER(address) FROM address_code ORDER BY address");
            System.out.println(ps);
            rs = ps.executeQuery();
            while (rs.next()) {
//                if (rs.getString("district_code").equals("000") || rs.getString("district_code").equals("999")) {
//                    continue;
//                }
                DistrictModel d = new DistrictModel();
                d.setDistCode(rs.getString(1));
                d.setDistName(rs.getString(2));
                distList.add(d);
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
        return distList;
    }

    private String getDistrictByCode(String dist) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            ps = conn.prepareStatement("SELECT UPPER(address) FROM address_code WHERE district_code = ?");
            ps.setString(1, dist);
            System.out.println(ps);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
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
        return "";
    }

    private String getDistrictById(int aInt) {
       Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ContextListener.dsCovidHelp.getConnection();
        } catch (Exception e) {
            System.out.println("Connection Exception : " + e.getMessage());
        }
        try {
            ps = conn.prepareStatement("SELECT UPPER(address) FROM address_code WHERE id = ?");
            ps.setInt(1, aInt);
            System.out.println(ps);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
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
        return "";
    }
}
