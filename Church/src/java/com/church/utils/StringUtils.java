/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.church.utils;

/**
 *
 * @author Binh
 */
public class StringUtils {
    public static boolean isNotNullorEmpty(String value) {
        return value != null && value.length() > 0 && value.trim().length() > 0;
    }
    public static String getStringFormat(String value) {
        if(isNotNullorEmpty(value)) {
            return value.trim();
        }
        return "";
    }
}
