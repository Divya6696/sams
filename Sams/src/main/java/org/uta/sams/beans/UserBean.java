/*
 * UserBean.java
 *
 * Created on March 6, 2006, 5:44 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package org.uta.sams.beans;

/**
 *
 * @author Administrator
 */
public class UserBean {
    
    private String username;
    private String password;
    private String role;
    private String email;
    private String id;
    private boolean  validated;
    
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isValidated() {
		return validated;
	}
	
	public boolean getValidated() {
    	return validated;
    }

	public void setValidated(boolean validated) {
		this.validated = validated;
	}
    
    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/** Creates a new instance of UserBean */
    public UserBean() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public boolean isCorrectPassword(String pass){
        if(this.password.equals(pass)){
            System.out.println(">>>>>>>>>passwods are same");
            return true;
        }
        return false;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
}
