/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.domain;

/**
 *
 * @author kpratama
 */
public class UserRole {
    private String username;
    private String role_name;
    private String status;

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
