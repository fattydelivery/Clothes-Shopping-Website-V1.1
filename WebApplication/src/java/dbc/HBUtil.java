/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

/**
 * Hbase 操作工具类
 *
 * @author jayce
 * @version 1.0.0
 * @createDate 2020-06-22
 *
 */
public class HBUtil {

    private static Connection connection = null;
    private static Configuration conf = null; //HBase 配置信息
    // ===============Common=====================================

    /**
     * 根据表名获取Table对象
     *
     * @param name 表名，必要时可指定命名空间，比如：“default:user”
     * @return Hbase Table 对象
     * @throws IOException 有异常抛出，由调用者捕获处理
     */
    public static void init() throws IOException {
        System.out.println("initing");
        conf = HBaseConfiguration.create();
        conf.set("hbase.rootdir", "hdfs://192.168.233.128:9000/hbase");
        conf.set("hbase.zookeeper.quorum", "192.168.233.128:2181");
        connection = ConnectionFactory.createConnection(conf);
        System.out.println("initsuccess");
    }
    public static Table getTable(String name) throws IOException {
        TableName tableName = TableName.valueOf(name);
        return connection.getTable(tableName);
    }

    // =============== Put =====================================
    /**
     * 根据rowKey生成一个Put对象
     *
     * @param rowKey rowKey
     * @return Put对象
     */
    public static Put createPut(String rowKey) {
        return new Put(Bytes.toBytes(rowKey));
    }

    /**
     * 在Put对象上增加Cell
     *
     * @param put Put对象
     * @param cell cell对象
     * @throws IOException 有异常抛出，由调用者捕获处理
     */
    public static void addCellOnPut(Put put, Cell cell) throws IOException {
        put.add(cell);
    }

    /**
     * 在Put对象上增加值
     *
     * @param put Put对象
     * @param family 列簇
     * @param qualifier 列
     * @param value 字符串类型的值
     */
    public static void addValueOnPut(Put put, String family, String qualifier, String value) {
        addValueOnPut(put, family, qualifier, Bytes.toBytes(value));
    }

    /**
     * 在Put对象上增加值
     *
     * @param put Put对象
     * @param family 列簇
     * @param qualifier 列
     * @param value 字节数组类型的值，可以是任意对象序列化而成
     */
    public static void addValueOnPut(Put put, String family, String qualifier, byte[] value) {
        put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), value);
    }

    /**
     * 在Put对象上增加值
     *
     * @param put Put对象
     * @param family 列簇
     * @param qualifier 列
     * @param ts Timestamp时间戳
     * @param value 字符串类型的值
     */
    public static void addValueOnPut(Put put, String family, String qualifier, long ts, String value) {
        addValueOnPut(put, family, qualifier, ts, Bytes.toBytes(value));
    }

    /**
     * 在Put对象上增加值
     *
     * @param put Put对象
     * @param family 列簇
     * @param qualifier 列
     * @param ts Timestamp时间戳
     * @param value 字节数组类型的值，可以是任意对象序列化而成
     */
    public static void addValueOnPut(Put put, String family, String qualifier, long ts, byte[] value) {
        put.addColumn(Bytes.toBytes(family), Bytes.toBytes(qualifier), ts, value);
    }

    /**
     * 按表名插入一个Put对象包含的数据
     *
     * @param tableName 表名，必要时可指定命名空间，比如：“default:user”
     * @param put 要插入的数据对象
     * @throws IOException 有异常抛出，由调用者捕获处理
     */
    public static void put(String tableName, Put put) throws IOException {
        try (
                Table table = getTable(tableName);) {

            table.put(put);
        }
    }

    /**
     * 按表名批量插入Put对象包含的数据
     *
     * @param tableName 表名，必要时可指定命名空间，比如：“default:user”
     * @param puts 要插入的数据对象集合
     * @throws IOException 有异常抛出，由调用者捕获处理
     */
    public static void put(String tableName, List<Put> puts) throws IOException {
        try (
                Table table = getTable(tableName);) {

            table.put(puts);
        }
    }

    // =============== Get =====================================
}
