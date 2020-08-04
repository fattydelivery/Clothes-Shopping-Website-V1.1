/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analysis;

/**
 *
 * @author Legion
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import analysis.getAnalRes;

public class TestServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //定义一个list集合
        //HBase表名
        List<String> list = new ArrayList<>();
        String table = request.getParameter("table");
        if(table.equalsIgnoreCase("Person")) {
            list.add("person_outputclick");
            list.add("person_outputsale");
            list.add("person_outputbuy");
            list.add("person_outputcombiner");
        } else {
            list.add("intel_outputclick");
            list.add("intel_outputsale");
            list.add("intel_outputbuy");
            list.add("intel_outputcombiner");
        }
        
        List<Product> res = getAnalRes.exportList(list);
        for (int i = 0; i < res.size(); i++) {
            System.out.println(res.get(i).toString());
        }

        // 数据添加到集合里面，这里可以改为获取sql数据信息，然后转为json字符串，然后存到list中。
        //这里把“类别名称”和“销量”作为两个属性封装在一个Product类里，
        //每个Product类的对象都可以看作是一个类别（X轴坐标值）与销量（Y轴坐标值）的集合。
        ObjectMapper mapper = new ObjectMapper(); // 提供java-json相互转换功能的类

        String json = mapper.writeValueAsString(res); // 将list中的对象转换为Json字符串

        System.out.println(json);

        // 将json字符串数据返回给前端
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(json);
    }
}
