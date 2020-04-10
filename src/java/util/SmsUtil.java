/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import dao.MemberDao;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Member;

/**
 *
 * @author Bhaskor
 */
public class SmsUtil {

    MemberDao dao = new MemberDao();

    public boolean doFireSms(List<Member> memberList, String mobile, String type, String name) {
        boolean res = true;
        for (Member m : memberList) {
            String mobile_no = Encryption.decrypt(m.getMobile(), AppSettings.KEY);
            mobile_no = mobile_no.replaceAll("==", "");
            System.out.println("RECEIVER - " + mobile_no);
            dao.doSaveContactDetails(mobile, mobile_no, "CONTACT ALL", name);
            if (type.equals("HELP SEEKER")) {
                String provide_help = mobile + " (" + name + ") is willing to help in your locality.\nwww.covirudh.com";
                String encodeURL = "";
                try {
                    encodeURL = URLEncoder.encode(provide_help, "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    System.out.println("Error Encoding URL - " + e.getMessage());
                    return false;
                }
                String url = "http://websms.kcswebtech.com/sms/api?action=send-sms&api_key=apdclda&to=91" + mobile_no + "&from=COVIDS&sms=" + encodeURL;
                try {
                    if (!HttpConnectionMethod.sendGET(url)) {
                        res = false;
                    }
                } catch (IOException ex) {
                    res = false;
                    Logger.getLogger(SmsUtil.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (type.equals("HELP GIVER")) {
                String seek_help = mobile + " (" + name + ") is seeking help in your locality.\nwww.covirudh.com";
                String encodeURL = "";
                try {
                    encodeURL = URLEncoder.encode(seek_help, "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    System.out.println("Error Encoding URL - " + e.getMessage());
                    return false;
                }
                String url = "http://websms.kcswebtech.com/sms/api?action=send-sms&api_key=apdclda&to=91" + mobile_no + "&from=COVIDS&sms=" + encodeURL;
                try {
                    if (!HttpConnectionMethod.sendGET(url)) {
                        res = false;
                    }
                } catch (IOException ex) {
                    res = false;
                    Logger.getLogger(SmsUtil.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            System.out.println("SMS SENT TO - " + mobile_no);
        }
        return res;
    }

    public boolean doFireSms(String receiver_mobile, String mobile, String type, String name) {
        boolean res = true;
        if (type.equals("HELP SEEKER")) {
            String provide_help = mobile + " (" + name + ") is willing to help in your locality.\nwww.covirudh.com";
            String encodeURL = "";
            try {
                encodeURL = URLEncoder.encode(provide_help, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                System.out.println("Error Encoding URL - " + e.getMessage());
                return false;
            }
            String url = "http://websms.kcswebtech.com/sms/api?action=send-sms&api_key=apdclda&to=91" + receiver_mobile + "&from=COVIDS&sms=" + encodeURL;
            try {
                if (!HttpConnectionMethod.sendGET(url)) {
                    res = false;
                }
            } catch (IOException ex) {
                res = false;
                Logger.getLogger(SmsUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (type.equals("HELP GIVER")) {
            String seek_help = mobile + " (" + name + ") is seeking help in your locality.\nwww.covirudh.com";
            String encodeURL = "";
            try {
                encodeURL = URLEncoder.encode(seek_help, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                System.out.println("Error Encoding URL - " + e.getMessage());
                return false;
            }
            String url = "http://websms.kcswebtech.com/sms/api?action=send-sms&api_key=apdclda&to=91" + receiver_mobile + "&from=COVIDS&sms=" + encodeURL;
            try {
                if (!HttpConnectionMethod.sendGET(url)) {
                    res = false;
                }
            } catch (Exception ex) {
                res = false;
                System.out.println("Error - 0" + ex.getMessage());
            }
        }
        System.out.println("SMS SENT TO - " + receiver_mobile);
        dao.doSaveContactDetails(mobile, receiver_mobile, "CONTACT", name);
        return res;
    }
}
