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
					   <form action="updateDrawerDB.jsp" method="post">
					    <%
					      Class.forName("com.mysql.jdbc.Driver");
					      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
					      String sql = "select *from drawers where drawerId=?";
					      PreparedStatement ps = con.prepareStatement(sql);
					      ps.setString(1, request.getParameter("drawerId"));
					      ResultSet rs = ps.executeQuery();
					      
					      while(rs.next()){
					        %>
					        
					         <input type="hidden" value="<%=rs.getString("drawerId") %>" id="drawerId" name="drawerId" class="form-control" required>
					      <div class="form-group">
					        <label for="drawerName">Drawer Name</label>
					        <input type="text" value="<%=rs.getString("drawerName") %>" id="drawerName" name="drawerName" class="form-control" placeholder="Enter Drawre Name" required>
					      </div>
					       
					       <div class="form-group">
					        <input type="submit" class="form-control btn btn-info">
					      </div>
					   <%} %>
					   </form>
					   
					</div>
				</div>
			</div>
			
			
		</div>
			</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>