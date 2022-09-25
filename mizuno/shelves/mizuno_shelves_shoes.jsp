<html>
 <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../../css/shelves_Table.css">
  <title>mizuno_shelves_shoes</title>
  <%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
  
  <%! // MySQL 8.0 以上版本 - JDBC 驅動名及資料庫 URL
       static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
       static final String DB_URL = "jdbc:mysql://localhost:3306/webdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
 
 
    // 資料庫的使用者名稱與密碼，需要根據自己的設定
       static final String USER = "root";
       static final String PASS = "oic17627";

 %>
</head>
 <body>
<%
  try{
  Class.forName(JDBC_DRIVER); 
  Connection con= DriverManager.getConnection(DB_URL,USER,PASS);

  Statement st = con.createStatement();

  String sql= "SELECT * FROM mizuno_shoes";
  ResultSet rs = st.executeQuery(sql);
    
%>

 <form action="order.jsp">
  <center><h1>Mizuno shoes</h1>
   
   <table>
    <tr>
      <th>勾選&nbsp;訂購</th>
      <th>商品名稱</th>
      <th>圖&nbsp;&nbsp;示</th>
      <th>售&nbsp;&nbsp;&nbsp;價</th>
    </tr>
      <!--<th>訂購數量</th> -->
 <%
         
    while (rs.next() ){
      out.println("<tr><td><input type=checkbox name=p_id value="+rs.getObject("p_id")+"</td>");   //商品編號
      out.println("<td>"+rs.getObject("p_name")+"</td>");                                         //商品名稱
      out.println("<td>"+"<img src=../../pic/mizuno/S/"+rs.getObject("p_id")+".jpg></td>");          //圖示
      out.println("<td> NT$ "+rs.getObject("price")+"</td></tr>");                                //售價
      
    }
    
    /*String[] data = request.getParameterValues("id");

    Boolean f = new Boolean(true);

    session.setAttribute("ID", data);
    session.setAttribute("FLAG", f);
     
       id = request.getParameter("pid");
       String pname = request.getParameter("pname");
       String unit_price = request.getParameter("unit_price");
     //  String quantity = request.getParameter("quantity");
       */
    rs.close();
    st.close();
    con.close();
  }catch(Exception e){
    out.println("資料庫連結錯誤："+e.toString() );
  }  
    
 %> 
   
    <input type="submit" value="Order" class="submit1" /><br/>
    <input type="reset" value="Reset" class="submit2" />
    
  </table>
 </center>
 </form>
 <a href="../yonex_select.jsp"><input type="submit" value="Back" class="submit4" /></a>
<!--<form action="../mizuno_select.jsp"> 
       <input type="submit" value="Back" class="submit4" />
 </form>-->
 </body>
</html>
