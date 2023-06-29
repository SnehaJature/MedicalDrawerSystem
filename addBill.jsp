<%@page import="com.sun.org.apache.bcel.internal.generic.GETSTATIC"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="link.jsp"></jsp:include>
<link href=
'https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'
          rel='stylesheet'>
      
    <script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" >
    </script>
      
    <script src=
"https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" >
    </script>
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
					
					   <br><br>
					   <h1 style="text-align: center;">Add Bill</h1>
						<form action="addBillDB.jsp" method="post">
							
							<button type="button" id="addRow" class="btn btn-info" style="float:right;">Add Row</button>
							<div class="row">
							 <br><br>
								<div class="col-md-3">
								   <div class="form-group">
								   <label for="tabletName">Tablet Name</label> 
								     <input type="search" list="searching" name="tabletName1" id="tabletName1" onkeyup="checkTabletQuantity(1)" class="form-control" placeholder="Enter Tablet Name" required>
								   <datalist id="searching">
								   <%
								   Class.forName("com.mysql.jdbc.Driver");
								   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalDrawer", "root", "root");
								   String sql = "select *from tablets order by tabletId desc";
								   PreparedStatement ps = con.prepareStatement(sql);
								   ResultSet rs = ps.executeQuery();
								   while(rs.next()){
								   %>
								      <option id="" value="<%=rs.getString("tabletName") %>">
								      <%} %>
								   </datalist>
								  <span id="tabletNameText1"></span>
								   </div>								   
								</div>
								
								<div class="col-md-2">
								   <div class="form-group">
								   <label for="quantity">Tablet Quantity</label> 
								    <input type="text" name="quantity1" id="quantity1" onkeyup="multiplication(1); finalTotall();" class="form-control" placeholder="Enter Quantity" required>
								     <span id="quantityText1"></span>
								   </div>								   
								</div>
								
								<div class="col-md-2">
								   <div class="form-group">
								   <label for="price">Price (One Tablet)</label>
								    <input type="text" name="price1" id="price1" onkeyup="multiplication(1); finalTotall();"  class="form-control" placeholder="Price (One Tablet)" required>
								   </div>								    
								</div>
								
								<div class="col-md-2">
								   <div class="form-group">
								   <label for="total">Total</label>
								    <input type="number" name="total1" id="total1" class="form-control total" placeholder="total" readonly>
								   </div>								   
								</div>
								
								
							 
							</div>
							
							<div class="row displayRow">
							  
							</div>
							<div class="row">
							<div class="col-md-4">
							<input type="number" id="finalTotal" name="finalTotal" class="form-control" placeholder="Final Total" readonly> <br>
                             </div>
                             </div>
                             <input type="hidden" name="count" id="count" value="1">
                             <input type="submit" value="Submit Details" class="btn btn-info" onclick="validate()">
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	  
	   $(document).ready(function(){
		   var a = 1;
		 $("#addRow").click(function(){
			 a++;
			 
			var text = `
			
				<div class="col-md-3 `+a+`">
				   <div class="form-group">
				   <label for="tabletName">Tablet Name</label> 
				     <input type="search" list="searching" name="tabletName`+a+`" id="tabletName`+a+`" onkeyup="checkTabletQuantity(`+a+`)" class="form-control" placeholder="Enter Tablet Name" required>
				     <span id="tabletNameText`+a+`"></span>
				     </div>								   
				</div>
				
				<div class="col-md-2 `+a+`">
				   <div class="form-group">
				   <label for="quantity">Tablet Quantity</label> 
				    <input type="text" name="quantity`+a+`" id="quantity`+a+`" onkeyup="multiplication(`+a+`); finalTotall();" class="form-control" placeholder="Enter Quantity" required>
				    <span id="quantityText`+a+`"></span>
				    </div>								   
				</div>
				
				<div class="col-md-2 `+a+`">
				   <div class="form-group">
				   <label for="price">Price (One Tablet)</label>
				    <input type="text" name="price`+a+`" id="price`+a+`" onkeyup="multiplication(`+a+`); finalTotall();" class="form-control" placeholder="Price (One Tablet)" required>
				   </div>								   
				</div>
				
				<div class="col-md-2 `+a+`">
				   <div class="form-group">
				   <label for="total">Total</label>
				    <input type="number" name="total`+a+`" id="total`+a+`" class="form-control total" placeholder="total" readonly required>
				   </div>								   
				</div>
				
				
				
				<div class="col-md-1 `+a+`">
				   <div class="form-group">
				   <br>
				    <button type="button" id="removeRow`+a+`"  class="form-control btn btn-danger btn-xs" >X</button>
				   </div>								   
				</div>
			  
			`; 
			$("#count").val(a);
			$(".displayRow").append(text);
			
			$("#removeRow"+a+"").click(function(){
				$("."+a+"").remove();
				a--;
				$("#count").val(a);
			})
			
		 });
		   
	   });
	   
	   function multiplication(x){
		  var qty = $("#quantity"+x+"").val();
		  var price = $("#price"+x+"").val();
		  
		  var total = Number(price) * Number(qty);
		  
		  $("#total"+x+"").val(total);
	   }
		
	function validate(){
		var drawerId = $("#drawerId").val();
		if(drawerId=="--Select Drawer--"){
			alert("Select Drawer Name");
			return false;
		}else{
			return true;
		}
	}
	
	
	function finalTotall(){
				var total = $(".total");
				var t = 0;
				total.each(function(){
					
					 t += Number($(this).val());
					 
				});
				
				$("#finalTotal").val(t);
	}
	
	// Check Qntity
	function checkTabletQuantity(x){
		var tabletName = $("#tabletName"+x+"").val();
		$.ajax({
			url : 'fetchTabletsQtyDB.jsp',
			method : 'post',
			data : 'tabletName='+tabletName,
			success : function(response){
				if(response.trim()=="Not Record"){
					$("#tabletNameText"+x+"").text("Tablet Name Not in List").css({"color":"red"});
					$("#quantityText"+x+"").empty();
					$("input[type=submit]").attr("disabled","disabled");
				}else if(response.trim()=="0"){
					$("#quantityText"+x+"").text("Qty is empty").css({"color":"red"});
					$("#tabletNameText"+x+"").empty();
					$("input[type=submit]").attr("disabled","disabled");
				}else{
					$("#quantityText"+x+"").text("Qty is : "+response.trim()).css({"color":"red"});
					$("#tabletNameText"+x+"").empty();
					$("input[type=submit]").removeAttr("disabled");
				}
				
			}
		})
	}
	</script>
</body>
</html>