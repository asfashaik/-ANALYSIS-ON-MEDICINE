
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

   
    String uname=request.getParameter("uname");
    String pwd=request.getParameter("pass");
    
    ResultSet rs=Queries.getExecuteQuery("select * from user where username='"+uname+"'");
    if(rs.next()){
    String query="update user set password='"+pwd+"' where username='"+uname+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){    
%>
      <script type='text/javascript'>
          window.alert("Password Changed Successful...!!");
          window.location="user.jsp";
      </script>
      <%

    }else{
    
%>
      <script type='text/javascript'>
          window.alert("Password Change Failed..!!");
          window.location="user.jsp";
      </script>
      <%
}
}else{
%>
      <script type='text/javascript'>
          window.alert("UserName Doesn't Exist..!!");
          window.location="user.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>