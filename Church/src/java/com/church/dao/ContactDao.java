/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.dao;

import com.church.bean.Contact;
import com.church.utils.DBPool;
import com.church.utils.StringUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

    public List<Contact> getContactList() {
        List<Contact> list = new ArrayList<Contact>();
        String strSQL = "SELECT * FROM contact";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setId(rs.getInt("id"));
                contact.setName(rs.getString("name"));
                contact.setEmail(rs.getString("email"));
                contact.setWeb(rs.getString("website"));
                contact.setMessage(rs.getString("message"));
                contact.setStatus(rs.getInt("status"));
                contact.setCreatedTime(StringUtils.formatDate(rs.getTimestamp("created_time")));
                list.add(contact);
            }
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    logger.error("error in rollback Connection", ex);
                }
            }
            logger.error("error in getContactList function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return list;
    }

    public int deleteContact(int id) {
        String strSQL = "delete from contact where id = ?";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, id);
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
            logger.error("error in deleteContact function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return 0;
    }

    public int updateContact(int id, int status) {
        String strSQL = "update contact set status = ? where id = ?";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, status == 0 ? 1 : 0);
            pstmt.setInt(2, id);
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
            logger.error("error in updateContact function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return 0;
    }
}
