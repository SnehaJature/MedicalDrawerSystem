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
					<div class="col-md-12">
					<h1 style="text-align: center;">Bill Details</h1><br><br>
					<input type="search" id="myInput" placeholder="Search Any Keyword" class="form-control">
					   <table class="table table-bordered">
					     <tr>
					       <th>Sr.No </th>
					       <th>Date </th>
					       <th>Total </th>
					       <th>View </th>
					     </tr>
					      <tbody id="myTable">
					     <tr>
					     <%
					     Class.forName("com.mysql.jdbc.Driver");
					     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
					     String sql = "select *from billTotal order by billTotalId desc";
					     PreparedStatement ps = con.prepareStatement(sql);
					     ResultSet rs = ps.executeQuery();
					     int i = 1;
					     while(rs.next()){
					     %>
					     <td><%=i %></td>
					     <td><%=rs.getString("billDate") %></td>
					     <td><%=rs.getString("finalTotal") %></td>
					     <td><a href="viewBillDetail.jsp?billTotalId=<%=rs.getString("billTotalId") %>&&date=<%=rs.getString("billdate") %>">View Detail</a></td>
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