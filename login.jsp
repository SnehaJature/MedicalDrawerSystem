<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <jsp:include page="link.jsp"></jsp:include>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
			<br><br>
			<h1 style="text-align: center;" class="text-danger"> Medical Drawer System </h1><br>
			
			<h3 style="text-align: center;"> Admin Login</h3><br>
			
			     <form action="logincheck.jsp" method="post">
			     
			     <div class="form-group">
			        <input type='email' name='email' id='email' placeholder="Enter Email" class="form-control" required>
			     </div> 
			     
			     <div class="form-group">
			        <input type='password' name='password' id='password' placeholder="Enter Password" class="form-control" required>
			     </div> 
			     
			     <input type="submit" value="login" class="brn btn-info">
			       
			     </form>
			</div>
		</div>
	</div>
</body>
</html>