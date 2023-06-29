<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

     <%@page import="java.sql.*" %>
    
    <%
     String tabletId = request.getParameter("tabletId");
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
     String sql = "delete from tablets where tabletId=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, tabletId);
     int done = ps.executeUpdate();
     if(done>0){
    %>
    <script>
     alert("Deleted Success!!");
     location.href="viewTablets.jsp";
    </script>
    <%}else{ %>
    <script>
     alert("Failed Try Again!!");
     location.href="viewTablets.jsp";
    </script>
    <%} %>
    