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
				<div class="row">
					<div class="col-md-12 table-responsive">
					<br><br>
					
					<h1 style="text-align: center;">Tablets Details</h1><br><br>
					<input type="search" id="myInput" placeholder="Search Any Keyword" class="form-control">
					   <table class="table table-bordered">
					    <tr>
					     <th>Sr.No</th>
					     <th>DrawerName</th>
					     <th>TabletName</th>
					     <th>Quantity</th>
					     <th>Price</th>
					     <th>Total</th>
					     <th>expireDate</th>
					     <th>Update</th>
					     <th>Delete</th>
					    </tr>
					    <tbody id="myTable">
					    <tr>
					    <%
					      Class.forName("com.mysql.jdbc.Driver");
					      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
					      String sql = "select d.*, t.* from drawers as d inner join tablets as t on d.drawerId = t.drawerId";
					      PreparedStatement ps = con.prepareStatement(sql);
					      ResultSet rs = ps.executeQuery();
					      int i = 1;
					      while(rs.next()){
					    %>
					    <td><%=i %></td>
					    <td><%=rs.getString("drawerName") %> </td> 
					    <td><%=rs.getString("tabletName") %> </td> 
					    <td><%=rs.getString("quantity") %> </td> 
					    <td><%=rs.getString("price") %> </td> 
					    <td><%=rs.getString("total") %> </td> 
					    <td><%=rs.getString("expireDate") %> </td> 
					    <td><a href="updateTablets.jsp?tabletId=<%=rs.getString("tabletId")%>">Update </a></td>
					    <td><a href="deleteTablets.jsp?tabletId=<%=rs.getString("tabletId")%>" class="btn btn-danger btn-sm">Delete </a></td>
					    
					    
					    </tr>
					    
					    <%i++;} %>
					    </tbody>
					   </table>
					   
					</div>
					
				</div>
			</div>
			
			
		</div>
			</div>

<jsp:include page="footer.jsp"></jsp:include>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>