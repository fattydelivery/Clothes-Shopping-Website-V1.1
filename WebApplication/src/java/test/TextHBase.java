/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dbc.HBUtil;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.util.Bytes;
import org.junit.Test;
/**
 *
 * @author 72932
 */
public class TextHBase {

    public static void put() {
        try {
            HBUtil.init();
        } catch (IOException ex) {
            Logger.getLogger(TextHBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        String tableName = "b3b4.log";
        try {
            Put put = HBUtil.createPut("key1005");
            System.out.println("get put object");
            HBUtil.addValueOnPut(put, "cf1", "actid", "1");
            HBUtil.addValueOnPut(put, "cf1", "catid", "1");
            HBUtil.addValueOnPut(put, "cf1", "iteid", "518958");
            HBUtil.addValueOnPut(put, "cf1", "timid", "20150907");
            HBUtil.addValueOnPut(put, "cf1", "useid", "1032167");            
            System.out.println("???????????????????????????");
            HBUtil.put(tableName, put);
            System.out.println("put successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {
//        System.getProperty("hadoop.home.dir")
        put();
        System.out.println("ok");
            
    }
}
