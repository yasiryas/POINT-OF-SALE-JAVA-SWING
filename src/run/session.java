/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package run;

/**
 *
 * @author HP
 */
public class session {
    private static String nama;
    private static String level;
    private static String id;
    private static String username;
    private static String email;
     private static String password;
    
    public static void setUser(String nama){
        session.nama = nama;      
    }
    
    public static String getUser(){
    return nama;
    }
    
    public static void setLevel(String level){
        session.level = level;      
    }
    
    public static String getLevel(){
    return level;
    }
    
    public static void setId(String id){
        session.id = id;      
    }
    
    public static String getId(){
    return id;
    }
    
    public static void setUsername(String username){
        session.username = username;      
    }
    
    public static String getUsername(){
    return username;
    }
    
    public static void setEmail(String email){
        session.email = email;      
    }
    
    public static String getEmail(){
    return email;
    }
    
    public static void setPassword(String password){
        session.password = password;      
    }
    
    public static String getPassword(){
    return password;
    }
    
}
