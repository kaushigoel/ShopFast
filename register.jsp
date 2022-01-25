<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register new user</title>
<%@include file="Components/common_css_js.jsp" %>
</head>
<body>


<%@include file="Components/navbar.jsp" %>

<div class="container-fluid">

<div class="row mt-3">
	<div class="col-md-4 offset-md-4">
	<%@include file= "Components/message.jsp" %>
	<div class="card">
		<div class="card-body">
		<h3 class="text-center my-3">SignUp</h3>
	
		<form action="RegisterServlet" method="post">
			<div class="form-group">
    <label for="name">User Name</label>
    <input name="username"type="text" class="form-control" id="name" aria-describedby="emailHelp" >
    
  </div>
  
	<div class="form-group">
    <label for="email">Email</label>
    <input name="email"type="email" class="form-control" id="email" aria-describedby="emailHelp" >
    
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input name="password"type="password" class="form-control" id="password" aria-describedby="emailHelp" >
    
  </div>
  
  <div class="form-group">
    <label for="phone">User Phone</label>
    <input name="phone"type="number" class="form-control" id="phone" aria-describedby="emailHelp" >
    
  </div>
  
  <div class="form-group">
    <label for="address">User Address</label>
    <textarea name="address"style="height:150px;"class="form-control" id="address"></textarea>
    
  </div>
  
  <div class="container text-center">
  <button class="btn btn-outline-success">Register</button>
  <button class="btn btn-outline-warning">Reset</button>
  
  </div>
  		</form>
	
		</div>
	
	</div>
	</div>

</div>


</div>

</body>
</html>