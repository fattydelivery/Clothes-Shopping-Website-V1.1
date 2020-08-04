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
public class FirstClothesClass {
    String first_no, first_id;

    @Override
    public String toString() {
        return "FirstClothesClass{" + "first_no=" + first_no + ", first_id=" + first_id + '}';
    }

    public FirstClothesClass(String first_id) {
        this.first_id = first_id;
    }

    public FirstClothesClass(String first_no, String first_id) {
        this.first_no = first_no;
        this.first_id = first_id;
    }

    public String getFirst_no() {
        return first_no;
    }

    public void setFirst_no(String first_no) {
        this.first_no = first_no;
    }

    public String getFirst_id() {
        return first_id;
    }

    public void setFirst_id(String first_id) {
        this.first_id = first_id;
    }
    
}
