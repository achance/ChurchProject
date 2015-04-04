/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.church.dao;

import com.church.bean.Contact;
import com.church.utils.DBPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

public class ContactDao {
    public static Logger logger = Logger.getLogger(ContactDao.class);
    private PreparedStatement pstmt;
    private ResultSet rs;
    private Connection conn;
    
    public int insertContact(Contact contact) {
        String strSQL = "INSERT INTO contact (name,email,website,message) VALUES (?,?,?,?)";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, contact.getName());
            pstmt.setString(2, contact.getEmail());
            pstmt.setString(3, contact.getWeb());
            pstmt.setString(4, contact.getMessage());
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    logger.error("error in rollback Connection", ex);
                }
            }
            logger.error("error in getGameDropdownList function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return 0;
    }
}
