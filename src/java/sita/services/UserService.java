/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sita.domain.User;
import sita.util.DBUtil;

/**
 *
 * @author kpratama
 */
public class UserService {

    public ArrayList getUser() {
        DBUtil dbu = new DBUtil();
        Connection conn = null;
        conn = dbu.getConnection();
        Statement st = null;
        ResultSet rs = null;
        ArrayList<User> user = new ArrayList<User>();
        try {
//            ps = conn.prepareStatement("select uid, email, password, status from user");
//            rs = ps.executeQuery();
            st = conn.createStatement();
            rs = st.executeQuery("select username, password, role, status from user");
            if (null != rs) {
                while (rs.next()) {
                    User u = new User();
                    u.setUsername(rs.getString(1));
                    u.setPassword(rs.getString(2));
                    u.setRole(rs.getString(3));
                    u.setStatus(rs.getString(4));
                    user.add(u);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            dbu.close(rs);
            dbu.close(st);
            dbu.close(conn);
        }
        return user;
    }
}
