/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package log;

import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import log.genHBaseLog;

/**
 *
 * @author Administrator
 */
public class genLog {

    /*  
    01-log_success 02-log_fail 03-register_success 04-sortpage 05-clothing 06-add_to_cart 07-buy_now 08-buy_fail 09-buy_success
    10-sopcart 11-bought 12-complaint 13-delivery 14-payment 15-receiving 16-refound 17-report 18-shops
     */
    public static void Log(String user_id, String ip_address, String action_id, String category_id1, String category_id2,
            String item_id, String seller_id) { // timestamp, user_id, ip_address, action_id, first_category_id, second_category_id, item_id, seller_id
        Logger log = Logger.getLogger(genLog.class.getName());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String time = df.format(new Date());// new Date()为获取当前系统时间
        SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
        String time2 = df2.format(new Date());// new Date()为获取当前系统时间
        genHBaseLog.put(time2, action_id, category_id1, item_id, time2, user_id);
        log.info(time + "," + user_id + "," + ip_address + "," + action_id + "," + category_id1 + "," + category_id2 + "," + item_id + "," + seller_id);
    }
}
//    public String getIpAddr(HttpServletRequest request) { 
//    String ip = request.getHeader("x-forwarded-for"); 
//    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
//        ip = request.getHeader("Proxy-Client-IP"); 
//    } 
//    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
//        ip = request.getHeader("WL-Proxy-Client-IP"); 
//    } 
//    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
//        ip = request.getRemoteAddr(); 
//    } 
//    return ip; 
//}

