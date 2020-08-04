/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package log;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author Administrator
 */
public class genNumber {
    public static String getno() {
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
        String time = df.format(new Date());// new Date()为获取当前系统时间
        Random random = new Random();//默认构造方法
        int rand = random.nextInt(9000) + 1000;
        return time + rand;
    }
}
