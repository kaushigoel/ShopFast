
<%

User user3 = (User) request.getSession().getAttribute("currentUser");
if (user3 == null) {

	session.setAttribute("message", "You are not logged in!! Login first");
	response.sendRedirect("login.jsp");
	return;
}



%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>checkout</title>

<%@include file="Components/common_css_js.jsp"%>
</head>
<body>

	<%@include file="Components/navbar.jsp"%>

	<div class="container">

		<div class="row mt-5">

			<div class="col-md-6">

				<!-- card -->

				<div style="background-color:#8d3aaa" class="card">
				<h3 class="text-center">Your cart</h3>
					<div class="cart-body"></div>
				</div>

			</div>

			<div class="col-md-6">
					
					<div style="background-color:#8d3aaa" class="card">
					<h3 class="text-center mt-2">Your details</h3>
					
				<form >
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
		    <input value="<%= user3.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
		   
		  </div>
		  <div class="form-group">
		    <label for="name">Name</label>
		    <input value="<%= user3.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your name">
		   
		  </div>
		  <div class="form-group">
		    <label for="phone">Phone no</label>
		    <input value="<%= user3.getUserPhone()%>" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter your name">
		   
		  </div>
		  	
		  	<div class="form-group">
		  	<label for="address">Shipping address</label>
		  	<textarea value="<%= user3.getUserAddress()%>"class="form-control" id="address" rows="3"></textarea>
		  	
		  	</div>
		  	<div class="container text-center mb-2">
		  
		  <button class="btn btn-success">Order now</button>
		  <button class="btn btn-primary">Continue Shopping</button>
		  </div>
		  </form>

					</div>
					
					
					
			</div>

		</div>

	</div>



	<%@include file="Components/common_modals.jsp"%>
</body>
</html>