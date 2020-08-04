/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dbc.DBUtil;
import entity.FirstClothesClass;
import entity.*;
import java.sql.*;
import log.*;
import impl.*;

import java.util.List;

public class TestMain {

    public static void main(String[] args) throws Exception {
        FirstClothesClass fcc = FirstClothesClassImpl.findByNo("1");
        System.out.println(fcc.toString());
//        Connection connection = DBUtil.getConnection();
        //genLog.Log("7888888", "192.168.0.1", "2333", "3", "2", "334", "666");
        //timestamp, user_id, ip_address, action_id, category_id, item_id, seller_id
//        List<FirstClothesClass> fcc = FirstClothesClassImpl.findAll();
//        System.out.println(fcc);
//        UserImpl.add(new User(""));
        //User us = new User("beiyu", "beiyu", "15666676912", "Haikou");
        //UserImpl.add(us);
        // public Item(String item_id, String item_price, String item_pic, String store_no, String item_audienceno, String item_typeno)
        //Item it = new Item("cloth", "3333", "/img/haha.jpg", "0001", "1", "1");
        //ItemImpl.add(it);
        // public Trade(String item_amount, String item_no, String user_no, String item_size, String item_color)
        //User us = UserImpl.findIdUser("beiyu");
        //System.out.println(us.getUser_passwd());

        //Item it = ItemImpl.findIdItem("cloth");
        /*
        Trade td = new Trade("3", it.getItem_no(), us.getUser_no(), "L", "red");
        TradeImpl.add(td);
        List<Trade> tl = TradeImpl.findTradeUser(us.getUser_no());
        for(Trade i: tl) {
            System.out.println(i.getTrade_no());
        }*/
    }
}
