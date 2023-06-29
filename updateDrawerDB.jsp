<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
    <%
     String drawerName = request.getParameter("drawerName");
    String drawerId = request.getParameter("drawerId");
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
     String sql = "update drawers set drawerName=? where drawerId=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, drawerName);
     ps.setString(2, drawerId);
     int done = ps.executeUpdate();
     if(done>0){
    %>
    <script>
     alert("Updated Success!!");
     location.href="updateDrawer.jsp?drawerId=<%=drawerId %>";
    </script>
    <%}else{ %>
    <script>
     alert("Failed Try Again!!");
     location.href="updateDrawer.jsp?drawerId=<%=drawerId %>";
    </script>
    <%} %>
