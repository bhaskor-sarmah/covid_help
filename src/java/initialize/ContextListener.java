/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package initialize;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;
import model.PinCode;

public class ContextListener implements ServletContextListener {

//    public static int count = 0;
    public static DataSource dsCovidHelp = null;
    public static Map<Integer, PinCode> pinCodeList = new HashMap<Integer, PinCode>();

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Context initCtx;
        System.out.println("Initializing.....");
        try {
            try {
                initCtx = new InitialContext();
                Context envCtx = (Context) initCtx.lookup("java:comp/env");
                dsCovidHelp = (DataSource) envCtx.lookup("jdbc/covid_help");
            } catch (NamingException ex) {
                Logger.getLogger(ContextListener.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Naming Exception :" + ex.getMessage());
            }
        } catch (Exception e) {
            System.out.println("Exception :" + e.getMessage());
        } finally {

        }
        System.out.println("Initialization Completed !!!");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
