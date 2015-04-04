/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.utils;

import java.util.ResourceBundle;

/**
 *
 * @author Binh
 */
public class ResourceLoader {

    static ResourceBundle rb = ResourceBundle.getBundle("conf.resources");

    public static String getString(String key) {
        try {
            return rb.getString(key);
        } catch (Exception e) {
            return "";
        }
    }

    public static int getInt(String key) {
        try {
            return Integer.parseInt(rb.getString(key));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    public static String getString(String key, String value) {
        try {
            return rb.getString(key);
        } catch (Exception e) {
            return value;
        }
    }

    public static int getInt(String key, int value) {
        try {
            return Integer.parseInt(rb.getString(key));
        } catch (NumberFormatException e) {
            return value;
        }
    }
}
