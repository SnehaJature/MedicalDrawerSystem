<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<%
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
 String sql = "";
 PreparedStatement ps = null;
 int done = 0;
 
   int i =0;
   int count = Integer.parseInt(request.getParameter("count"));
   
   for(i=1;i<=count;i++){
	   String drawerId = request.getParameter("drawerId");
	   String tabletName = request.getParameter("tabletName"+i);
	   String quantity = request.getParameter("quantity"+i);
	   String price = request.getParameter("price"+i);
	   String total = request.getParameter("total"+i);
	   String expireDate = request.getParameter("expireDate"+i);
	   sql = "insert into tablets(drawerId, tabletName, quantity, price, total, expireDate)values(?,?,?,?,?,?)";
	   ps = con.prepareStatement(sql);
	   ps.setString(1, drawerId);
	   ps.setString(2, tabletName);
	   ps.setString(3, quantity);
	   ps.setString(4, price);
	   ps.setString(5, total);
	   ps.setString(6, expireDate);
	   done = ps.executeUpdate();
   }
 if(done>0){
	 
%>
<script>
     alert("Added Success!!");
     location.href="addTablets.jsp";
    </script>
<%}else{ %>
<script>
     alert("Failed Try Again!!");
     location.href="addTablets.jsp";
    </script>
<%} %>
