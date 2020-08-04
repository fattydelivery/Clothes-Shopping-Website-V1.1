/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impl;

import static dbc.DBUtil.getConnection;
import entity.FirstClothesClass;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class FirstClothesClassImpl {
    public static FirstClothesClass findByNo(String name) throws Exception {
        String sql = "select * from firstclothesclass where first_no=?";
        FirstClothesClass fcc = null;
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    fcc = new FirstClothesClass(rs.getString("first_no"), rs.getString("first_id"));
                    System.out.println(fcc.toString());
                } return fcc;
            }
        }
    }
    
    public static List<FirstClothesClass> findAll() throws Exception {
        String sql = "select * from firstclothesclass";
        List<FirstClothesClass> fcc = new ArrayList<>();
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    FirstClothesClass fc = new FirstClothesClass(rs.getString("first_no"), rs.getString("first_id"));
                    fcc.add(fc);
                }
                return fcc;
            }
        }
    }
}
