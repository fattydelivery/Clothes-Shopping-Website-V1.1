/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Administrator
 */
public class User {
    String user_no, user_id, user_passwd, user_phone, user_addr;

    @Override
    public String toString() {
        return "User{" + "user_no=" + user_no + ", user_id=" + user_id + ", user_passwd=" + user_passwd + ", user_phone=" + user_phone + ", user_addr=" + user_addr + '}';
    }
    
    public User(String user_no, String user_id, String user_passwd, String user_phone, String user_addr) {
        this.user_no = user_no;
        this.user_id = user_id;
        this.user_passwd = user_passwd;
        this.user_phone = user_phone;
        this.user_addr = user_addr;
    }

    public User(String user_id, String user_passwd, String user_phone, String user_addr) {
        this.user_id = user_id;
        this.user_passwd = user_passwd;
        this.user_phone = user_phone;
        this.user_addr = user_addr;
    }
    
    
    public String getUser_no() {
        return user_no;
    }

    public void setUser_no(String user_no) {
        this.user_no = user_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_passwd() {
        return user_passwd;
    }

    public void setUser_passwd(String user_passwd) {
        this.user_passwd = user_passwd;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_addr() {
        return user_addr;
    }

    public void setUser_addr(String user_addr) {
        this.user_addr = user_addr;
    }
    
}
