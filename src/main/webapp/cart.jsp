<%@page import="java.text.DecimalFormat" %>
<%@page import="com.weenalk.DBcon.*" %>
<%@page import="com.weenalk.DAO.*" %>
<%@page import="java.util.*"%>
<%@page import="com.weenalk.Modal.*" %>
<!DOCTYPE html>
<html lang="en">
<%

	DecimalFormat df = new DecimalFormat("0.00");
	//cart list type beins
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	double carttotal=0;
	if (cart_list != null) {
		ProductDao pdao = new ProductDao(DbCon.getConnection());
		cartProduct = pdao.getCartProducts(cart_list);
		carttotal = pdao.getTotalCartPrice(cart_list);
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("cart_total", carttotal);
	}	
%>
<head>
  <title>Weena</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <!-- Favicon -->
  <link href="images/V2.0.png" rel="icon" />
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700" />
  <link rel="stylesheet" href="fonts/icomoon/style.css" />

  <link rel="stylesheet" href="css/bootstrap.min.css" />
  <link rel="stylesheet" href="css/magnific-popup.css" />
  <link rel="stylesheet" href="css/jquery-ui.css" />
  <link rel="stylesheet" href="css/owl.carousel.min.css" />
  <link rel="stylesheet" href="css/owl.theme.default.min.css" />

  <link rel="stylesheet" href="css/aos.css" />
  <link rel="stylesheet" href="css/style.css" />
   <!-- svg and preloader css -->
   <link rel="stylesheet" href="css/svg.css">
   <link rel="stylesheet" href="css/preloader.css">
   <!-- ends -->
  <!-- header -->
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://fonts.googleapis.com/css?family=Rubik&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/af562a2a63.js" crossorigin="anonymous"></script>
  <!-- header ends -->
  <link rel="stylesheet" href="css/dropdown.css">

</head>

