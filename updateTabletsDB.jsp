<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>

<%
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
 String sql = "";
 PreparedStatement ps = null;
 int done = 0;
       String tabletId = request.getParameter("tabletId");
       String drawerId = request.getParameter("drawerId");
	   String tabletName = request.getParameter("tabletName");
	   String quantity = request.getParameter("quantity");
	   String price = request.getParameter("price");
	   String total = request.getParameter("total");
	   String expireDate = request.getParameter("expireDate");
	   sql = "update tablets set drawerId=?, tabletName=?, quantity=?, price=?, total=?, expireDate=? where tabletId=?";
	   ps = con.prepareStatement(sql);
	   ps.setString(1, drawerId);
	   ps.setString(2, tabletName);
	   ps.setString(3, quantity);
	   ps.setString(4, price);
	   ps.setString(5, total);
	   ps.setString(6, expireDate);
	   ps.setString(7, tabletId);
	   done = ps.executeUpdate();
   
 if(done>0){
	 
%>
<script>
     alert("Update Success!!");
     location.href="updateTablets.jsp?tabletId=<%=tabletId %>";
    </script>
<%}else{ %>
<script>
     alert("Failed Try Again!!");
     location.href="updateTablets.jsp?tabletId=<%=tabletId %>";
    </script>
<%} %>
