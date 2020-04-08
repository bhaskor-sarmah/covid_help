/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import dao.MemberDao;
import java.util.List;
import model.Member;

/**
 *
 * @author Bhaskor
 */
public class SmsUtil {
    MemberDao dao = new MemberDao();
    public boolean doFireSms(List<Member> memberList,String mobile){
        for(Member m: memberList){
            String mobile_no = Encryption.decrypt(m.getMobile(), AppSettings.KEY);
            mobile_no = mobile_no.replaceAll("==", "");
            System.out.println("RECEIVER - "+mobile_no);
            dao.doSaveContactDetails(mobile,mobile_no,"CONTACT ALL");
        }
        return true;
    }
    
    public boolean doFireSms(String receiver_mobile, String mobile){
//        String mobile_no = Encryption.decrypt(receiver_mobile, AppSettings.KEY);
//        mobile_no = mobile_no.replaceAll("==", "");
        System.out.println("RECEIVER - "+receiver_mobile);
        dao.doSaveContactDetails(mobile,receiver_mobile,"CONTACT");
        return true;
    }
}
