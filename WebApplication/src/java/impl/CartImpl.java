/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impl;

import static dbc.DBUtil.exceuteUpdate;
import static dbc.DBUtil.getConnection;
import entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import log.genNumber;

/**
 *
 * @author Administrator
 */
public class CartImpl {
    public static int add(Cart cart) throws Exception {
        String sql = "insert into cart(cart_no,item_amount,item_no,user_no,item_size,item_color) values(?,?,?,?,?,?)";
        if(cart.getCart_no() == null || "".equals(cart.getCart_no())) {
            cart.setCart_no(genNumber.getno());
            System.out.println(cart.toString());
        }
        try (Connection conn = getConnection();) {
            return exceuteUpdate(conn, sql, new Object[]{cart.getCart_no(), cart.getItem_amount(), cart.getItem_no(), cart.getUser_no(), cart.getItem_size(), cart.getItem_color()});
        }
    }

    public static List<Cart> findCartUser(String name) throws Exception {
        String sql = "select * from cart where user_no=?";
        List<Cart> cart = new ArrayList<>();
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Cart car = new Cart(rs.getString("cart_no"), rs.getString("item_amount"), rs.getString("item_no"), rs.getString("user_no"), rs.getString("item_size"), rs.getString("item_color"));
                    cart.add(car);
                }
                return cart;
            }
        }
    }
    public static int deleteCartId(String name) throws Exception {
        String sql = "delete from cart where cart_no=?";
        try (Connection conn = getConnection();) {
            return exceuteUpdate(conn, sql, new String[]{name});
        }
    }
}
