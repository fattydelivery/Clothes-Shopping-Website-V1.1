/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impl;

import dbc.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class StoreImpl {
    public static List<String> findAllNo() throws Exception {
        String sql = "select * from store";
        List<String> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql);) {
            while (rs.next()) {
                list.add(rs.getString("store_no"));
            }
        }
        return list;
    }
    // 通过store_no查找store_id
    public static String findByNo(String name) throws Exception {
        String sql = "select * from store where store_no=?";
        String str = null;
        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    str = rs.getString("store_id");
                }
                return str;
            }
        }
    }
    // 通过store_id查找store_no
    public static String findById(String name) throws Exception {
        String sql = "select * from store where store_id=?";
        String str = null;
        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    str = rs.getString("store_no");
                }
                return str;
            }
        }
    }
}
