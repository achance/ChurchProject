/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jsoup.Jsoup;

/**
 *
 * @author Binh
 */
public class StringUtils {

    public static boolean isNotNullorEmpty(String value) {
        return value != null && value.length() > 0 && value.trim().length() > 0;
    }

    public static String getStringFormat(String value) {
        if (isNotNullorEmpty(value)) {
            return value.trim();
        }
        return "";
    }

    public static String md5Hash(String value) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(value.getBytes());

            byte byteData[] = md.digest();

            //convert the byte to hex format method 1
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }

            //convert the byte to hex format method 2
            StringBuilder hexString = new StringBuilder();
            for (int i = 0; i < byteData.length; i++) {
                String hex = Integer.toHexString(0xff & byteData[i]);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(StringUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    public static String formatDate(Date value) {
        DateFormat format = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
        try {
            return format.format(value);
        } catch (Exception e) {
            return "";
        }
    }
    public static String formatDay(Date value) {
        DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        try {
            return format.format(value);
        } catch (Exception e) {
            return "";
        }
    }
    
    public static Date parseDatefromDay(String day) {
        DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        try {
            return format.parse(day);
        } catch (Exception e) {
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println(StringUtils.md5Hash("1234567"));
    }

    public static int getIntFormat(String value) {
        int number = 0;
        if (isNotNullorEmpty(value)) {
            try {
                number = Integer.parseInt(value.trim());
            } catch (Exception e) {
            }
        }
        return number;
    }

    public static String html2text(String html) {
        try {
            return Jsoup.parse(html).text();
        } catch (Exception e) {
            return "";
        }
    }
}
