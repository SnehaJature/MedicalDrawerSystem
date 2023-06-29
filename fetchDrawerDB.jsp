<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<%
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicaldrawer","root","root");
   String sql = "select drawerName from drawers where drawerName=?";
   PreparedStatement ps = con.prepareStatement(sql);
   ps.setString(1, request.getParameter("drawerName"));
   ResultSet rs = ps.executeQuery();
   if(rs.next()){
	   out.print("1"); // Success
   }else{
	   out.print("0"); // Fail
   }
%>