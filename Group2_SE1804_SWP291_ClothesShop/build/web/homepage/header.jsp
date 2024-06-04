     <!-- Header -->
        <header class="header">
            <!-- Header Top -->
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="top-text">
                                <p>Welcome to Electronics Shop</p>
                            </div>

                        </div>
                        <div class="col-lg-7">
                            <div class="top-list">
                                <c:if test="${sessionScope.acc != null}">
                                    <a href="profile"><i class="fas fa-user"></i>${sessionScope.acc.username}</a>
                                    </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Middle -->
            <div class="header-middle pt-30 pb-30">
                <div class="container">
                    <div class="row">
                        <!-- Logo -->
                        <div class="col-lg-2">
                            <div class="logo">
                                <h2><a href="index.html"><img src="../assets/img/logo.png"></a></h2>
                            </div>
                        </div>
                        <!-- Search Bar -->

                        <!-- MiniCart -->
                        
                    </div>
                </div>
            </div>
            <!-- Header Bottom -->
            <div class="header-bottm">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="logo-2">
                                <h2><a href="index.html"><img src="../assets/img/logo.png"></a></h2>
                            </div>
                            <div class="canvas_open">
                                <a href="javascript:void(0)"><i class="fas fa-bars"></i></a>
                            </div>
                            <div class="mobile-mini-cart">
                                <div class="mini-cart">
                                    <div class="mini-cart-icon">
                                        <i class="fas fa-shopping-cart"></i>
                                        <span class="counter">02</span>
                                        <span class="counter-cart"><small>Your Cart</small>$10.00</span>
                                        <!-- Mini Cart Content -->
                                        <div class="minicart-content-wrapper">
                                            <ul class="cart-list-full">
                                                <!-- Single -->
                                                <li class="cart-list-single">
                                                    <img src="../assets/img/product/1.jpg" alt="img">
                                                    <h5><a href="#">simple product</a></h5>
                                                    <span class="price">$120</span>
                                                    <div class="close"><i class="fas fa-times"></i></div>
                                                </li>
                                                <!-- Single -->
                                                <li class="cart-list-single">
                                                    <img src="../assets/img/product/2.jpg" alt="img">
                                                    <h5><a href="#">simple product</a></h5>
                                                    <span class="price">$120</span>
                                                    <div class="close"><i class="fas fa-times"></i></div>
                                                </li>
                                            </ul>
                                            <h2 class="subtotal">Subtotal : <span>$220</span></h2>
                                            <div class="minicart-btn">
                                                <a class="button-1" href="cart.html">View Cart</a>
                                                <a class="button-2" href="#">Checkout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="menu">
                                <nav>
                                    <ul>
                                        <li><a href="admin">Home</a></li>
                                        <li><a href="trending-product"> Trending Product</a></li>
                                        <li><a>Product<i class="fa fa-angle-down"></i></a>
                                            <ul class="submenu-item">
                                                <li><a href="addproduct">Add New Product</a></li>
                                                <li><a href="listproduct">List Product</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="orderlist">Order</a></li>                               
                                        <li><a href="user-list">User</a></li>
                                        <li><a href="customer-list">Customer</a></li>
                                        <li><a href="#">Cart</a></li>
                                        <li><a href="#">Feedback</a></li>
                                        <li><a href="blog.html">blog <i class="fa fa-angle-down"></i></a>
                                            <ul class="submenu-item">
                                                <li><a href="blog.html">Blog</a></li>
                                                <li><a href="blog-grid.html">Blog Grid</a></li>
                                                <li><a href="single.html">Blog Single</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header -->