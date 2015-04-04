package com.church.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.LinkedList;
import org.apache.log4j.Logger;

// This file is packaged in every .jar and .war modul.
// Therefore, the class is loaded for each modul.
// In other word, How many moduls, how many DBPool are created.
// Make pool connect to oracle db, user smsgw
public class DBPool {

    private static final Logger logger = Logger.getLogger(DBPool.class);

    private static LinkedList pool = new LinkedList();
    public final static int MAX_CONNECTIONS = 10;
    public final static int INI_CONNECTIONS = 2;

    static { //Make connections
        build(ResourceLoader.getInt("maxConnections"));
    }

    public static void build(int number) {
        logger.info("Establishing " + number + " connections...");
        Connection conn = null;
        release();
        for (int i = 0; i < number; i++) {
            try {
                conn = makeDBConnection();
            } catch (SQLException ex) {
                logger.info("Error: " + ex.getMessage());
                logger.info("Hix,Khong noi dc voi database roi !");
            }
            if (conn != null) {
                pool.addLast(conn);
            }
        }
        logger.info("Number of connection: " + size());
    }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            synchronized (pool) {
                conn = (java.sql.Connection) pool.removeFirst();
            }
            if (conn == null) {
                conn = makeDBConnection();
            }
            try {
                conn.setAutoCommit(true);
            } catch (Exception ex) {
            }

        } catch (Exception e) {
            logger.error("Method getConnection(): Error executing >>>" + e.toString());
            try {
                logger.info("Make connection again.");
                conn = makeDBConnection();
                conn.setAutoCommit(true);
            } catch (SQLException e1) {
            }
            logger.info("" + conn);
        }
        return conn;
    }

    public static void putConnection(java.sql.Connection conn) {
        try { // Ignore closed connection
            if (conn == null || conn.isClosed()) {
                logger.info("putConnection: conn is null or closed: " + conn);
                return;
            }
            if (pool.size() >= MAX_CONNECTIONS) {
                conn.close();
                return;
            }
        } catch (SQLException ex) {
        }

        synchronized (pool) {
            pool.addLast(conn);
            pool.notify();
        }
    }

    // Remove and close all connections in pool
    public static void release() {
        logger.info("Closing connections in pool...");
        synchronized (pool) {
            for (Iterator it = pool.iterator(); it.hasNext();) {
                Connection conn = (Connection) it.next();
                try {
                    conn.close();
                } catch (SQLException e) {
                    logger.error(
                            "release: Cannot close connection! (maybe closed?)");
                }
            }
            pool.clear();
        }
        logger.info("Release connection OK");
    }

    public static int size() {
        synchronized (pool) {
            return pool.size();
        }
    }

    public static boolean isEmpty() {
        synchronized (pool) {
            return pool.isEmpty();
        }
    }

    public void finalize() {
        release();
    }

    public static boolean isClosed() {
        boolean closed = false;
        synchronized (pool) {
            for (Iterator it = pool.iterator(); it.hasNext();) {
                try {
                    Connection conn = (Connection) it.next();
                    if (conn == null || conn.isClosed()) {
                        closed = true;
                    }
                } catch (SQLException e) {
                    closed = true;
                }
            }
        }
        return closed;
    }

    //--------------------------------------------------------------------------

    public static Connection makeDBConnection() throws SQLException {
        Connection conn = null;
        try {
            Class.forName(ResourceLoader.getString("driver"));
            System.out.println("DBConfig.db_url_sql=" + ResourceLoader.getString("host"));
            System.out.println("DBConfig.db_user_sql=" + ResourceLoader.getString("username"));
            conn = DriverManager.getConnection(
                    ResourceLoader.getString("host"),
                    ResourceLoader.getString("username"),
                    ResourceLoader.getString("password"));

        } catch (Exception e) {
            // TODO: handle exception
        }
        return conn;
    }

    public static void main(String args[]) {

        System.out.println(DBPool.getConnection());

    }

    public static void load() {
    }

    public static void releaseConnection(Connection conn, PreparedStatement preStmt) {
        //try {if (conn != null) {conn.close(); } } catch (SQLException e) { }
        putConnection(conn);
        try {
            if (preStmt != null) {
                preStmt.close();
            }
        } catch (SQLException e) {
        }
    }

    public static void releaseConnection(Connection conn, PreparedStatement preStmt, ResultSet rs) {
        releaseConnection(conn, preStmt);
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
        }
    }

    public static void releaseConnection(Connection conn, PreparedStatement preStmt, Statement stmt, ResultSet rs) {
        releaseConnection(conn, preStmt, rs);
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
        }
    }
}
