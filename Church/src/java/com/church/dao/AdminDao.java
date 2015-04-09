/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.church.dao;

import com.church.bean.Admin;
import com.church.bean.Admin;
import com.church.utils.DBPool;
import com.church.utils.StringUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

    public List<Admin> getAdminList() {
        List<Admin> list = new ArrayList<Admin>();
        String strSQL = "SELECT * FROM admin";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminid(rs.getInt("adminid"));
                admin.setAdminName(rs.getString("admin_name"));
                admin.setAdminPassword(rs.getString("admin_password"));
                list.add(admin);
            }
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    logger.error("error in rollback Connection", ex);
                }
            }
            logger.error("error in getAdminList function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return list;
    }

    public int insertAdmin(String username, String password) {
        String strSQL = "INSERT INTO admin (admin_name, admin_password) VALUES (?,?)";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
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
            logger.error("error in insertAdmin function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return 0;
    }
}
