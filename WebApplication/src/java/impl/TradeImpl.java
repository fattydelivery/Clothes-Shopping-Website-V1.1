/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impl;

import static dbc.DBUtil.exceuteUpdate;
import static dbc.DBUtil.getConnection;
import entity.Trade;
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
public class TradeImpl {

    public static int add(Trade trade) throws Exception {
        String sql = "insert into trade(trade_no,item_amount,item_no,user_no,item_size,item_color) values(?,?,?,?,?,?)";
        if(trade.getTrade_no() == null || trade.getTrade_no().length() == 0) {
            trade.setTrade_no(genNumber.getno());
        }
        try (Connection conn = getConnection();) {
            return exceuteUpdate(conn, sql, new Object[]{trade.getTrade_no(), trade.getItem_amount(), trade.getItem_no(), trade.getUser_no(),trade.getItem_size(),trade.getItem_color()});
        }
    }

    public static List<Trade> findTradeUser(String name) throws Exception {
        String sql = "select * from trade where user_no=?";
        List<Trade> trade = new ArrayList<>();
        try (Connection conn = getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, name);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Trade trad = new Trade(rs.getString("trade_no"), rs.getString("item_amount"), rs.getString("item_no"), rs.getString("user_no"), rs.getString("item_size"), rs.getString("item_color"));
                    trade.add(trad);
                }
                return trade;
            }
        }
    }
}
