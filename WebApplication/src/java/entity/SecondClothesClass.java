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
public class SecondClothesClass {
    String second_secondno, second_firstno,second_secondid;

    @Override
    public String toString() {
        return "SecondClothesClass{" + "second_secondno=" + second_secondno + ", second_firstno=" + second_firstno + ", second_secondid=" + second_secondid + '}';
    }

    public SecondClothesClass(String second_secondno, String second_firstno, String second_secondid) {
        this.second_secondno = second_secondno;
        this.second_firstno = second_firstno;
        this.second_secondid = second_secondid;
    }

    public String getSecond_secondno() {
        return second_secondno;
    }

    public void setSecond_secondno(String second_secondno) {
        this.second_secondno = second_secondno;
    }

    public String getSecond_firstno() {
        return second_firstno;
    }

    public void setSecond_firstno(String second_firstno) {
        this.second_firstno = second_firstno;
    }

    public String getSecond_secondid() {
        return second_secondid;
    }

    public void setSecond_secondid(String second_secondid) {
        this.second_secondid = second_secondid;
    }
    
}