<body>
  <style>
    	@import url("https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900");
   		 *{

     	 font-family: "Poppins";
     	 font-weight: 400;
    	 font-size: 16px;
    	}
    	/* Chrome, Safari, Edge, Opera */
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
  		-webkit-appearance: none;
  		margin: 0;
		}
 </style>
  <!-- Page Preloder -->
  <div id="preloder">
    <div class="d-flex justify-content-center"
      style="position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%);">
      <div class="spinner-border text-dark align-content-center" style="width: 3rem; height: 3rem; " role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>
  </div>
  <!-- ends herer -->
  <div class="site-wrap">
    <header>
      <!-- contact content -->
      <div class="header-content-top">
        <div class="content">
          <span><i class="fas fa-phone-square-alt"></i> (00)0000-0000</span>
          <span><i class="fas fa-envelope-square"></i>email@email.com.br</span>
        </div>
      </div>
      <!-- / contact content -->
      <div class="cntnr">
        <!-- logo -->
        <!-- <strong class="logo"><i class="fas fa-heart"></i></strong> -->
        <a href="index.jsp">
          <div class="lgo" style="width: 100px;
                      height: 50px;
                      background-image: url('images/V2.0.png');
                      background-repeat: no-repeat;
                      background-size: contain;
                      position: relative;
                      left: 20px;">
          </div>
        </a>
        <!-- open nav mobile -->

        <!--search -->
        <label class="open-search" for="open-search">
          <i class="fas fa-search"></i>
          <input class="input-open-search" id="open-search" type="checkbox" name="menu" />
          <div class="search">
            <button class="button-search"><i class="fas fa-search"></i></button>
            <input type="text" placeholder="What are you looking for?" class="input-search" />
          </div>
        </label>
        <!-- // search -->
        <nav class="nav-content">
          <!-- nav -->
          <ul class="nav-content-list">
            <li class="nav-content-item account-login">
              <div class="downyy">
                <span class="login-text text-light">Hello, Sign in <strong>Create Account</strong></span> <span
                  class="item-arrow"></span>
                <!-- submenu -->
                <div id="mydrop" class="downyy-content">
                  <a href="userpro.jsp">My profile</a>
                  <a href="#">Logout</a>
                  <a href="login.jsp">Login</a>
                </div>

              </div>
            </li>
            <li class="nav-content-item login-text">
              <div style="width: 35px;
                                height: 35px;
                                border-radius: 100px;
                                background-image: url('images/bpro.png');
                                background-repeat: no-repeat;
                                background-size: cover;
                                position: relative;
                                top: -1px;
                                left: 5px;" class="downyy">
                <!-- submenu -->
                <!-- <div id="mydrop" class="downyy-content">
                  <a href="#">My profile</a>
                  <a href="#">Logout</a>
                </div> -->
                <!-- submenu end -->
              </div>
            </li>
            <li class="nav-content-item"><a class="nav-content-link" href="whishlist.jsp"><i
                  class="fas fa-heart text-light"></i><span class="badge badge-dark rounded-circle"
                  style="position: absolute; top: 1%;">1</span></a></li>
            <li class="nav-content-item"><a class="nav-content-link" href="cart.jsp"><i
                  class="fas fa-shopping-cart text-light"></i><span class="badge badge-dark rounded-circle"
                  style="position: absolute; top: 1%;"><%=cart_list!=null?cart_list.size():0 %></span></a></li>
            <!-- call to action -->
          </ul>
        </nav>
      </div>
      <!-- nav navigation commerce -->
      <div class="naw-container">
        <nav class="all-category-nav">
          <label class="open-menu-all" for="open-menu-all">
            <input class="input-menu-all" id="open-menu-all" type="checkbox" name="menu-open" />
            <span class="all-navigator"><i class="fas fa-bars"></i> <span>All category</span> <i
                class="fas fa-angle-down"></i>
              <i class="fas fa-angle-up"></i>
            </span>

            <ul class="all-category-list">
              <li class="all-category-list-item"><a href="dashdex.jsp" class="all-category-list-link">Dashboard<i
                    class="fas fa-angle-right"></i></a>
                <!-- <div class="category-second-list">
                  <ul class="category-second-list-ul">
                    <li class="category-second-item"><a href="#">Iphone 10</a></li>
                    <li class="category-second-item"><a href="#">Galaxy Note 10</a></li>
                    <li class="category-second-item"><a href="#">Motorola One </a></li>
                    <li class="category-second-item"><a href="#">Galaxy A80 </a></li>
                    <li class="category-second-item"><a href="#">Galaxy M </a></li>
                    <li class="category-second-item"><a href="#">Huaway P30 </a></li>
                  </ul>

                  <div class="img-product-menu"><img src="https://i.ibb.co/Vvndkmy/banner.jpg"></div>
                </div> -->
              </li>
              <li class="all-category-list-item"><a href="#" class="all-category-list-link">Guitar <i
                    class="fas fa-angle-right"></i></a></li>
              <li class="all-category-list-item"><a href="#" class="all-category-list-link">Keyboard<i
                    class="fas fa-angle-right"></i></a></li>
              <li class="all-category-list-item"><a href="#" class="all-category-list-link">Piano<i
                    class="fas fa-angle-right"></i></a></li>
              <li class="all-category-list-item"><a href="#" class="all-category-list-link">Drum<i
                    class="fas fa-angle-right"></i></a></li>
              <li class="all-category-list-item"><a href="" class="all-category-list-link">Flute<i
                    class="fas fa-angle-right"></i></a></li>

            </ul>
          </label>

        </nav>
        <nav class="featured-category">
          <ul class="nav-row">
            <li class="nav-row-list"><a href="about.jsp" class="nav-row-list-link">About Us</a></li>
            <li class="nav-row-list"><a href="contact.jsp" class="nav-row-list-link">Contact Us</a></li>
            <li class="nav-row-list"><a href="dashdex.jsp" class="nav-row-list-link">Dashboard</a></li>
            <li class="nav-row-list"><a href="products.jsp" class="nav-row-list-link">Shop</a></li>
            <li class="nav-row-list"><a href="#" class="nav-row-list-link">Guitar</a></li>
            <li class="nav-row-list"><a href="#" class="nav-row-list-link">Drums</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0">
            <a href="index.jsp" class=" text-black">Home</a> <span class="mx-2 mb-0">/</span>
            <strong class="text-black">Cart</strong>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
      	<form action="" method="post">
      		<div class="row mb-5">
          	<div class="col-md-12" ">
          		<%if(cart_list==null){%>
          			<h1 class="shadow-none text-black bold text-center">CART IS EMPTY</h1>
                  	<h1 class="text-black text-center m-5"><i class="fa-solid fa-face-frown fa-2xl"></i></h1>
          		<%}
          		%>
              	
                <%
                if(cart_list !=null){%>
                  <div class="site-blocks-table shadow">
                	<table class="table table-bordered">
                    <thead>
                      <tr>
                        <th class="product-thumbnail">Image</th>
                        <th class="product-name">Product</th>
                        <th class="product-price">Price</th>
                        <th class="product-quantity">Quantity</th>
                        <th class="product-total">Total</th>
                        <th class="product-remove">Remove</th>
                      </tr>
                    </thead>
                    <tbody>
                	<%for(Cart c: cartProduct){%>
                		<tr>
                        <td class="product-thumbnail">
                          <div style="background-image: url('images/products/<%=c.getImg()%>');
                                background-repeat: no-repeat;
                                background-size: contain;
                                 background-position: center; 
                                height:100px;"
                                >
                           </div>	
                         
                        </td>
                        <td class="product-name">
                          <h2 class="h5 text-black"><%=c.getName() %></h2>
                        </td>
                        <td>RS.<%=df.format(c.getPrice()) %></td>
                        <td>
                          <!-- if the below div instead using mb-3 if we use m-auto the element will be nicely centerd see difference of the below row in line 169 -->
                          <div class="input-group m-auto" style="max-width: 120px">
                            <div class="input-group-prepend">
                             <a href="quantityincdec?action=dec&id=<%=c.getId()%>" class="btn btn-outline-dark rounded-0 btn-decre" >&minus;</a> 
                           </div>
                            <input type="number" class="form-control text-center" value="<%=c.getQuantity() %>" placeholder=""
                              aria-label="Example text with button addon" min="1" aria-describedby="button-addon1" />
                           <div class="input-group-append">
                            	<a href="quantityincdec?action=inc&id=<%=c.getId()%>" class="btn btn-outline-dark rounded-0 btn-incres" > &plus;</a> 
                           </div>
                          </div>
                        </td>
                        <td>Rs.<%=df.format(c.getCartPrice()) %></td>
                        <td>
                        <a href="AddToWhishlistServlet?id=<%=c.getId()%>" class="btn btn-dark rounded-0 btn-sm"><i class="fa fa-heart text-light"></i></a>
                        <a href="removecart?pathh=cart&id=<%=c.getId() %>" class="btn btn-dark rounded-0 btn-sm">X</a>
                        </td>
                      </tr>
                	<%}%>
                	  </tbody>
                     </table>
                   </div>
                <%}
                %>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6 mb-3 mb-md-0">
              	<a href="whishlist.jsp" class="btn btn-dark rounded-0 btn-sm btn-block">WishList</a>
              </div>
              <div class="col-md-6">
              	<a href="products.jsp" class="btn btn-outline-dark rounded-0 btn-sm btn-block">Continue Shopping</a>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">Coupons</label>
                <p>Did You Know WEENA NADHA Offers Exclusive Coupons For Thier Loyality Customers Based On The Activness Of The User Purchasing In our Store.</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <p>Feel Free To <a href="contact.jsp" class="text-black">Contact Us</a>  24/7</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">Subtotal</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">Rs <%=df.format(cart_list!=null?carttotal:00.000)%></strong>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">Rs <%=df.format(cart_list!=null?carttotal:00.000)%></strong>
                  </div>
                </div>
				<%if(carttotal!=0){%>
					<div class="row">
	                  <div class="col-md-12">
	                  	<a href="checkout.jsp" class="btn bg-black text-white rounded-0 btn-lg py-3 btn-block">Proceed To Checkout</a>
	                  </div>
                	</div>
				<%}
				
				%>
                
              </div>
            </div>
          </div>
        </div>
      	</form>
        
      </div>
    </div>
    <!-- footer starts here -->

    <!-- footer section ends here -->
  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
  <!-- preloader -->
  <script src="js/preloader.js"></script>
  <!-- preloader ends script -->
   <!-- below is the ween nadha -->
   <script src="//code.tidio.co/r5typbnmc7v1ws5v7zbwyrx8bvqch6xv.js" async></script>
</body>

</html>