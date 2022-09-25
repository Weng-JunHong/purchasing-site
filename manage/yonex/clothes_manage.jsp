<html>
 <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../../css/manage_current.css">
  <title>clothes manage</title>
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

    String sql= "SELECT * FROM yonex_clothes";  //讀取資料庫table:products_shoes資料
    ResultSet rs = st.executeQuery(sql);  //不可手動新增

%>

  <center><h1>Yonex clothes manage</h1><table>
    <tr>
	<th>商品編號</th>
	<th>商品名稱</th>
	<th>圖示</th>
	<th>進貨成本</th>
	<th>售價</th>
	<th>數量</th>	
    </tr>
<%
    while (rs.next() ){
      out.println("<tr><td>"+rs.getObject("p_id")+"</td>");        //商品編號
      out.println("<td>"+rs.getObject("p_name")+"</td>");          //商品名稱
      out.println("<td align=center>"+"<img src=../../pic/yonex/T/"+rs.getObject("p_id")+".jpg width=100></td>");//圖示
      out.println("<td>"+rs.getObject("cost")+"</td>");      //進貨成本
      out.println("<td>"+rs.getObject("price")+"</td>");//售價
      out.println("<td>"+rs.getObject("quantity")+"</td></tr>");  //數量
      
    }
    rs.close();
    st.close();
    con.close();
  }catch(Exception e){
    out.println("資料庫連結錯誤："+e.toString() );
  }  
      
 %> 
  <a href="../manage_homepage.html"><input type="submit" value="Back" class="submit1" /></a>
  </table></center>
 </body>
</html>
