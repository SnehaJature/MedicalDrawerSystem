<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    
    <%
     String drawerId = request.getParameter("drawerId");
     String type = request.getParameter("type");
    
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
     PreparedStatement ps = null; String sql = ""; int done = 0;
     
     if(type.equals("Deactivated")){
      sql = "update drawers set drawerStatus='Activated' where drawerId=?";
      ps = con.prepareStatement(sql);
     ps.setString(1, drawerId);
      done = ps.executeUpdate();
     }
     else{
    	 sql = "update drawers set drawerStatus='Deactivated' where drawerId=?";
          ps = con.prepareStatement(sql);
         ps.setString(1, drawerId);
          done = ps.executeUpdate();
     }
     if(done>0){
    %>
    <script>
     alert("Status Changed!!");
     location.href="addDrawer.jsp";
    </script>
    <%}else{ %>
    <script>
     alert("Failed Try Again!!");
     location.href="addDrawer.jsp";
    </script>
    <%} %>
    