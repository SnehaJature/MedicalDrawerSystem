<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
 <%@ page import="java.util.*" %>

<%
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
 String sql = "";
 PreparedStatement ps = null;
 int done = 0;
 ResultSet rs = null;
 ResultSet rs1 = null;
   int i =0;
   
   
   
   String date = (new java.util.Date()).toLocaleString();
   String finalTotal = request.getParameter("finalTotal");
   sql = "insert into billTotal(billDate, finalTotal)values(?, ?)";
   ps = con.prepareStatement(sql);
   ps.setString(1, date);
   ps.setString(2, finalTotal);
   done = ps.executeUpdate();
   if(done>0){
	   sql = "select billTotalId from billTotal order by billTotalId desc limit 1";
	   ps = con.prepareStatement(sql);
	   rs = ps.executeQuery();
	   if(rs.next()){
		   int count = Integer.parseInt(request.getParameter("count"));
		   for(i=1;i<=count;i++){
			   String tabletName = request.getParameter("tabletName"+i);
			   String quantity = request.getParameter("quantity"+i);
			   String price = request.getParameter("price"+i);
			   String total = request.getParameter("total"+i);
			   String expireDate = request.getParameter("expireDate"+i);
			   sql = "insert into bill(tabletName, qty, price, total, billTotalId)values(?,?,?,?,?)";
			   ps = con.prepareStatement(sql);
			   ps.setString(1, tabletName);
			   ps.setString(2, quantity);
			   ps.setString(3, price);
			   ps.setString(4, total);
			   ps.setString(5, rs.getString("billTotalId"));
			   done = ps.executeUpdate();
			   if(done>0){
					   sql = "select quantity, tabletId from tablets where tabletName=?";
					   ps = con.prepareStatement(sql);
					   ps.setString(1, tabletName);
					   rs1 = ps.executeQuery();
					   if(rs1.next()){
						   int qty = Integer.parseInt(rs1.getString("quantity")) - Integer.parseInt(quantity);
						   String tabletId = rs1.getString("tabletId");
						  
						   sql = "update tablets set quantity=? where tabletId=?";
						   ps = con.prepareStatement(sql);
						   ps.setInt(1, qty);
						   ps.setString(2, tabletId);
						   ps.executeUpdate();
					   }
			   }
			   
		   }
		   if(done>0){
				 
			   %>
			   <script>
			        alert("Added Success!!");
			        location.href="viewBillDetail.jsp?billTotalId=<%=rs.getString("billTotalId")%>&&date=<%=date%>";
			       </script>
			   <%}else{ %>
			   <script>
			        alert("Failed Try Again!!");
			        location.href="addBill.jsp";
			       </script>

	   <%}}
   }
   
   
 if(done>0){
	 
%>
<script>
     alert("Added Success!!");
     location.href="viewBillDetail.jsp?billTotalId=<%=rs.getString("billTotalId")%>&&date=<%=date%>";
    </script>
<%}else{ %>
<script>
     alert("Failed Try Again!!");
     location.href="addBill.jsp";
    </script>
<%} %>
