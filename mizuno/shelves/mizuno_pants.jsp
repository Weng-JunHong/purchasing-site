<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="uft-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/shelves_Table.css">
    <title>Mizuno pants</title>
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
        <form action="../../logout.jsp">
           <input type="submit" value="Logout" class="submit3"/>
        </form>
        <hr color="#df5334" size="3px">
        <form action="../mizuno_select.jsp">
           <input type="submit" value="Back" class="submit4" />
        </form>
        <%@ include file = "mizuno_shelves_pants.jsp" %>
      
      
</body>
       
</html>
