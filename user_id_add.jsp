<html>
  <head>
     <meta http-equiv="refresh" content="3; url=purcharing_homepage.html">
     <%@ page contentType="text/html;charset=utf-8" 
              import="java.sql.*, java.text.SimpleDateFormat" %>

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
      String name = request.getParameter("name");
      String phone = request.getParameter("cellphone");
      String email = request.getParameter("email");       
      String id = request.getParameter("user_id");
      String pwd=request.getParameter("password");
      String addr = request.getParameter("address");

      try{
          Class.forName(JDBC_DRIVER); 
          Connection con= DriverManager.getConnection(DB_URL,USER,PASS);
       
          PreparedStatement pst = con.prepareStatement("INSERT INTO user_members VALUES (?,?,?,?,?,?)");             
        
          pst.setString(1, name);
          pst.setString(2, phone);
          pst.setString(3, email);
          pst.setString(4, id);
          pst.setString(5, pwd);
          pst.setString(6, addr);

        //執行
        if (pst.executeUpdate()==1)
           out.print("<h1 align=center><font face=微軟正黑體>"+"資料新增完畢!!"+"</font></h1>");
	   out.print("<h1 align=center><font face=微軟正黑體>"+"3秒後回首頁 請重新登入!!"+"</font></h1>");
       
        //清除資料
           pst.close();
           con.close();
      }catch(Exception e){
           out.println(e.toString() );
      }
  %>
  </body>
</html>
