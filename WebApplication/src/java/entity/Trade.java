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
public class Trade {
    String trade_no, item_amount, item_no, user_no, item_size, item_color;

    @Override
    public String toString() {
        return "Trade{" + "trade_no=" + trade_no + ", item_amount=" + item_amount + ", item_no=" + item_no + ", user_no=" + user_no + ", item_size=" + item_size + ", item_color=" + item_color + '}';
    }

    public Trade(String trade_no, String item_amount, String item_no, String user_no, String item_size, String item_color) {
        this.trade_no = trade_no;
        this.item_amount = item_amount;
        this.item_no = item_no;
        this.user_no = user_no;
        this.item_size = item_size;
        this.item_color = item_color;
    }

    public Trade(String item_amount, String item_no, String user_no, String item_size, String item_color) {
        this.item_amount = item_amount;
        this.item_no = item_no;
        this.user_no = user_no;
        this.item_size = item_size;
        this.item_color = item_color;
    }

    
    
    public String getItem_size() {
        return item_size;
    }

    public void setItem_size(String item_size) {
        this.item_size = item_size;
    }

    public String getItem_color() {
        return item_color;
    }

    public void setItem_color(String item_color) {
        this.item_color = item_color;
    }
        
    
    
    public String getTrade_no() {
        return trade_no;
    }

    public void setTrade_no(String trade_no) {
        this.trade_no = trade_no;
    }

    public String getItem_amount() {
        return item_amount;
    }

    public void setItem_amount(String item_amount) {
        this.item_amount = item_amount;
    }

    public String getItem_no() {
        return item_no;
    }

    public void setItem_no(String item_no) {
        this.item_no = item_no;
    }

    public String getUser_no() {
        return user_no;
    }

    public void setUser_no(String user_no) {
        this.user_no = user_no;
    }
}
