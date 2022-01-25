
<%@page import="java.util.Map"%>
<%@page import="com.kaushiki.helper.Helper"%>
<%@page import="com.kaushiki.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.kaushiki.helper.FactoryProvider"%>
<%@page import="com.kaushiki.dao.CategoryDao"%>
<%
	User user2 = (User) request.getSession().getAttribute("currentUser");
	if (user2 == null) {

		session.setAttribute("message", "You are not logged in!! Login first");
		response.sendRedirect("login.jsp");
		return;
	}

	else {

		if (user2.getUserType().equals("normal")) {
			session.setAttribute("message", "You are not admin!! Dont try to access this page!!");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>




				<!-- product belongs to which category -->

						<%
							CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
							List<Category> list = cdao.getCategories();
				
				
					
					Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
					
					
					
					
					
					%>
						
						
						
						
						
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin portal</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="Components/navbar.jsp"%>

	<div class="container admin mt-4">

		<div class="container-fluid">
			<%@include file="Components/message.jsp"%>


		</div>
		<div class="row mt-4">
			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">


						<div class="container">
							<img style="max-width: 100px;" class="img-fluid img-circle"
								src="img/team.png" alt="user_icon">

						</div>


						<h1><%= m.get("userCount") %></h1>
						<h1>Users</h1>

					</div>
				</div>

			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								src="img/categories.png" alt="user_icon">
						
						</div>
						
						<h1><%=list.size() %></h1>
						<h1>Categories</h1>

					</div>

				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid "
								src="img/products.png" alt="user_icon">

						</div>

						<h1><%= m.get("productCount") %></h1>
						<h1>Products</h1>

					</div>
				</div>
			</div>

		</div>




		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								src="img/addCategory.png" alt="user_icon">
							<h1>Add Category</h1>
						</div>

					</div>

				</div>

			</div>


			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid img-circle"
								src="img/addProducts.png" alt="user_icon">
							<h1>Add Products</h1>
						</div>

					</div>

				</div>

			</div>
		</div>


	</div>



	<!-- add category Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="AddCategoryProductServlet" method="post">

						<input type="hidden" name="choose" value="addCategory">


						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="enter title here">
						</div>

						<div class="form-group">

							<textarea style="height: 300px;"
								placeholder="enter category description here"
								class="form-control" name="catDescription"></textarea>
						</div>

						<div class="container text-center">
						
							<button class="btn btn-outline-success">Add category</button>
							<button type="button" class="btn btn-success"
								data-dismiss="modal">Close</button>
						</div>
						
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- Product modal start -->

	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Products
						here</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="AddCategoryProductServlet" method="post"
						enctype="multipart/form-data">
						
						<input type="hidden" name="choose" value="addProduct" />


						<div class="form-group">
							<input type="text " class="form-control"
								placeholder="enter name of product here" name="productName"
								required />

						</div>

						<div class="form-group">
							<textarea style="height: 150px;" class="form-control"
								placeholder="enter product description here"
								name="productDescription"></textarea>
						</div>

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="enter product price here" name="productPrice"
								required />
						</div>

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="enter no. of products" name="quantity" required />
						</div>

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="enter discount given on product"
								name="productDiscount" required />
						</div>

						

						

						<div class="form-group">

							<select name="catId" class="form-control" id="">

								<%
									for (Category c : list) {
								%>

								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
								<%
									}
								%>
								<option value="tops">tops</option>
								<option value="jeans">jeans</option>
							</select>

						</div>
						<div class="form-group">
							<label for="picId">Select image of product: </label>
							<br> 
							<input
								type="file" id="picId" name="productPic">
						</div>


						<div class="container text-center">
							<button class="btn btn-light text-light custom-bg">Add
								Product</button>
						</div>

					</form>
					<!-- end of product form -->

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	<!-- product modal end -->



<%@include file="Components/common_modals.jsp" %>



</body>
</html>