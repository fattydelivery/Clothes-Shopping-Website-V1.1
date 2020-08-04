/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analysis;

/**
 *
 * @author 72932
 */


import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.client.Result;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.exceptions.HBaseException;
import org.apache.hadoop.hbase.filter.PageFilter;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.log4j.BasicConfigurator;
import dbc.HBUtil;

public class getAnalRes {

//    private static final String ZK_QUORUM = "hbase.zookeeper.quorum";
//    private static final String ZK_CLIENT_PORT = "hbase.zookeeper.property.clientPort";
//    private static final String HBASE_POS = "192.168.119.101";
//    private static final String ZK_POS = "hadoop001:2181,hadoop01:2182,hadoop001:2183";
//    private static final String ZK_PORT_VALUE = "2181";
    private static final int count = 5;//取多少条记录

        
    public static List<Result> getRecords(String name) throws IOException{
        HBUtil.init();
        List<Result> res = new ArrayList<>();
        Table hTable = HBUtil.getTable(name);
        Scan scan = new Scan();
//        Scan scan = new Scan("1".getBytes(), "4".getBytes());   //从1到4
        scan.setCacheBlocks(true);
        scan.setCaching(1000);
        try(ResultScanner scanner = hTable.getScanner(scan)){
            for(Result r: scanner){
                res.add(r);
            }
        }
        return res;
    }
    
    public static List<Product> exportList(List<String> list) throws IOException{
        List<Product> res = new ArrayList<Product>();
        for(int k=0; k<list.size(); k++){
            String tableName = list.get(k);
            //取数据
            List<Result> ress = getRecords(tableName);

            if(ress.isEmpty()){
                System.out.println(tableName+" has no data");
                continue;
            }
            System.out.println("---------------------------------------------");
            for(int i=0; i<5; i++){
                Result r = ress.get(i);
                String rowkey = new String(r.getRow());
                List<Cell> cellList = r.listCells();
                for(int j=0; j<cellList.size(); j++) {
                    System.out.println(new String(cellList.get(j).getValue()));
                }
                String name = new String(cellList.get(0).getValue());
                float num = new Float(new String(cellList.get(1).getValue()));
                res.add(new Product(name, num));
            }
        }
        return res;
    }
    
    public static void main(String args[]) throws Exception {
        //HBase表名
        List<String> list = new ArrayList<>();
        
        list.add("b3b4.taobao");
        list.add("b3b4.log");
        List<Product> res = exportList(list);
        for(int i=0; i<res.size(); i++) {
            System.out.println(res.get(i).toString());
        }
//        cth.exportExcel(list);
        

    }

}
