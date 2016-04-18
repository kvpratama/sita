/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.model;

import sita.services.UpdateDB;

/**
 *
 * @author kpratama
 */
public class UpdateModel {

    public boolean updatePassword(String username, String oldPassword,
            String newPassword1, String newPassword2) {
        Validate v = new Validate();
        if (v.validateLogin(username, oldPassword)) {
            if (newPassword1.equals(newPassword2)) {
                UpdateDB u = new UpdateDB();
                u.updatePassword(username, newPassword1);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    
    public boolean updateUserStatus(String username, String newStatus){
        UpdateDB u = new UpdateDB();
        return u.updateUserStatus(username, newStatus);
    }
    
    public boolean updateTaStatus(String nim, String newStatus){
        UpdateDB u = new UpdateDB();
        return u.updateTaStatus(nim, newStatus);
    }
}
