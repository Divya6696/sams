/*
 * UserController.java
 *
 * Created on March 6, 2006, 5:51 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package org.uta.sams.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import org.uta.sams.beans.UserBean;
import org.uta.sams.dbconnection.ProgramDBManager;
import org.uta.sams.dbconnection.UserDBManager;
import org.uta.sams.email.*;

/**
 *
 * @author Administrator
 */
public class UserController {
    
    /** Creates a new instance of UserController */
    public UserController() {
    }
    
    public boolean check(UserBean userbean) throws ClassNotFoundException, SQLException{
        UserDBManager userdbmanager= new UserDBManager();
        UserBean ub;
        ub = userdbmanager.getUser(userbean.getUsername());
        if(ub==null) return false;
        if(ub.getValidated()){
        	System.out.println("validated");
        	return true;
        }
        else
        	return false;
        //return ub;
    }
    
    public UserBean getUserByUserName(String username) throws ClassNotFoundException, SQLException {
    	return(new UserDBManager().getUser(username));
    }
    
    public boolean updateUser(UserBean ub, String name) {
    	if(new UserDBManager().updateUser(ub, name)) {
    		return true;
    	}
    	else {
    		return false;
    	}
    }
    
    public String showUser(String username,String email){
        boolean getResponse = (new UserDBManager()).showUser(username, email);
       String sendResponse;
        if(getResponse)
       {
        sendResponse = "Found a matching record";
       }
       else
       {
       sendResponse = "No matching record found";
       }
        return sendResponse ;
    }
    
    public boolean deleteUser(UserBean ub){
        return(new UserDBManager().deleteUser(ub));
    }
    
    public ArrayList searchUsers(UserBean userbean){
        System.out.println("In Controller search? ");
        return (new UserDBManager()).searchUsers(userbean);
    }
    
    public ArrayList getStudents(){
        System.out.println("In Controller ");
        return (new UserDBManager()).getStudents();
    }
    
    public String addUser(UserBean userBean){
        UserDBManager userdbmanager = new UserDBManager();
        userBean.setPassword(RandomPasswordGenerator.genpass());
        String msg= userdbmanager.addUser(userBean);
        try {
            Email userEmail = new Email("SAMS Account Created",
					"<p>Your account for SAMS has been created! Your account information is:</p>"
					+"<p>Role: Student </p>"
					+"<p>UserName: "+userBean.getUsername()+"</p>"
					+"<p>Password: "+userBean.getPassword()+"</p>",
					userBean.getEmail());
			userEmail.sendMail();
        } catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return msg;
    } 
    
    public UserBean checkUser(UserBean userbean){
        UserDBManager userdbmanager= new UserDBManager();
        UserBean ub;
        try {
            ub = userdbmanager.getUser(userbean.getUsername());
            System.out.println("ub pass:"+ub.getPassword());
            System.out.println("userbean pass:"+userbean.getPassword());
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        if(ub==null) {
        	System.out.println("ub null");
        	return ub;
        }
//        HashPassword hash = new HashPassword();
        if(ub.isCorrectPassword(userbean.getPassword()))
        	return ub;
        else
        	System.out.println("password wrong");
            return null;
        //return ub;
    }
    
    public UserBean checkUserOld(UserBean userbean){
        UserDBManager userdbmanager= new UserDBManager();
        UserBean ub;
        try {
            ub = userdbmanager.getUser(userbean.getUsername());
            System.out.println("ub pass:"+ub.getPassword());
            System.out.println("userbean pass:"+userbean.getPassword());
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        if(ub==null) {
        	System.out.println("ub null");
        	return ub;
        }
        HashPassword hash = new HashPassword();
        if(ub.isCorrectPassword(hash.hashpass(userbean.getPassword())))
        	return ub;
        else
        	System.out.println("password wrong");
            return null;
        //return ub;
    }
    
    public UserBean change(String pass) {
    	UserDBManager userdbmanager= new UserDBManager();
        UserBean ub;
        HashPassword hash = new HashPassword();
        try {
        	
            ub = userdbmanager.getPass(hash.hashpass(pass));
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        if(ub==null) {
        	return ub;
        }
        if(ub.isCorrectPassword(hash.hashpass(pass))) {
        	return ub;
        }
        else
            return null;
        
    }
    
    public UserBean changepass(UserBean userbean, String newpass) {
    	UserDBManager userdbmanager= new UserDBManager();
        UserBean ub;
        try {
        	HashPassword hash = new HashPassword();
        	String hashpass = hash.hashpass(newpass);
        	System.out.println(hashpass);        	
            ub = userdbmanager.setPass(userbean,hashpass);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        if(ub==null) {
        	return ub;
        }
        return ub;
        
    }
    
    public UserBean set(UserBean userbean) {
    	UserDBManager userdbmanager= new UserDBManager();
        UserBean ub = new UserBean();
        HashPassword hash = new HashPassword();
        System.out.println("passsss set: "+userbean.getPassword());
        try {
            ub = userdbmanager.setUser(userbean.getId(),userbean.getUsername(), HashPassword.hashpass(userbean.getPassword()),userbean.getEmail());
            Email userEmail = new Email("SAMS Account Created",
					"<p>Your account for SAMS has been created! Your account information is:</p>"
					+"<p>Role: Student </p>"
					+"<p>UserName: "+userbean.getUsername()+"</p>"
					+"<p>Password: "+userbean.getPassword()+"</p>",
					userbean.getEmail());
			userEmail.sendMail();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return ub;
    }
    
    
}
