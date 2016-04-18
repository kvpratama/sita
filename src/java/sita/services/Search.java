/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import sita.domain.Dosen;
import sita.domain.PembimbingTA;
import sita.domain.Role;
import sita.domain.TA;
import sita.domain.UserRole;
import sita.domain.t_log;
import sita.util.DBUtil;

/**
 *
 * @author kpratama
 */
public class Search {

    public ArrayList search(String query) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        Statement st = null;
        ResultSet rs = null;
        ArrayList<TA> ta = new ArrayList<TA>();
        try {
            st = conn.createStatement();
//            System.out.println("query: " + query);
            rs = st.executeQuery(query);
            while (rs.next()) {
                TA t = new TA();
                t.setNim(rs.getString(1));
                t.setJudul(rs.getString(2));
                t.setNama_mahasiswa(rs.getString(3));
                t.setTahun(rs.getString(4));
                t.setAbstrak(rs.getString(5));
                t.setPath(rs.getString(6));
                t.setStatus(rs.getString(7));
                ta.add(t);
            }
        } catch (SQLException ex) {
            System.out.println("error");
        } finally {
            dbu.close(rs);
            dbu.close(st);
            dbu.close(conn);
        }
        return ta;
    }

    public ArrayList getDosen() {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        Statement st = null;
        ResultSet rs = null;
        ArrayList<Dosen> dosen = new ArrayList<Dosen>();
        try {
            st = conn.createStatement();
            rs = st.executeQuery("select id_dosen, nama_dosen from dosen");
            while (rs.next()) {
                Dosen d = new Dosen();
                d.setDosen_id(rs.getString(1));
                d.setName(rs.getString(2));
                dosen.add(d);
            }
        } catch (SQLException ex) {
        } finally {
            dbu.close(rs);
            dbu.close(st);
            dbu.close(conn);
        }
        return dosen;
    }

    public ArrayList getPembimbing() {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        Statement st = null;
        ResultSet rs = null;
        ArrayList<PembimbingTA> pembimbing = new ArrayList<PembimbingTA>();
        try {
            st = conn.createStatement();
            rs = st.executeQuery("select nim, id_dosen from pembimbing");
            while (rs.next()) {
                PembimbingTA pta = new PembimbingTA();
                pta.setNim(rs.getString(1));
                pta.setId_dosen(rs.getString(2));
                pembimbing.add(pta);
            }
        } catch (SQLException ex) {
        } finally {
            dbu.close(rs);
            dbu.close(st);
            dbu.close(conn);
        }
        return pembimbing;
    }

    public String getNamaMahasiswa(String username) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        Statement st = null;
        ResultSet rs = null;
        String result = "";
        try {
            st = conn.createStatement();
            rs = st.executeQuery("select nama_mahasiswa from mahasiswa where nim = " + username);
            while (rs.next()) {
                result = rs.getString(1);
            }
        } catch (SQLException ex) {
        } finally {
            dbu.close(rs);
            dbu.close(st);
            dbu.close(conn);
        }
        return result;
    }

    public int count(String query) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        Statement st = null;
        ResultSet rs = null;
        int row = 0;
        try {
            st = conn.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                row = rs.getInt(1);
            }
        } catch (SQLException ex) {
        } finally {
            dbu.close(rs);
            dbu.close(st);
            dbu.close(conn);
            return row;
        }
    }

    public ArrayList<t_log> getLog(String nim) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        Statement st = null;
        ResultSet rs = null;
        ArrayList<t_log> log = new ArrayList<t_log>();
        String query = "select log_date, log_level, log_location, log_message from t_log where log_message like '%"
                + nim + "%'";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                t_log tLog = new t_log();
                tLog.setLog_date(rs.getString(1));
                tLog.setLog_level(rs.getString(2));
                tLog.setLog_location(rs.getString(3));
                tLog.setLog_message(rs.getString(4));
                log.add(tLog);
            }
        } catch (SQLException ex) {
        } finally {
            dbu.close(rs);
            dbu.close(st);
            dbu.close(conn);
        }
        return log;
    }

    public ArrayList<UserRole> getUser(String role) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        Statement st = null;
        ResultSet rs = null;
        ArrayList<UserRole> userRole = new ArrayList<UserRole>();
        String query = "select u.username, r.role_name, u.status from user u join role r where u.role = r.role_id and r.role_name = '" + role + "'";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                UserRole u = new UserRole();
                u.setUsername(rs.getString(1));
                u.setRole_name(rs.getString(2));
                u.setStatus(rs.getString(3));
                userRole.add(u);
            }
        } catch (SQLException ex) {
        } finally {
            dbu.close(rs);
            dbu.close(st);
            dbu.close(conn);
        }
        return userRole;
    }

    public Role getRole(String uri) {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        Statement st = null;
        ResultSet rs = null;
        Role u = new Role();
        String query = "select r.role_name, f.uri from role r join authorize a on r.role_id = a.role_id join feature f on f.f_id = a.f_id where f.uri = '" + uri + "'";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                u.setRole_name(rs.getString(1));
                u.setUri(rs.getString(2));
            }
        } catch (SQLException ex) {
        } finally {
            dbu.close(rs);
            dbu.close(st);
            dbu.close(conn);
        }
        return u;
        //select r.role_name, a.role_id, f.f_name from 
        //role r join authorize a on r.role_id = a.role_id 
        //join feature f on f.f_id = a.f_id
    }
}