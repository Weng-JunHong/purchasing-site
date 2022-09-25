<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <title>login</title>
</head>

  <%@ page contentType="text/html;charset=utf-8" %>
  <%
    //先判斷Cookie是否已有登入的使用者紀錄
    Cookie[] cks = request.getCookies();
    if (cks !=null){
      boolean flagCookie=false;  //true表示有登入帳號
      for (int i=0; i<cks.length; i++){
        if (cks[i].getName().equals("ACCOUNT")){
          flagCookie=true;
          session.setAttribute("ID",cks[i].getValue() );
          break;
        }
      }

      if ( flagCookie ) 
        //已經有登入紀錄，直接導向至首頁
        response.sendRedirect("home.jsp");
    }
  %>
<body>
    <div class="container1">       
        <h3>登 入 帳 戶</h3>
            <form action="verify.jsp" method="post">
                <input type="text" id="username" name="user_id" placeholder="帳號" required="required" /><br/>
                <input type="password" id="password" name="password" placeholder="密碼" required="required" /><br/>
		<input type="checkbox" name="keep" value="YES" />記住我<br/>
                <input type="submit" value="登 入" class="submit">
            </form>  
        <a href="register.html"><h5>創建帳戶</h5></a>   
    </div>
</body>

</html>
