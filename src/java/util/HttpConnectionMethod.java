/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 *
 * @author Bhaskor
 */
public class HttpConnectionMethod {

//    private static final String USER_AGENT = "Mozilla/5.0";
//    private static final String GET_URL = "https://localhost:9090/SpringMVCExample";
//    private static final String POST_URL = "https://localhost:9090/SpringMVCExample/home";
//    private static final String POST_PARAMS = "userName=Pankaj";
//    public static void main(String[] args) throws IOException {
//
//        sendGET();
//        System.out.println("GET DONE");
//        sendPOST();
//        System.out.println("POST DONE");
//    }
    public static boolean sendGET(String url) throws IOException {
        System.out.println(url);
        
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("GET");
//        con.setRequestProperty("User-Agent", USER_AGENT);
        int responseCode = con.getResponseCode();
        System.out.println("GET Response Code :: " + responseCode);
        if (responseCode == HttpURLConnection.HTTP_OK) { // success
            BufferedReader in = new BufferedReader(new InputStreamReader(
                    con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // print result
            System.out.println(response.toString());
            return true;
        } else {
            System.out.println("GET request not worked");
            return false;
        }

    }

    public static boolean sendGETRequest(String url) {
        try {
            URL req = new URL(url);
            URLConnection yc = req.openConnection();
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(
                            yc.getInputStream()));
            String inputLine;

            while ((inputLine = in.readLine()) != null) {
                System.out.println(inputLine);
            }
            in.close();
            return true;
        } catch (Exception e) {
            System.out.println("Exception : " + e.getMessage());
            return false;
        }
    }
//    public static void sendPOST() throws IOException {
//        URL obj = new URL(POST_URL);
//        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
//        con.setRequestMethod("POST");
//        con.setRequestProperty("User-Agent", USER_AGENT);
//
//        // For POST only - START
//        con.setDoOutput(true);
//        OutputStream os = con.getOutputStream();
//        os.write(POST_PARAMS.getBytes());
//        os.flush();
//        os.close();
//        // For POST only - END
//
//        int responseCode = con.getResponseCode();
//        System.out.println("POST Response Code :: " + responseCode);
//
//        if (responseCode == HttpURLConnection.HTTP_OK) { //success
//            BufferedReader in = new BufferedReader(new InputStreamReader(
//                    con.getInputStream()));
//            String inputLine;
//            StringBuffer response = new StringBuffer();
//
//            while ((inputLine = in.readLine()) != null) {
//                response.append(inputLine);
//            }
//            in.close();
//
//            // print result
//            System.out.println(response.toString());
//        } else {
//            System.out.println("POST request not worked");
//        }
//    }

}
