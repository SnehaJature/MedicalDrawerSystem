<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="slidebar.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
			
			<div class="container">
			<h1 style="text-align: center;">Update Tablet</h1><br><br>
				<div class="row">
					<div class="col-md-offset-4 col-md-6">
					  <form action="updateTabletsDB.jsp" method="post">
					    
					    <%
					      Class.forName("com.mysql.jdbc.Driver");
					      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
					      String sql1 = "select d.*, t.* from drawers as d inner join tablets as t on d.drawerId = t.drawerId where t.tabletId=?";
					      PreparedStatement ps1 = con.prepareStatement(sql1);
					      ps1.setString(1, request.getParameter("tabletId"));
					      ResultSet rs1 = ps1.executeQuery();
					      
					      while(rs1.next()){
					        %>
							<input type="hidden" value="<%=rs1.getString("tabletId")%>" id="tabletId" name="tabletId">
							
					    <div class="form-group">
								<label for="drawerId">&nbsp;&nbsp; Drawer Name</label> 
								<select id="drawerId" name="drawerId" class="form-control">
								<option value="<%=rs1.getString("drawerId")%>"><%=rs1.getString("drawerName")%></option>
								 <%
					       String sql = "select *from drawers order by drawerId desc";
					      PreparedStatement ps = con.prepareStatement(sql);
					      ResultSet rs = ps.executeQuery();
					      
					      while(rs.next()){
					        %>
							      <option value="<%=rs.getString("drawerId") %>"><%=rs.getString("DrawerName") %></option>
							      <%} %>
							    </select>
							</div>
							
							
								   <div class="form-group">
								   <label for="tabletName">Tablet Name</label> 
								     <input type="text" value="<%=rs1.getString("tabletName") %>" name="tabletName" id="tabletName" class="form-control" placeholder="Enter Tablet Name" required>
								   </div>								   
								
								
								
								   <div class="form-group">
								   <label for="quantity">Tablet Quantity</label> 
								    <input type="number" value="<%=rs1.getString("quantity") %>" name="quantity" id="quantity" class="form-control" placeholder="Enter Quantity" required>
								   </div>								   
								
								
								
								   <div class="form-group">
								   <label for="price">Price (One Tablet)</label>
								    <input type="number" value="<%=rs1.getString("price") %>" name="price" id="price" onkeyup="multiplication()" class="form-control" placeholder="Price (One Tablet)" required>
								   </div>								   
								
								
								
								   <div class="form-group">
								   <label for="total">Total</label>
								    <input type="number" value="<%=rs1.getString("total") %>" name="total" id="total" class="form-control" placeholder="total" readonly>
								   </div>								   
								
								
								
								   <div class="form-group">
								   <label for="expireDate">Expire Date</label>
								    <input type="date" value="<%=rs1.getString("expireDate") %>" name="expireDate" id="expireDate" class="form-control" placeholder="DD/MM/YYYY" required>
								   </div>								   
								
							<input type="submit" class="btn btn-info" value="Update Data">
						
						<%} %>
					  </form>
					</div>
				</div>
			</div>
			
			
		</div>
			</div>

<jsp:include page="footer.jsp"></jsp:include>
<script>
 function multiplication(){
		  var qty = $("#quantity").val();
		  var price = $("#price").val();
		  
		  var total = Number(price) * Number(qty);
		  
		  $("#total").val(total);
	   }
 </script>
</body>
</html>