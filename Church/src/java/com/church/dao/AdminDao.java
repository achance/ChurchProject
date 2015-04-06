/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.church.dao;

import com.church.bean.Admin;
import com.church.bean.Contact;
import com.church.utils.DBPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 *
 * @author Binh
 */
public class AdminDao {
    public static Logger logger = Logger.getLogger(AdminDao.class);
    private PreparedStatement pstmt;
    private ResultSet rs;
    private Connection conn;
    
    public Admin login(String username, String password) {
        Admin admin = null;
        String strSQL = "SELECT adminid, admin_name FROM admin WHERE  admin_name = ? and admin_password = ?";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                admin = new Admin();
                admin.setAdminid(rs.getInt("adminid"));
                admin.setAdminName(rs.getString("admin_name"));
            }
        } catch (Exception e) {
            admin = null;
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    logger.error("error in rollback Connection", ex);
                }
            }
            logger.error("error in login function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return admin;
    }
}
