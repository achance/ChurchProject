/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.dao;

import com.church.bean.Contact;
import com.church.bean.Newsandevent;
import com.church.utils.DBPool;
import com.church.utils.StringUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import org.apache.log4j.Logger;

public class NewsDao {

    public static Logger logger = Logger.getLogger(ContactDao.class);
    private PreparedStatement pstmt;
    private ResultSet rs;
    private Connection conn;

    public int insertnewsandevent(Newsandevent newsandevent ) {
        String strSQL = "INSERT INTO newsandevent (title,description,published_time,created_time,updated_time) VALUES (?,?,?,getdate(),getdate())";
        Date now = new Date();
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, newsandevent.getTitle());
            pstmt.setString(2, newsandevent.getDescription());
            pstmt.setDate(3, new java.sql.Date(now.getTime()));
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
   

