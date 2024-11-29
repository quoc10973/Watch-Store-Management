/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user_watch;

/**
 *
 * @author DELL'
 */
public class userDTO {
    private String userId;
    private int password;
    private String fullName;
    private int role;

    public userDTO() {
    }

    public userDTO(String userId, int password, String fullName, int role) {
        this.userId = userId;
        this.password = password;
        this.fullName = fullName;
        this.role = role;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
    
}
