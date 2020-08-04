/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impl;

import entity.Item;
import java.sql.*;
import static dbc.DBUtil.*;
import java.util.ArrayList;
import java.util.List;
import log.*;

/**
 *
 * @author Administrator
 */
public class ItemImpl {
    public static int add(Item item) throws Exception {
        String sql = "insert into item(item_no,item_id,item_price,item_pic,store_no,item_audienceno,item_typeno) values(?,?,?,?,?,?,?)";
        if(item.getItem_no() == null || item.getItem_no().length() == 0) {
            item.setItem_no(genNumber.getno());
        }
        try (Connection conn = getConnection();) {
            return exceuteUpdate(conn, sql, new Object[]{item.getItem_no(), item.getItem_id(), item.getItem_price(), item.getItem_pic(),
                item.getStore_no(), item.getItem_audienceno(), item.getItem_typeno()});
        }
    }
    public static Item findNoItem(String name) throws Exception {
        String sql = "select * from item where item_no=?";
        Item item = null;
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    item = new Item(rs.getString("item_no"), rs.getString("item_id"), rs.getString("item_price"), rs.getString("item_pic"), rs.getString("store_no"), rs.getString("item_audienceno"),
                        rs.getString("item_typeno"));
                }
                return item;
            }
        }
    }
    public static Item findIdItem(String name) throws Exception {
        String sql = "select * from item where item_id=?";
        Item item = null;
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    item = new Item(rs.getString("item_no"), rs.getString("item_id"), rs.getString("item_price"), rs.getString("item_pic"), rs.getString("store_no"), rs.getString("item_audienceno"),
                        rs.getString("item_typeno"));
                }
                return item;
            }
        }
    }
    public static List<Item> findStoreItem(String name) throws Exception {
        String sql = "select * from item where store_id=?";
        List<Item> item = new ArrayList<>();
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Item ite = new Item(rs.getString("item_no"), rs.getString("item_id"), rs.getString("item_price"), rs.getString("item_pic"), rs.getString("store_no"), rs.getString("item_audienceno"),
                        rs.getString("item_typeno"));
                    item.add(ite);
                } return item;
            }
        }
    }
    
    public static List<Item> findFirstItem(String name) throws Exception {
        String sql = "select * from item where item_audienceno=?";
        List<Item> item = new ArrayList<>();
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Item ite = new Item(rs.getString("item_no"), rs.getString("item_id"), rs.getString("item_price"), rs.getString("item_pic"),
                            rs.getString("store_no"), rs.getString("item_audienceno"), rs.getString("item_typeno"));
                    item.add(ite);
                } return item;
            }
        }
    }
    
    public static List<Item> findSecondItem(String name) throws Exception {
        String sql = "select * from item where item_typeno=?";
        List<Item> item = new ArrayList<>();
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Item ite = new Item(rs.getString("item_no"), rs.getString("item_id"), rs.getString("item_price"), rs.getString("item_pic"),
                            rs.getString("store_no"), rs.getString("item_audienceno"), rs.getString("item_typeno"));
                    item.add(ite);
                } return item;
            }
        }
    }
}
