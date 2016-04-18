/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.domain;

/**
 *
 * @author kpratama
 */
public class User {
    private String username;
    private String password;
    private String role;
    private String status;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User() {
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String nim) {
        this.username = nim;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
