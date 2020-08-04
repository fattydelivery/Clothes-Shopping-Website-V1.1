/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impl;

import static dbc.DBUtil.getConnection;
import entity.SecondClothesClass;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class SecondClothesClassImpl {
    public static SecondClothesClass findByNo(String name) throws Exception {
        String sql = "select * from secondclothesclass where second_secondno=?";
        SecondClothesClass sc = null;
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    sc = new SecondClothesClass(rs.getString("second_secondno"), rs.getString("second_firstno"), rs.getString("second_secondid"));
                }
                return sc;
            }
        }
    }
    
    public static List<SecondClothesClass> findByFN(String name) throws Exception {
        String sql = "select * from SecondClothesClass where second_firstno=?";
        List<SecondClothesClass> scc = new ArrayList<>();
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    SecondClothesClass sc = new SecondClothesClass(rs.getString("second_secondno"), rs.getString("second_firstno"), rs.getString("second_secondid"));
                    scc.add(sc);
                }
                return scc;
            }
        }
    }
}
