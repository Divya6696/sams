/*
 * UserDBManager.java
 *
 * Created on March 6, 2006, 5:52 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package org.uta.sams.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.uta.sams.beans.*;
import org.uta.sams.email.*;
/**
 *
 * @author Administrator
 */
public class UserDBManager {

	Connection conn = null;
	/** Creates a new instance of UserDBManager */
	public UserDBManager() {
	}

	public UserBean getUser(String username) throws ClassNotFoundException, SQLException {
		DBConnection connection = DBConnection.getInstance();
		Connection con = connection.getConnection();
		String query = "select u.username, u.email, u.validated, ur.roles,u.password, u.user_id from user u,user_roles ur where u.username='" + username
				+ "' and ur.username=u.username";
		System.out.println(query);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		String password = null;
		UserBean userBean = new UserBean();
		if(rs.next()){
	           userBean.setPassword(rs.getString("password"));
	           userBean.setUsername(rs.getString("username"));
	           userBean.setEmail(rs.getString("email"));
	           userBean.setId(rs.getString("user_id"));
	           userBean.setValidated(rs.getBoolean("validated"));
	           userBean.setRole(rs.getString("roles"));
		} else {
			con.close();
			return null;
		}
		con.close();
		return userBean;
	}
	
	public ArrayList getStudents() {
    	ArrayList studentList = new ArrayList();
    	UserBean student = null;
    	
    	try {
			DBConnection connection=DBConnection.getInstance();
			Connection con=connection.getConnection();
			conn=con;
			
			String query="select * from user as u, user_roles as ur where ur.username = u.username and ur.roles='student'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				student = new UserBean();
				student.setUsername(rs.getString("username"));
				student.setEmail(rs.getString("email"));
                
                
                studentList.add(student);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return studentList;
    }

public String addUser(UserBean userBean) {
    	String query ="";
    	String query1="";
    	String query2="";
    	int i=0;
    	int temp =0;
    	Connection con =null;
    	
    	try {
        DBConnection connection= DBConnection.getInstance();
        con=connection.getConnection();
        conn =con;
        
        query1 = "insert into user(username,email,password) values("+
        		"'" + userBean.getUsername() + "',"+
        		"'" + userBean.getEmail() + "',"+
        		"'" + HashPassword.hashpass(userBean.getPassword()) + "')";
        
        System.out.println("insert user:>"+query1);	
        
        Statement stmt  = con.createStatement();
        stmt.executeUpdate(query1);
        
        query2 = "insert into user_roles(username, roles) values("+"'" + userBean.getUsername() + "'," + "'" + userBean.getRole() + "')";
        
        System.out.println("insert user:>"+query2);	
        
        Statement stmt1  = con.createStatement();
        stmt1.executeUpdate(query2);
        /*
        if(rs.next()){
           userBean.setRole(rs.getString("roles"));
           userBean.setPassword(rs.getString("password"));
           userBean.setUsername(rs.getString("username")); 
        }
        */
       
        con.close();
        String msg="successfully entered the data";
        return msg;
     
    } catch (SQLException ex) {
        ex.printStackTrace();
        return "" ;     }
    catch(ClassNotFoundException ex1){
        ex1.printStackTrace();
        return "error";
    }catch(Exception e){
        e.printStackTrace();
        
    }
    
    return "success";
    
}

public UserBean getPass(String pass) throws ClassNotFoundException, SQLException{
    DBConnection connection= DBConnection.getInstance();
    Connection con=connection.getConnection();
    String query = "select * from user where password='"+pass+"'";
    System.out.println(query);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(query);
    String password=null;
    UserBean userBean = new UserBean();
    if(rs.next()){
       userBean.setPassword(rs.getString("password"));
       userBean.setUsername(rs.getString("username"));
       userBean.setEmail(rs.getString("email"));
       userBean.setId(rs.getString("user_id"));
       userBean.setValidated(rs.getBoolean("validated"));
    }else
    {
        con.close();
        return null;
    }
    con.close();
    return userBean;
} 

public UserBean setPass(UserBean ub, String newpass) throws ClassNotFoundException, SQLException{
    DBConnection connection= DBConnection.getInstance();
    Connection con=connection.getConnection();
    String query = "update user set password='"+newpass+"',validated="+1+" where user_id='"+ub.getId()+"'";
    String query1 = "select * from user where user_id='"+ub.getId()+"'";
    System.out.println(query);
    Statement stmt=con.createStatement();
    System.out.println(stmt.executeUpdate(query));
    ResultSet rs=stmt.executeQuery(query1);
    UserBean userBean = new UserBean();
    if(rs.next()){
       userBean.setPassword(rs.getString("password"));
       userBean.setUsername(rs.getString("username"));
       userBean.setEmail(rs.getString("email"));
       userBean.setId(rs.getString("user_id"));
       userBean.setValidated(rs.getBoolean("validated"));
    }else
    {
        con.close();
        return null;
    }
    con.close();
    return userBean;
}

public UserBean setUser(String id, String username, String password, String email) throws ClassNotFoundException, SQLException{
    DBConnection connection= DBConnection.getInstance();
    Connection con=connection.getConnection();
    String query = "insert into user values('"+id+"','"+password+"', '"+username+"', '"+email+"', 0)";
    System.out.println(query);
    Statement stmt=con.createStatement();
    System.out.println(stmt.executeUpdate(query));
    String query2 = "insert into user_roles(username, roles) values("+"'" + username + "'," + "'" + "student" + "')";
    
    System.out.println("insert user:>"+query2);	
    
    Statement stmt1  = con.createStatement();
    stmt1.executeUpdate(query2);
    UserBean userBean = new UserBean();
//    if(rs.next()){
////       userBean.setEmail(rs.getString("email"));
//       userBean.setPassword(rs.getString("password"));
//       userBean.setUsername(rs.getString("username"));
//    }else
//    {
//        con.close();
//        return null;
//    }
    con.close();
    return userBean;
} 

public boolean updateUser(UserBean ub, String username){
    
   String query="update user set username = '"+ub.getUsername()+"', email = '"+ub.getEmail()+"' WHERE user.username = '"+username+"';";
    
    try {
		DBConnection connection=DBConnection.getInstance();
		Connection con=connection.getConnection();
		conn=con;
		Statement stmt = con.createStatement();
		
		if(stmt.executeUpdate(query)==1) {
			return true;
		} else {
			return false;
		}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    return false;
}

public ArrayList searchUsers(UserBean userbean){
 
     
    System.out.println("In DBManager");
    DBConnection connection=DBConnection.getInstance();
    //String query="select distinct prog_name,term,country,region,prog_type, from programs  where status='active' " ;
    String query="select * from user  where username='"+ userbean.getUsername() +"' and email='"+ userbean.getEmail() +"'";
 
   //   if(!deptcondtion.equalsIgnoreCase("") || !schoolcondition.equalsIgnoreCase(""))query+=" and ( p.prog_id )";
    
    System.out.println("Query is "+query);
    ArrayList userslist=new ArrayList();
    ArrayList finallist=new ArrayList();
    Connection con=null;
    Statement stmt;
    
    try {
        con=connection.getConnection();
        System.out.println("Conection "+con);
        stmt = con.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        
        

        if(rs.next()){
           
                    userbean.setUsername(rs.getString("username"));
                    userbean.setEmail(rs.getString("email"));
                    userbean.setPassword(rs.getString("password"));
                  
                    userslist.add(userbean.getUsername());       
        }
       
        
        
        con.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }catch(ClassNotFoundException ex){
        ex.printStackTrace();
       
    }
    
    System.out.println("userlists is" + userbean.getPassword());

    return userslist;
}



public boolean showUser(String username,String email){
    //String languages="";
    boolean flag=true;
   
    
    DBConnection connection=DBConnection.getInstance();
    
    try {
        Connection con= connection.getConnection();
        Statement stmt= con.createStatement();
        String query ="select username,email from user where username='"+ username +"' and email='"+ email +"'";
        ResultSet rs=stmt.executeQuery(query);
        String userid="";
        if(rs.next())userid=rs.getString("user_id");
        //String depts="";
        flag=true;
        
        con.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
        return false;
    }
    System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> returning true");
    return true;
}


public boolean deleteUser(UserBean ub){
String query="delete from user where username='"+ub.getUsername()+"'";
    try {
		DBConnection connection=DBConnection.getInstance();
		Connection con=connection.getConnection();
		conn=con;
		Statement stmt = con.createStatement();
		
		if(stmt.executeUpdate(query)==1) {
			return true;
		} else {
			System.out.println("error in dbmanager query");
			return false;
		}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    return false;
}

}
