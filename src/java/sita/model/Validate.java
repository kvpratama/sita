/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.model;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import sita.domain.User;
import sita.services.UserService;

/**
 *
 * @author kpratama
 */
public class Validate {

    public boolean validateLogin(String username, String password) {
        UserService us = new UserService();
        ArrayList<User> users = us.getUser();
        boolean login = false;
        for (int i = 0; i < users.size(); i++) {
            if (username.equals(users.get(i).getUsername())
                    && password.equals(users.get(i).getPassword()) 
                    && users.get(i).getStatus().equals("active")) {
                login = true;
            }
        }
        return login;
    }

    public boolean validateSession(HttpServletRequest request) {
        if (request.getSession().getAttribute("login") != null) {
            return true;
        } else {
            return false;
        }
    }
}
