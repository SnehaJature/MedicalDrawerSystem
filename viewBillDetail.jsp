<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="link.jsp"></jsp:include>
	<style type="text/css">
	   @media print{
	     body{
	        visibility : hidden;
	     }
	     .data{
	        visibility : visible;
	     }
	     #print{
	        visibility : hidden;
	     }
	   }
	</style>
</head>
<body>
<jsp:include page="slidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
			
			<div class="container">
				<div class="row">
					<div class="col-md-12 data">
					<h1 class="text-center">Medical Drawer</h1>
					<hr style="border:2px solid;">
					   <table class="table table-bordered">
					   <b><%=request.getParameter("date") %></b>
					     <tr>
					       <th>Sr.No </th>
					       <th>TabletName </th>
					       <th>Qty </th>
					       <th>qty Price </th>
					       <th>Total </th>
					     </tr>
					     <tr>
					     <%
					     Class.forName("com.mysql.jdbc.Driver");
					     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
					     String sql = "select bt.*, b.* from billTotal as bt inner join bill as b on bt.billTotalId=b.billTotalId where bt.billTotalId=?";
					     PreparedStatement ps = con.prepareStatement(sql);
					     ps.setString(1, request.getParameter("billTotalId"));
					     ResultSet rs = ps.executeQuery();
					     int i = 1;
					     String finalTotal="";
					     while(rs.next()){
					    	 finalTotal = rs.getString("finalTotal");
					     %>
					     <td><%=i %></td>
					     <td><%=rs.getString("tabletName") %></td>
					     <td><%=rs.getString("qty") %></td>
					     <td><%=rs.getString("price") %></td>
					      <td><%=rs.getString("total") %></td>
					     </tr>
					     <%i++;} %>
					     <tr>
					      <td></td><td></td><td></td>
					      <td class="text-danger">FinalTotal</td>
					      <td class="text-danger"><%=finalTotal %></td>
					     </tr>
					   </table>
					   
					   <button class="btn btn-info" style="float: right;" id="print" onclick="window.print()">Print</button>
					</div>
				</div>
			</div>
			
			
		</div>
			</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>