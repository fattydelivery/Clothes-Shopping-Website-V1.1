/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package log;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Administrator
 */
public class genIp {
    
       public String getIpAddr(HttpServletRequest request){
           String ip = request.getHeader("x-forwarded-for");
            if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                  ip = request.getHeader("Proxy-Client-IP");
            }
           if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                       ip = request.getHeader("WL-Proxy-Client-IP");
           }
          if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                 ip = request.getRemoteAddr();
           }
               return ip;
       }
       
}
