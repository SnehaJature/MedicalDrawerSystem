<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
    <%
     String drawerName = request.getParameter("drawerName");
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
     String sql = "insert into drawers(drawerName, drawerStatus)values(?, 'Deactivated')";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, drawerName);
     int done = ps.executeUpdate();
     if(done>0){
    %>
    <script>
     alert("Added Success!!");
     location.href="addDrawer.jsp";
    </script>
    <%}else{ %>
    <script>
     alert("Failed Try Again!!");
     location.href="addDrawer.jsp";
    </script>
    <%} %>
