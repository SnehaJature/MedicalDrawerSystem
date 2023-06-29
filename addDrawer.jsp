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
					<div class="col-md-offset-4 col-md-6">
					<br><br>
					 <h1 style="text-align: center;">Add Drawers</h1>
					   <form action="addDrawerDB.jsp" method="post">
					      <div class="form-group">
					        <label for="drawerName">Drawer Name</label>
					        <input type="text" id="drawerName" name="drawerName" class="form-control" placeholder="Enter Drawre Name" required>
					        <span id="text"></span>
					      </div>
					       
					       <div class="form-group">
					        <input type="submit" class="form-control btn btn-info">
					      </div>
					   
					   </form>
					   
					</div>
				</div>
			</div>
			
			<div class="container">
				<div class="row">
					<div class="col-md-offset-2 col-md-10 table-responsive">
					<br><br>
					   <table class="table table-bordered">
					    <tr>
					     <th>Sr.No</th>
					     <th>Name</th>
					     <th>Update</th>
					     <th>Action</th>
					    </tr>
					    <tr>
					    <%
					      Class.forName("com.mysql.jdbc.Driver");
					      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
					      String sql = "select *from drawers order by drawerId desc";
					      PreparedStatement ps = con.prepareStatement(sql);
					      ResultSet rs = ps.executeQuery();
					      int i = 1;
					      while(rs.next()){
					    %>
					    <td><%=i %></td>
					    <td><%=rs.getString("drawerName") %> </td> 
					    <td><a href="updateDrawer.jsp?drawerId=<%=rs.getString("drawerId") %>">Update </a></td>
					    
					    <td>
					    <%if(rs.getString("drawerStatus").equals("Deactivated")){ %>
					    <a href="updateDrawerStatusDB.jsp?drawerId=<%=rs.getString("drawerId") %>&&type=<%=rs.getString("drawerStatus") %>" class="btn btn-danger btn-sm"><%=rs.getString("drawerStatus") %> </a>
					    <%}else{ %>
					         <a href="updateDrawerStatusDB.jsp?drawerId=<%=rs.getString("drawerId") %>&&type=<%=rs.getString("drawerStatus") %>" class="btn btn-info btn-sm"><%=rs.getString("drawerStatus") %> </a>
					    <%} %>
					    </td>
					    
					    </tr>
					    
					    <%i++;} %>
					   </table>
					   
					</div>
				</div>
			</div>


		</div>
			</div>

<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">
   $("#drawerName").on("keyup",function(){
	   var drawerName = $(this).val();
	   $.ajax({
		  url : 'fetchDrawerDB.jsp?drawerName='+drawerName, 
		  method : 'post',
		  success : function(response){
			  if(response.trim()=="1"){
				  $("#text").html("Already in list").css({"color" : "red"});
				  $("input[type=submit]").attr("disabled","disabled");
			  }else{
				  $("#text").empty();
				  $("input[type=submit]").removeAttr("disabled");
			  }
			     
		  }
	   });
   })
</script>
</body>
</html>