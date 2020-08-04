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
public class Item {
    String item_no, item_id, item_price, item_pic, store_no, item_audienceno, item_typeno;

    @Override
    public String toString() {
        return "Item{" + "item_no=" + item_no + ", item_id=" + item_id + ", item_price=" + item_price + ", item_pic=" + item_pic + ", store_no=" + store_no + ", item_audienceno=" + item_audienceno + ", item_typeno=" + item_typeno + '}';
    }

    public Item(String item_no, String item_id, String item_price, String item_pic, String store_no, String item_audienceno, String item_typeno) {
        this.item_no = item_no;
        this.item_id = item_id;
        this.item_price = item_price;
        this.item_pic = item_pic;
        this.store_no = store_no;
        this.item_audienceno = item_audienceno;
        this.item_typeno = item_typeno;
    }

    public Item(String item_id, String item_price, String item_pic, String store_no, String item_audienceno, String item_typeno) {
        this.item_no = null;
        this.item_id = item_id;
        this.item_price = item_price;
        this.item_pic = item_pic;
        this.store_no = store_no;
        this.item_audienceno = item_audienceno;
        this.item_typeno = item_typeno;
    }
    

    public String getItem_no() {
        return item_no;
    }

    public void setItem_no(String item_no) {
        this.item_no = item_no;
    }

    public String getItem_id() {
        return item_id;
    }

    public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

    public String getItem_price() {
        return item_price;
    }

    public void setItem_price(String item_price) {
        this.item_price = item_price;
    }

    public String getItem_pic() {
        return item_pic;
    }

    public void setItem_pic(String item_pic) {
        this.item_pic = item_pic;
    }

    public String getStore_no() {
        return store_no;
    }

    public void setStore_no(String store_no) {
        this.store_no = store_no;
    }

    public String getItem_audienceno() {
        return item_audienceno;
    }

    public void setItem_audienceno(String item_audienceno) {
        this.item_audienceno = item_audienceno;
    }

    public String getItem_typeno() {
        return item_typeno;
    }

    public void setItem_typeno(String item_typeno) {
        this.item_typeno = item_typeno;
    }

    
}
