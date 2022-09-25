<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="uft-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/yonex_select.css">
    <title>yonex select</title>
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
        <form action="../logout.jsp">
           <input type="submit" value="Logout" class="submit3"/>
        </form>
      
      <hr color="#df5334" size="3px">
      <h1>Yonex select</h1>
      <table>
        <tr>
            <th><a href="shelves/yonex_clothes.jsp"><img src="../pic/homepage/yonex_clothes.jpg" alt=""></a></th>
            <th><a href="shelves/yonex_pants.jsp"><img src="../pic/homepage/yonex_pants.jpg" alt=""></a></th>
            <th><a href="shelves/yonex_shoes.jsp"><img src="../pic/homepage/yonex_shoes.jpg" alt=""></a></th>
            <th><a href="shelves/yonex_others.jsp"><img src="../pic/homepage/yonex_others.jpg" alt=""></a></th>
        </tr>
        <tr>
            <td>CLOTHES</td>
            <td>PANTS</td>
            <td>SHOES</td>
            <td>OTHERS</td>
        </tr>
      </table>
      <form action="../home.jsp"> 
       <input type="submit" value="Back" class="submit1" />
      </form>
      <!--<a href="../home.jsp"><input type="submit" value="Back" class="submit1" /></a> -->
</body>
</html>
