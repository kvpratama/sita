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
import sita.domain.Mahasiswa;
import sita.domain.PembimbingTA;
import sita.domain.TA;
import sita.util.DBUtil;
/**
 *
 * @author kpratama
 */
public class Insert {
    public boolean insertNewMahasiswa(Mahasiswa m) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean insert = false;
        try {
            String query = "insert into mahasiswa values (?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, m.getNim());
            ps.setString(2, m.getNama());
            ps.setString(3, m.getAngkatan());
            ps.setString(4, m.getId_jurusan());
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
    public boolean insertPembimbing(PembimbingTA p) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean insert = false;
        try {
            String query = "insert into pembimbing values (?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, p.getNim());
            ps.setString(2, p.getId_dosen());
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
    public boolean insertNewTA(TA newTa) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean insert = false;
        try {
            String query = "insert into ta values (?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, newTa.getNim());
            ps.setString(2, newTa.getJudul());
            ps.setString(3, newTa.getTahun());
            ps.setString(4, newTa.getAbstrak());
            ps.setString(5, newTa.getPath());
            ps.setString(6, "active");
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
    public boolean insertNewUser(String userName, String password) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean insert = false;
        try {
            String query = "insert into user values (?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, "0002");
            ps.setString(4, "active");
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
