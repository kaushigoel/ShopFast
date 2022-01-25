<%@page import="com.kaushiki.helper.Helper"%>
<%@page import="com.kaushiki.entity.Category"%>
<%@page import="com.kaushiki.dao.CategoryDao"%>
<%@page import="com.kaushiki.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.kaushiki.dao.ProductDao"%>
<%@page import="com.kaushiki.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>MyCart-Home</title>

<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="Components/navbar.jsp"%>


	<div class="container-fluid">

		<div class="row mt-3 mx-2">

			<%
				String cat = request.getParameter("category");
				//out.println(cat);

				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());

				List<Product> list = null;

				if (cat == null) {

					list = pdao.getAllProducts();

				}

				else if (cat.trim().equals("all")) {
					list = pdao.getAllProducts();
				}

				else {
					int cid = Integer.parseInt(cat.trim());
					list = pdao.getAllProductsById(cid);
				}

				CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
				List<Category> clist = cdao.getCategories();
			%>



			<!-- showing categories -->
			<div class="col-md-2">

				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Categories </a>


					<%
						for (Category c : clist) {
					%>

					<a href="index.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
					<%
						}
					%>

				</div>

			</div>


			<!-- showing products -->

			<div class="col-md-10">


				<div class="row mt-4">


					<div class="col-md-12">

						<div class="card-columns">

							<!--traversing products  -->


							<%
								for (Product p : list) {
							%>


							<div class="card product-card">

								<div class="container text-center">

									<img src="img/products/<%=p.getProductPhoto()%>"
										style="max-height: 220px; max-width: 100%; width: auto;"
										class="card-img-top" alt="...">

								</div>

								<div class="card-body">

									<h5 class="card-title"><%=p.getProductName()%></h5>


									<p class="card-text">

										<%=Helper.get10Words(p.getProductDesciption())%>

									</p>

								</div>


								<div class="card-footer text-center">

									<button class="btn custom-bg text-white" 
									onclick="addToCart(<%= p.getProductId() %>, '<%= p.getProductName() %>',<%= p.getPriceAfterApplyingDiscount() %>)">Add to Cart</button>
									
									<button class="btn btn-success text-white">&#8377;<%=p.getPriceAfterApplyingDiscount()%>/- 
										<span
											 style="font-size: 15px"class="text-warning">  &#8377;<%= p.getProductPrice()%> <%=p.getProductDiscount() %>%off
										</span>
									</button>

								</div>
							</div>

							<%
								}

								if (list.size() == 0) {

									out.println("<h1>No item in this category</h1>");

								}
							%>


						</div>
					</div>

				</div>
			</div>
			</div>
			</div>
			<%@include file="Components/common_modals.jsp" %>
			
			
</body>
</html>
