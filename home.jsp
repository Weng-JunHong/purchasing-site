<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="uft-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/homecss.css">
    <title>home index</title>
</head>
  <%@ page contentType="text/html;charset=utf-8" %>
  <%
    String id = (String)session.getAttribute("ID");
    if ( id == null){
      //尚未登入，直接進入網頁頁面
      response.sendRedirect("login.jsp");}
    else{

      out.print("Hello! "+ id);
     }
  %>
<body> 
        <form action="logout.jsp">
           <input type="submit" value="Logout" class="submit3"/>
        </form>
      
      <hr color="#df5334" size="3px">
      
      <a href="yonex/yonex_select.jsp"><img src="pic/homepage/Yonexlogo.jpg" alt=""></br></a>
      <p>
      <a href="mizuno/mizuno_select.jsp"><img src="pic/homepage/Mizunologo2.jpg" alt=""></a>
      
      
 
</body>
</html>
