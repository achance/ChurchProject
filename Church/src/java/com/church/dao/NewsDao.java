/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.dao;

import com.church.bean.Newsandevent;
import com.church.utils.DBPool;
import com.church.utils.StringUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

public class NewsDao {

    public static Logger logger = Logger.getLogger(ContactDao.class);
    private PreparedStatement pstmt;
    private ResultSet rs;
    private Connection conn;

    public int insertNewsandevent(Newsandevent newsandevent) {
        //sql
        String strSQL = "INSERT INTO newsandevent (title,description,published_time,created_time,updated_time,status) "
                + "VALUES (?,?,?,getdate(),getdate(),?)";
        
        //mysql
        strSQL = "INSERT INTO newsandevent (title,description,published_time,created_time,updated_time,status) "
                + "VALUES (?,?,?,now(),now(),?)";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, newsandevent.getTitle());
            pstmt.setString(2, newsandevent.getDescription());
            pstmt.setDate(3, new java.sql.Date(StringUtils.parseDatefromDay(newsandevent.getPublished_time()).getTime()));
            pstmt.setInt(4, newsandevent.getStatus());
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
            logger.error("error in insertNewsandevent function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return 0;
    }

    public List<Newsandevent> getNewsandeventList() {
        List<Newsandevent> list = new ArrayList<>();
        String strSQL = "SELECT * FROM newsandevent order by updated_time desc";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Newsandevent newsevent = new Newsandevent();
                newsevent.setId(rs.getInt("id"));
                newsevent.setStatus(rs.getInt("status"));
                newsevent.setTitle(rs.getString("title"));
                newsevent.setDescription(rs.getString("description"));
                if (newsevent.getDescription().length() > 20) {
                    newsevent.setMinidesc(newsevent.getDescription().substring(0, 20) + "...");
                } else {
                    newsevent.setMinidesc(newsevent.getDescription());
                }
                newsevent.setPublished_time(StringUtils.formatDay(rs.getTimestamp("published_time")));
                newsevent.setCreated_time(StringUtils.formatDate(rs.getTimestamp("created_time")));
                newsevent.setUpdated_time(StringUtils.formatDate(rs.getTimestamp("updated_time")));
                list.add(newsevent);
            }
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    logger.error("error in rollback Connection", ex);
                }
            }
            logger.error("error in getNewsandeventList function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return list;
    }

    public int updateNewsandevent(Newsandevent newsandevent) {
        //sql
        String strSQL = "update newsandevent set title = ?,description = ?,published_time = ?,status=?,"
                + "updated_time =getdate() where id = ?";
        
        //mysql
        strSQL = "update newsandevent set title = ?,description = ?,published_time = ?,status=?,"
                + "updated_time =now() where id = ?";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, newsandevent.getTitle());
            pstmt.setString(2, newsandevent.getDescription());
            pstmt.setDate(3, new java.sql.Date(StringUtils.parseDatefromDay(newsandevent.getPublished_time()).getTime()));
            pstmt.setInt(4, newsandevent.getStatus());
            pstmt.setInt(5, newsandevent.getId());
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
            logger.error("error in updateNewsandevent function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return 0;
    }

    public int updateStatus(int id, int status) {
        //sql
        String strSQL = "update newsandevent set status = ?, updated_time =getdate() where id = ?";
        
        //mysql
        strSQL = "update newsandevent set status = ?, updated_time =now() where id = ?";
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
            logger.error("error in updateNewsandevent function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return 0;
    }

    public List<Newsandevent> getTop4MonthList() {
        List<Newsandevent> list = new ArrayList<>();
        //mysql thoi con sql chu tu viet
        String strSQL = "select DATE_FORMAT(published_time,'%M') month, "
                + "DATE_FORMAT(max(published_time),'%Y-%m') times "
                + "from newsandevent where status=1 group by DATE_FORMAT(published_time,'%M') "
                + "order by published_time desc limit 0,4";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Newsandevent newsevent = new Newsandevent();
                newsevent.setMonth(rs.getString("month"));
                newsevent.setPublished_time(rs.getString("times"));
                list.add(newsevent);
            }
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    logger.error("error in rollback Connection", ex);
                }
            }
            logger.error("error in getNewsandeventList function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return list;
    }

    public List<Newsandevent> getNewsandeventListbyPublishTime(String publishTime) {
        List<Newsandevent> list = new ArrayList<>();
    //mysql thoi con sql chu tu viet
        String strSQL = "SELECT id,title,description,published_time, "
                + "DATE_FORMAT(published_time,'%M') month, "
                + "DATE_FORMAT(published_time,'%d') day FROM newsandevent "
                + "where DATE_FORMAT(published_time,'%Y-%m') = ? and status=1 order by published_time desc";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, publishTime);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Newsandevent newsevent = new Newsandevent();
                newsevent.setId(rs.getInt("id"));
                newsevent.setTitle(rs.getString("title"));
                newsevent.setDescription(rs.getString("description"));
                if (newsevent.getDescription().length() > 20) {
                    newsevent.setMinidesc(newsevent.getDescription().substring(0, 20) + "...");
                } else {
                    newsevent.setMinidesc(newsevent.getDescription());
                }
                newsevent.setPublished_time(StringUtils.formatDay(rs.getTimestamp("published_time")));
                newsevent.setMonth(rs.getString("month"));
                newsevent.setDay(rs.getString("day"));
                list.add(newsevent);
            }
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    logger.error("error in rollback Connection", ex);
                }
            }
            logger.error("error in getNewsandeventList function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return list;
    }

    public Newsandevent getLastestNewsandevent() {
        Newsandevent newsevent = null;
        //mysql thoi con sql chu tu viet
        String strSQL = "SELECT * FROM newsandevent order by published_time desc limit 0,1";
        try {
            conn = DBPool.getConnection();
            pstmt = conn.prepareStatement(strSQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                newsevent = new Newsandevent();
                newsevent.setId(rs.getInt("id"));
                newsevent.setStatus(rs.getInt("status"));
                newsevent.setTitle(rs.getString("title"));
                newsevent.setDescription(rs.getString("description"));
                if (newsevent.getDescription().length() > 20) {
                    newsevent.setMinidesc(newsevent.getDescription().substring(0, 20) + "...");
                } else {
                    newsevent.setMinidesc(newsevent.getDescription());
                }
                newsevent.setPublished_time(StringUtils.formatDay(rs.getTimestamp("published_time")));
                newsevent.setCreated_time(StringUtils.formatDate(rs.getTimestamp("created_time")));
                newsevent.setUpdated_time(StringUtils.formatDate(rs.getTimestamp("updated_time")));
            }
        } catch (Exception e) {
            newsevent = null;
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    logger.error("error in rollback Connection", ex);
                }
            }
            logger.error("error in getLastestNewsandevent function", e);
        } finally {
            DBPool.releaseConnection(conn, pstmt, rs);
        }
        return newsevent;
    }
}
