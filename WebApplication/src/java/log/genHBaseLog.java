/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package log;

import dbc.HBUtil;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.hadoop.hbase.client.Put;
import test.TextHBase;

/**
 *
 * @author 72932
 */
public class genHBaseLog {
    public static void put(String key, String actid, String catid, String iteid, String timid, String useid) {
        try {
            HBUtil.init();
        } catch (IOException ex) {
            Logger.getLogger(TextHBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        String tableName = "Person_input";
        try {
            Put put = HBUtil.createPut(key);
//            System.out.println("get put object");
            HBUtil.addValueOnPut(put, "info_personInput", "useid", useid);     
            HBUtil.addValueOnPut(put, "info_personInput", "iteid", iteid);
            HBUtil.addValueOnPut(put, "info_personInput", "catid", catid);
            HBUtil.addValueOnPut(put, "info_personInput", "actid", actid);
            HBUtil.addValueOnPut(put, "info_personInput", "time", timid);
                   
//            System.out.println("???????????????????????????");
            HBUtil.put(tableName, put);
//            System.out.println("put successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
