/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impl;

import static dbc.DBUtil.*;
import entity.User;
import java.sql.*;
import log.genNumber;

public class UserImpl {

    public static int add(User user) throws Exception {
        String sql = "insert into user(user_no,user_id,user_passwd,user_phone, user_addr) values(?,?,?,?,?)";
        if(user.getUser_no() == null || user.getUser_no().length() == 0) {
            user.setUser_no(genNumber.getno());
        }
        try (Connection conn = getConnection();) {
            return exceuteUpdate(conn, sql, new Object[]{user.getUser_no(), user.getUser_id(), user.getUser_passwd(), user.getUser_phone(), user.getUser_addr()});
        }
    }

    public static User findIdUser(String name) throws Exception {
        String sql = "select * from user where user_id=?";
        User use = null;
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    use = new User(rs.getString("user_no"), rs.getString("user_id"), rs.getString("user_passwd"), rs.getString("user_phone"), rs.getString("user_addr"));
                }
                return use;
            }
        }
    }
    public static User findNoUser(String name) throws Exception {
        String sql = "select * from user where user_no=?";
        User use = null;
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    use = new User(rs.getString("user_no"), rs.getString("user_id"), rs.getString("user_passwd"), rs.getString("user_phone"), rs.getString("user_addr"));
                }
                return use;
            }
        }
    }
}
