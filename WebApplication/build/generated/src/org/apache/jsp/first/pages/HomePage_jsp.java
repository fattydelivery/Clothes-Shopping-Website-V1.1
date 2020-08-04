package org.apache.jsp.first.pages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entity.*;
import java.util.List;
import impl.*;

public final class HomePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"../cssFile/index.css\">\n");
      out.write("        <!--<script src=\"../jsFile/index.js\"></script>-->\n");
      out.write("    </head>\n");
      out.write("    <body class=\"HPbody\">\n");
      out.write("        <div class=\"HPback\">\n");
      out.write("            <div class=\"menu\">\n");
      out.write("                <ul class=\"menubar\">\n");
      out.write("                    <li><a href=\"Login.jsp\">login</a></li>\n");
      out.write("                    <li><a href=\"Register.jsp\">register</a></li>\n");
      out.write("                        ");

                            User u = (User) session.getAttribute("user");
                            if (u != null) {
                                out.println("<li><a href=\"Bought.jsp\">" + u.getUser_id() + " </a></li>");
                            } else {
                                out.println("<li><a href=\"Bought.jsp\">personal details</a></li>");
                            }
                            out.println("<li><a href=\"ShopCart.jsp\">shopping cart</a></li>");
                        
      out.write(" \n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"box\">\n");
      out.write("                <input type=\"text\" name=\"search\" placeholder=\"Please input the keyword\">\n");
      out.write("                <div class=\"search\">search</div>\n");
      out.write("            </div>\n");
      out.write("            <script language =javascript src=\"../jsFile/index.js\"></script>\n");
      out.write("            <img id=\"obj\" src =\"../image/1.jpg\" width=400 height=400 border =0 >\n");
      out.write("            <!--onclick=\"window.location.href='Clothing.jsp'\">-->\n");
      out.write("            <div style=\"width:500px;\">\n");
      out.write("                ");

                    List<FirstClothesClass> fcc = FirstClothesClassImpl.findAll();

                    out.println("<dl class=\"classify\">");
                    for (int i = 0; i < fcc.size(); i++) {
                        out.println("<dt>" + fcc.get(i).getFirst_id() + "</dt>");
                        List<SecondClothesClass> scc = SecondClothesClassImpl.findByFN(fcc.get(i).getFirst_no());
                        out.println("<dd>");
                        for (int j = 0; j < scc.size(); j++) {
                            out.println("<a href=\"SortPage.jsp?secondno=" + scc.get(j).getSecond_secondno() + "&firstno=" + scc.get(j).getSecond_firstno() + "\">" + scc.get(j).getSecond_secondid() + "</a>");
                        }
                        out.println("</dd>");
                    }
                    out.println("</dl>");
                
      out.write("\n");
      out.write("                <!--<dl class=\"classify\">-->\n");
      out.write("                ");
 // for(int i=0; i<4; i++){ 
      out.write("\n");
      out.write("                <!--<dt>Women's clothing collection</dt>-->\n");
      out.write("                <!--<dd>-->\n");
      out.write("                ");
 // for(int j=0; j<6; j++){ 
      out.write("\n");
      out.write("                <!--<a href=\"#\">down coat</a>-->\n");
      out.write("                ");
 // } 
      out.write("\n");
      out.write("                <!--            <a href=\"#\">jacket</a>\n");
      out.write("                            <a href=\"#\">knitwear</a>\n");
      out.write("                            <a href=\"#\">hoodie</a>\n");
      out.write("                            <a href=\"#\">blouse</a>\n");
      out.write("                        </dd>\n");
      out.write("                        <dd>\n");
      out.write("                            <a href=\"#\">T-shirt</a>\n");
      out.write("                            <a href=\"#\">business suit</a>\n");
      out.write("                            <a href=\"#\">dress</a>\n");
      out.write("                            <a href=\"#\">skirt</a>\n");
      out.write("                            <a href=\"#\">short sleeve</a>\n");
      out.write("                        </dd>\n");
      out.write("                        <dd>\n");
      out.write("                            <a href=\"#\">shorts</a>\n");
      out.write("                            <a href=\"#\">trousers</a>\n");
      out.write("                            <a href=\"#\">sportswear</a>\n");
      out.write("                            <a href=\"#\">pajamas</a>\n");
      out.write("                        </dd>\n");
      out.write("                        \n");
      out.write("                        <dt>Men's clothing collection</dt>\n");
      out.write("                        <dd>\n");
      out.write("                            <a href=\"#\">down coat</a>\n");
      out.write("                            <a href=\"#\">jacket</a>\n");
      out.write("                            <a href=\"#\">knitwear</a>\n");
      out.write("                            <a href=\"#\">hoodie</a>\n");
      out.write("                            <a href=\"#\">casual shirt</a>\n");
      out.write("                        </dd>\n");
      out.write("                        <dd>\n");
      out.write("                            <a href=\"#\">bussiness shirt</a>\n");
      out.write("                            <a href=\"#\">T-shirt</a>\n");
      out.write("                            <a href=\"#\">short sleeve</a>\n");
      out.write("                            <a href=\"#\">business suit</a>\n");
      out.write("                        </dd>\n");
      out.write("                        <dd>\n");
      out.write("                            <a href=\"#\">sportswear</a>\n");
      out.write("                            <a href=\"#\">shorts</a>\n");
      out.write("                            <a href=\"#\">trousers</a>\n");
      out.write("                            <a href=\"#\">pajamas</a>\n");
      out.write("                        </dd>\n");
      out.write("                        <dt>childrens's clothing collection(boys)</dt>\n");
      out.write("                        <dd>\n");
      out.write("                            <a href=\"#\">down coat</a>\n");
      out.write("                            <a href=\"#\">fleece</a>\n");
      out.write("                            <a href=\"#\">knitwear</a>\n");
      out.write("                            <a href=\"#\">blouse</a>\n");
      out.write("                            <a href=\"#\">T-shirt</a>\n");
      out.write("                        </dd>\n");
      out.write("                        <dd>\n");
      out.write("                            <a href=\"#\">short sleeve</a>\n");
      out.write("                            <a href=\"#\">suit</a>\n");
      out.write("                            <a href=\"#\">pants</a>\n");
      out.write("                            <a href=\"#\">Animated cartoon</a>\n");
      out.write("                        </dd>\n");
      out.write("                        <dt>childrens's clothing collection(girls)</dt>\n");
      out.write("                        <dd>\n");
      out.write("                            <a href=\"#\">down coat</a>\n");
      out.write("                            <a href=\"#\">fleece</a>\n");
      out.write("                            <a href=\"#\">knitwear</a>\n");
      out.write("                            <a href=\"#\">blouse</a>\n");
      out.write("                            <a href=\"#\">T-shirt</a>\n");
      out.write("                        </dd>\n");
      out.write("                        <dd>\n");
      out.write("                            <a href=\"#\">short sleeve</a>\n");
      out.write("                            <a href=\"#\">dress</a>\n");
      out.write("                            <a href=\"#\">pants</a>\n");
      out.write("                            <a href=\"#\">Animated cartoon</a>\n");
      out.write("                        </dd>-->\n");
      out.write("                ");
 // } 
      out.write("\n");
      out.write("                </dl>\n");
      out.write("                <dl class=\"toggery\">\n");
      out.write("                    <dt>Popular shops:</dt>\n");
      out.write("                    <dd>\n");
      out.write("                        <a href=#>1.Uniqlo's official flagship store</a>\n");
      out.write("                    </dd>\n");
      out.write("                    <dd>\n");
      out.write("                        <a href=#>2.ZARA official flagship store</a>\n");
      out.write("                    </dd>\n");
      out.write("                    <dd>\n");
      out.write("                        <a href=#>3.H&M official flagship store</a>\n");
      out.write("                    </dd>\n");
      out.write("                    <dd>\n");
      out.write("                        <a href=#>4.adidas official flagship store</a>\n");
      out.write("                    </dd>\n");
      out.write("                    <dd>\n");
      out.write("                        <a href=#>5.Yishion official flagship store</a>\n");
      out.write("                    </dd>\n");
      out.write("                    <dd>\n");
      out.write("                        <a href=#>6.NIKE official flagship store</a>\n");
      out.write("                    </dd>\n");
      out.write("                    <dd>\n");
      out.write("                        <a href=#>7.BOY LONDON official flagship store</a>\n");
      out.write("                    </dd>\n");
      out.write("                    <dd>\n");
      out.write("                        <a href=#>8.MLB official flagship store</a>\n");
      out.write("                    </dd>\n");
      out.write("                    <dd>\n");
      out.write("                        <a href=#>9.PUMA official flagship store</a>\n");
      out.write("                    </dd>\n");
      out.write("                </dl>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"links\">\n");
      out.write("                <a href=\"/shopping/intel_echart.jsp\">Anaslysis Result for Intel Log</a>\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                |\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                <a href=\"/shopping/person_echart.jsp\">Anaslysis Result for Person Log</a>\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                |\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                <a href=\"#\">about us</a>\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                |\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                <a href=\"#\"> contact us </a>\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                |\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                <a href=\"#\">merchants settled</a>\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                |\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                <a href=\"#\">join us</a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
