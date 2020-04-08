/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import dao.MemberDao;
import java.io.IOException;
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

    public boolean doFireSms(List<Member> memberList, String mobile, String type) {
        boolean res = true;
        for (Member m : memberList) {
            String mobile_no = Encryption.decrypt(m.getMobile(), AppSettings.KEY);
            mobile_no = mobile_no.replaceAll("==", "");
            System.out.println("RECEIVER - " + mobile_no);
            dao.doSaveContactDetails(mobile, mobile_no, "CONTACT ALL");
            if (type.equals("HELP SEEKER")) {
                String provide_help = mobile + " is willing to help in your locality";
                String url = "http://websms.kcswebtech.com/sms/api?action=send-sms&api_key=apdclda&to=91" + mobile_no + "&from=DBICMR&sms=" + provide_help;
                try {
                    if (!HttpConnectionMethod.sendGET(url)) {
                        res = false;
                    }
                } catch (IOException ex) {
                    res = false;
                    Logger.getLogger(SmsUtil.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (type.equals("HELP GIVER")) {
                String seek_help = mobile + " is seeking help in your locality";
                String url = "http://websms.kcswebtech.com/sms/api?action=send-sms&api_key=apdclda&to=91" + mobile_no + "&from=DBICMR&sms=" + seek_help;
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

    public boolean doFireSms(String receiver_mobile, String mobile, String type) {
        boolean res = true;
        if (type.equals("HELP SEEKER")) {
            String provide_help = mobile + " is willing to help in your locality";
            String url = "http://websms.kcswebtech.com/sms/api?action=send-sms&api_key=apdclda&to=91" + receiver_mobile + "&from=DBICMR&sms=" + provide_help;
            try {
                if (!HttpConnectionMethod.sendGET(url)) {
                    res = false;
                }
            } catch (IOException ex) {
                res = false;
                Logger.getLogger(SmsUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (type.equals("HELP GIVER")) {
            String seek_help = mobile + " is seeking help in your locality";
            String url = "http://websms.kcswebtech.com/sms/api?action=send-sms&api_key=apdclda&to=91" + receiver_mobile + "&from=DBICMR&sms=" + seek_help;
            try {
                if (!HttpConnectionMethod.sendGET(url)) {
                    res = false;
                }
            } catch (IOException ex) {
                res = false;
                Logger.getLogger(SmsUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        System.out.println("SMS SENT TO - " + receiver_mobile);
        dao.doSaveContactDetails(mobile, receiver_mobile, "CONTACT");
        return res;
    }
}
