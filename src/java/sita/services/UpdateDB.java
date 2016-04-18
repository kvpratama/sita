/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import sita.util.DBUtil;

/**
 *
 * @author kpratama
 */
public class UpdateDB {

    public boolean updatePassword(String username, String newPassword) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean insert = false;
        try {
            String query = "update user set password = ? where username=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.execute();
            conn.commit();
            insert = true;
        } catch (SQLException ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbu.close(rs);
            dbu.close(ps);
            dbu.close(conn);
            return insert;
        }
    }
    
    public boolean updateUserStatus(String username, String newStatus) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean insert = false;
        try {
            String query = "update user set status = ? where username= ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newStatus);
            ps.setString(2, username);
            ps.execute();
            conn.commit();
            insert = true;
        } catch (SQLException ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbu.close(rs);
            dbu.close(ps);
            dbu.close(conn);
            return insert;
        }
    }
    public boolean updateTaStatus(String nim, String newStatus) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean insert = false;
        try {
            String query = "update ta set status = ? where nim= ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, newStatus);
            ps.setString(2, nim);
            ps.execute();
            conn.commit();
            insert = true;
        } catch (SQLException ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbu.close(rs);
            dbu.close(ps);
            dbu.close(conn);
            return insert;
        }
    }
}
