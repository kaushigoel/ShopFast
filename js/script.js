
function addToCart(pid,pname,pprice)
{
	
let cart=localStorage.getItem("cart");

if(cart== null){
	
	// no cart yet
	
	let products=[];
	
	let product={productId:pid, productName:pname, quantity:1, productPrice:pprice};
	
	products.push(product);
	
	localStorage.setItem("cart",JSON.stringify(products));
	console.log("Product is added for the first time")
	showToast("item is added to cart");
}

else 
{
	
	// cart is already present
	
	let pcart=JSON.parse(cart);
	
	let oldProduct=pcart.find((item) => item.productId == pid)
		
	if(oldProduct){
		
		// we have to increase quantity
	oldProduct.quantity = oldProduct.quantity + 1
	
	pcart.map((item) =>  {
	 
	if(item.productId == oldProduct.productId)
		{
	
		item.quantity= oldProduct.quantity;
	}
		
		
	})
	
	
	localStorage.setItem("cart", JSON.stringify(pcart));
	console.log("product quantity is increased")
	showToast(oldProduct.productName+" quantity is increased");	
	}
	else{
		
		// we have to add new product
		let product={productId:pid, productName:pname, quantity:1, productPrice:pprice};
		
		pcart.push(product);
		
		localStorage.setItem("cart",JSON.stringify(pcart));
		console.log("product is added")
		showToast("product is added to cart");
		
	}
}

updateCart();


}



	function updateCart(){
		
	let cartString=	localStorage.getItem("cart");
		 let cart=JSON.parse(cartString);
		
		if(cart==null || cart.length==0){
			
			console.log("cart is empty!!");
			$(".cart-items").html("( 0 )");
			
			$(".cart-body").html("<h3>Cart does not have any items</h3>");
			
			$(".checkout-btn").attr('disabled',true);
			
			
		}
		
		
		else{
			
			// there is something in cart to show
			console.log(cart)
			
			$(".cart-items").html(`( ${cart.length} )`);
			
			let table=`
			
						<table class='table'>
						<thead class='thead-light'>
						
						<tr>
						
						<th> Item name </th>
						<th> Item price </th>
						<th> Item quantity </th>
						
						<th> total price </th>
						
						<th>Action</th>
						
						</tr>
						
						
						</thead>
			
			
			`;
			
			
				let totalPrice=0;
				
				
				cart.map((item)=>{
					
					
					table+=`
					
					
					<tr>
					
					<td> ${item.productName} </td>
					<td> ${item.productPrice} </td>
					<td> ${item.quantity} </td>
					<td> ${item.quantity*item.productPrice} </td>
					<td> <button class='btn btn-danger btn-sm' onclick='deleteItemFromCart(${item.productId})'>remove</button></td>
					
					</tr>
					
					
					`
					
					totalPrice+=item.productPrice * item.quantity;
					
				})
				
			
			table = table+ `
			
			<tr><td colspan='5' class='text-right font-weight-bold'>total price: ${totalPrice}</td></tr>
			
			
			</table>`
			
			$(".cart-body").html(table);
				
				$(".checkout-btn").attr('disabled',false);
		}
	}
	
	
	// remove button
		function deleteItemFromCart(pid)
		
		{
			
			let cart=JSON.parse(localStorage.getItem('cart'));
			
			let newcart=cart.filter((item)=>item.productId != pid)
				
				localStorage.setItem('cart',JSON.stringify(newcart))
			
			updateCart();
			
			showToast("item is deleted from cart");
		}
	
		
		
		
	$(document).ready(function(){
		updateCart()
	})
	
	
	
	function showToast(content){
		
		
		$("#toast").addClass("display");
		$("#toast").html(content);
		
		setTimeout( ()=> {
			
			$("#toast").removeClass("display");
			
		},3000);
	}
	
	function goToCheckout(){
		
		window.location="checkout.jsp"
		
	}