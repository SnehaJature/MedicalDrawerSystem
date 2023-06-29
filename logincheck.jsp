<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<%
 Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
 String sql = "select *from admin where email=? and password=?";
 PreparedStatement ps = con.prepareStatement(sql);
 ps.setString(1, request.getParameter("email"));
 ps.setString(2, request.getParameter("password"));
 ResultSet rs = ps.executeQuery();
 if(rs.next()){
	 session.setAttribute("adminId", rs.getString("adminId"));
	 session.setAttribute("adminEmail", rs.getString("email"));
	 response.sendRedirect("index.jsp");
 }else{
%>
 <script>
   alert("Email or Password are Wrong!!");
   location.href="login.jsp";
 </script>
<%} %>

