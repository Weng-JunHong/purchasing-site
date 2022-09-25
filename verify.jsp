<html>
<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>

<%! // MySQL 8.0 以上版本 - JDBC 驅動名及資料庫 URL
       static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
       static final String DB_URL = "jdbc:mysql://localhost:3306/webdata?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
 
 
    // 資料庫的使用者名稱與密碼，需要根據自己的設定
       static final String USER = "root";
       static final String PASS = "oic17627";

     %>

<%
  String id = request.getParameter("user_id");
  String pwd=request.getParameter("password");
  String remain= request.getParameter("keep");
  Connection con=null;
  try{
      Class.forName(JDBC_DRIVER); 
      con= DriverManager.getConnection(DB_URL,USER,PASS);
  }catch(Exception e){
    out.println("無法連結資料庫");
  }

  String sql = "select * from user_members where user_id=?";

  PreparedStatement pst = con.prepareStatement(sql);
  pst.setString(1,id);
  
  ResultSet rs= pst.executeQuery();
  if ( rs.next() ){	 //將指標移到第一筆紀錄，實際也應該只有一筆紀錄
    String realPwd=rs.getString("password");  //取出資料錄的密碼欄位內容
    if (realPwd != pwd ){
      
      //帳號與密碼正確 
      session.setAttribute("ID",id);
      
      //設定Cookie
      if ( remain == null ){   
        Cookie ck = new Cookie("ACCOUNT", id);
        ck.setMaxAge(99999); //設一個大數，儲存久久
        response.addCookie(ck);
      }
      //導向首頁
      response.sendRedirect("home.jsp");
    }
  }
%>
<head>
  <meta http-equiv="Content-Type" content="text/html"; charset="uft-8"/>
  <meta http-equiv="refresh" content="3; url=login.jsp">
</head>
<body>
  <h1 align=center><font face=微軟正黑體>帳號或密碼錯誤!!</font></h1>
  <h1 align=center><font face=微軟正黑體>請重新登入</font></h1>
</body>
</html>