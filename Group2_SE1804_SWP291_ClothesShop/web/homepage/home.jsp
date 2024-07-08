<%-- 
    Document   : home
    Created on : Jun 20, 2024, 10:22:00 PM
    Author     : KieuTuanPC
--%>
<%@ page import="model.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  class="no-js" lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Colthes Shop</title>
        <link rel="icon" href="assets/img/icon.png" type="image/gif" sizes="16x16">
        <link rel="icon" href="assets/img/icon.png" type="image/gif" sizes="18x18">
        <link rel="icon" href="assets/img/icon.png" type="image/gif" sizes="20x20">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/fontawesome.all.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script type="text/javascript">

            function addToCart(productId) {
                var pId = productId; 
                var totalProduct;
                $.ajax({
                    type: 'GET',
                    data: {pId: pId},
                    url: 'AddToCart',
                    success: (result) => {
                        var cart = result;
                        totalProduct = cart.length;
                        $('.counter').text(totalProduct);
                    },
                    error: function () {
                        showError('Delete fail something went wrong', 3000);
                    }
                });

            }
            function showAlert(message, duration) {
                // Tạo phần tử alert mới
                let alertDiv = document.createElement('div');
                alertDiv.className = 'alert alert-success';
                alertDiv.role = 'alert';
                alertDiv.innerHTML = message;
                alertDiv.style = 'margin-top: 50px;z-index: 9999; position: fixed; top: 0; right: 0;width: 300px;height:50px';
                let wrapper = document.getElementById('notifications');
                // Thêm phần tử alert vào body hoặc một container cụ thể
                wrapper.appendChild(alertDiv);

                // Tự động ẩn phần tử alert sau thời gian đã định
                setTimeout(() => {
                    alertDiv.remove();
                }, duration);
            }
            function showError(message, duration) {
                // Tạo phần tử alert mới
                let alertDiv = document.createElement('div');
                alertDiv.className = 'alert alert-danger';
                alertDiv.role = 'alert';
                alertDiv.innerHTML = message;
                alertDiv.style = 'margin-top: 50px;z-index: 9999; position: fixed; top: 0; right: 0;width: 300px;height:50px'
                let wrapper = document.getElementById('notifications');
                // Thêm phần tử alert vào body hoặc một container cụ thể
                wrapper.appendChild(alertDiv);

                // Tự động ẩn phần tử alert sau thời gian đã định
                setTimeout(() => {
                    alertDiv.remove();
                }, duration);
            }

        </script>
    </head>
    <body>

        <div class="off_canvars_overlay"></div>
        <!-- Header -->
        <header class="header">
            <!-- Header Top -->

            <!-- Header Middle -->
            <%@include file="header.jsp" %>

            <!-- Header Bottom -->
            <div class="header-bottm" style="background-color: #ea880d">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="logo-2">
                                <h2><a href="/clothesShop/Home"><img src="assets/img/logo.png"></a></h2>
                            </div>
                            <div class="canvas_open">
                                <a href="javascript:void(0)"><i class="fas fa-bars"></i></a>
                            </div>
                            <div class="mobile-mini-cart">
                                <div class="mini-cart">
                                    <div class="mini-cart-icon">
                                        <i class="fas fa-shopping-cart"></i>
                                        <span class="counter">02</span>
                                        <span class="counter-cart"><small>Your Cart</small></span>
                                        <!-- Mini Cart Content -->
                                      
                                    </div>
                                </div>
                            </div>
                            <div class="menu" >
                                <nav>
                                    <ul>
                                        <li><a href="/clothesShop/Home">Home</a></li>
                                        <li><a href="/clothesShop/AllProduct">Shop <i class="fa fa-angle-down"></i></a>
                                            <ul class="submenu-item">
                                                <li><a href="/clothesShop/AllProduct">All Products</a></li>
                                                <li><a href="shop-men.html">Men</a></li>
                                                <li><a href="shop-women.html">Women</a></li>
                                                <li><a href="shop-new-arrivals.html">Unisex</a></li>
                                                <li><a href="shop-sale.html">Sale</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Collections <i class="fa fa-angle-down"></i></a>
                                            <ul class="submenu-item">
                                                <li><a href="collection-summer.html">Summer Collection</a></li>
                                                <li><a href="collection-winter.html">Winter Collection</a></li>
                                                <li><a href="collection-best-sellers.html">Best Sellers</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="blog.html">Blog <i class="fa fa-angle-down"></i></a>
                                            <ul class="submenu-item">
                                                <li><a href="bloglist.html">Blog List</a></li>
                                                <li><a href="blog-grid.html">Blog Grid</a></li>
                                                <li><a href="blog-single.html">Blog Single</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="contact.html">Contact</a></li>
                                    </ul>
                                </nav>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header -->

        <!-- Start Mobile Menu Area -->
        <div class="mobile-menu-area">

            <!--offcanvas menu area start-->
            <div class="off_canvars_overlay"></div>
            <div class="offcanvas_menu">
                <div class="offcanvas_menu_wrapper">
                    <div class="canvas_close">
                        <a href="javascript:void(0)"><i class="fas fa-times"></i></a>
                    </div>
                    <div class="mobile-logo">
                        <h2><a href="index.html"><img src="assets/img/logo.png" alt="Logo"></a></h2>
                    </div>
                    <div id="menu" class="text-left">
                        <ul class="offcanvas_main_menu">
                            <li><a href="index.html">Home</a></li>
                            <li><a href="about.html">About Us</a></li>
                            <li class="menu-item-has-children">
                                <a href="#">Shop</a>
                                <ul class="sub-menu">
                                    <li><a href="shop.html">All Products</a></li>
                                    <li><a href="shop-men.html">Men</a></li>
                                    <li><a href="shop-women.html">Women</a></li>
                                    <li><a href="shop-kids.html">Unisex</a></li>
                                    <li><a href="shop-sale.html">Sale</a></li>
                                </ul>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="#">Collections</a>
                                <ul class="sub-menu">
                                    <li><a href="collection-summer.html">Summer Collection</a></li>
                                    <li><a href="collection-winter.html">Winter Collection</a></li>
                                    <li><a href="collection-best-sellers.html">Best Sellers</a></li>
                                </ul>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="#">Blog</a>
                                <ul class="sub-menu">
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-grid.html">Blog Grid</a></li>
                                    <li><a href="single.html">Blog Single</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--offcanvas menu area end-->
        <!-- End Mobile Menu Area -->
        <!-- Start Hero Area -->
        <section class="hero-area">
            <div class="hero-area-full owl-carousel">
                <c:forEach var="image" items="${randomImages}">
                    <div class="hero-slider-single" style="background-image: url('${image}');">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="hero-slider-single-content">
                                        <h2>Leading Fashion <span>Manufacturer</span></h2>
                                        <p>Ostromi Is A Specialist In High-Quality Clothing And Accessories</p>

                                        <a class="button-1" href="/clothesShop/AllProduct">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <!-- End Hero Area -->
        <!-- Start Shipping Area -->
        <div class="shipping-area container">
            <div class="row">
                <!-- Single -->
                <div class="col-lg-3 col-md-6 mb-25">
                    <div class="shipping-item">
                        <div class="icon">
                            <img src="assets/img/pay-1.png" alt="img">
                        </div>
                        <div class="content">
                            <h4>Free Shipping</h4>
                            <p>On all orders over $75.00</p>
                        </div>
                    </div>
                </div>
                <!-- Single -->
                <div class="col-lg-3 col-md-6 mb-25">
                    <div class="shipping-item">
                        <div class="icon">
                            <img src="assets/img/pay-2.png" alt="img">
                        </div>
                        <div class="content">
                            <h4>Free Returns</h4>
                            <p>Returns are free within 9 days</p>
                        </div>
                    </div>
                </div>
                <!-- Single -->
                <div class="col-lg-3 col-md-6 mb-25">
                    <div class="shipping-item">
                        <div class="icon">
                            <img src="assets/img/pay-3.png" alt="img">
                        </div>
                        <div class="content">
                            <h4>Support 24/7</h4>
                            <p>Contact us 24 hours a day</p>
                        </div>
                    </div>
                </div>
                <!-- Single -->
                <div class="col-lg-3 col-md-6 mb-25">
                    <div class="shipping-item">
                        <div class="icon">
                            <img src="assets/img/pay-4.png" alt="img">
                        </div>
                        <div class="content">
                            <h4>100% Payment Secure</h4>
                            <p>Your payment are safe with us.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Shipping Area -->
        <!-- Start banner Area -->
        <section class="banner-area container">
            <div class="row">
                <c:forEach var="image" items="${bannerImages}">
                    <div class="col-lg-3 col-md-6 mb-30">
                        <div class="banner-item">
                            <a href="#">
                                <img src="${image}" alt="img">
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <!-- End banner Area -->
        <!-- Start Product Style -->
        <section class="pb-50 pt-50">
            <div class="container">
                <div class="row">
                    <div class="product-tab-style product-tab-style-1">
                        <div class="row">
                            <div class="col-lg-6">
                                <h3 class="deal-title">Featured Products</h3>
                            </div>
                            <div class="col-lg-6">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <span class="nav-link active" id="popular1-tab" data-bs-toggle="tab" data-bs-target="#popular1" role="tab" aria-controls="popular1" aria-selected="true">Popular</span>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <span class="nav-link" id="bastsaller1-tab" data-bs-toggle="tab" data-bs-target="#bastsaller1" role="tab" aria-controls="bastsaller1" aria-selected="false">Best Seller</span>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <span class="nav-link" id="featured1-tab" data-bs-toggle="tab" data-bs-target="#featured1" role="tab" aria-controls="featured1" aria-selected="false">Featured</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-content product-tab-full" id="myTabContent">
                            <div class="tab-pane product-tab-item fade show active" id="popular1" role="tabpanel" aria-labelledby="popular1-tab">
                                <div class="product-tab-slider-full owl-carousel">
                                    <!-- Iterating through products -->
                                    <c:forEach var="product" items="${products}">
                                        <div class="product-single product-style-1">
                                            <div class="product-thumbnail" style="width: 100%; height: 400px; overflow: hidden;">
                                                <a href="product-details.html">
                                                    <img src="${product.img}" alt="${product.name}" style="width: 100%; height: 400px; object-fit: cover; display: block;">
                                                    <img src="${product.img}" alt="${product.name}" style="width: 100%; height: 400px; object-fit: cover; display: block;">
                                                </a>
                                            </div>
                                            <div class="product-content">
                                                <h4><a href="product-details.html">${product.name}</a></h4>
                                                <div class="pricing">
                                                    <span>$${product.price}</span>
                                                </div>
                                                <div class="product-content-btn">
                                                    <ul>
                                                        <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                        <li><a onclick="addToCart(${product.pid})" class="active">Add to Cart</a></li>
                                                        <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- Repeat for other tabs if necessary -->
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <section class="latest-product pt-70 pb-70">
            <div class="container">
                <!-- Section Title -->
                <div class="row">
                    <div class="col-12">
                        <div class="section-headding-1 mb-50">
                            <h2><span>Latest Products</span></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="latest-product-full owl-carousel">
                            <!-- Single -->
                            <c:forEach var="product2" items="${products2}">
                                <div class="product-single">
                                    <div class="product-thumbnail">
                                        <a href="product-details.html?pid=${product2.pid}">
                                            <img src="${product2.img}" alt="${product2.name}" style="width: 100%; height: auto; object-fit: cover;">
                                        </a>
                                        <div class="product-thumbnail-overly">
                                            <ul>
                                                <li><a onclick="addToCart(${product2.pid})"><i class="fas fa-shopping-cart"></i></a></li>
                                                <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                <li><a href="#"><i class="far fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <h4><a href="product-details.html?pid=${product2.pid}">${product2.name}</a></h4>
                                        <div class="pricing">
                                            <span>$${product2.price}</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>
        </section>


        <!-- End Our Latest Product -->

        <!-- Start Deal Product -->
        <!-- Start Deal Product -->

        <!-- Start Product Widget List Area -->

        <!-- End Product Widget List Area -->

        <!-- Start Latest Blog -->
        <section class="latest-blog pt-70 pb-40 section-border">
            <div class="container">
                <!-- Section Title -->
                <div class="row">
                    <div class="col-12">
                        <div class="section-headding-1 mb-50">
                            <h2><span>Latest Blogs</span></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="news" items="${latestNews}">
                        <div class="col-lg-4 col-md-6 mb-30">
                            <div class="blog-item">
                                <div class="thumnail">
                                    <a href="single.html"><img src="assets/img/blog/${news.nId}.jpg" alt="blog"></a>
                                </div>
                                <div class="content">
                                    <ul class="auth">
                                        <li><a href="#">by ${news.authorName}</a></li>
                                        <li><a href="#">${news.updateDate}</a></li>
                                        <li><a href="#">${news.categoryName}</a></li>
                                    </ul>
                                    <h2><a href="single.html">${news.title}</a></h2>
                                    <p>${news.body.substring(0, 100)}...</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- End Latest Blog -->

        <!-- Start Instagram Feed -->
        <!-- End Instagram Feed -->

        <!-- Start Footer Area -->
        <footer class="footer">
            <!-- Footer Top -->
            <div class="footer-top pt-50">
                <div class="container">
                    <div class="row">
                        <!-- Single -->
                        <div class="col-lg-3 col-md-6 mb-30">
                            <div class="footer-widgets-single">
                                <h2><img src="assets/img/logo3.jpg" alt="Shop Logo"></h2>
                                <p>Discover the latest trends in fashion and get inspired by our new styles. Shop our current collections now at the Online Store.</p>
                            </div>
                        </div>
                        <!-- Single -->
                        <div class="col-lg-3 col-md-6 mb-30">
                            <div class="footer-widgets-single">
                                <h3>My Account</h3>
                                <ul>
                                    <li><a href="#">Sign In</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">My Wishlist</a></li>
                                    <li><a href="#">Order History</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Single -->
                        <div class="col-lg-3 col-md-6 mb-30">
                            <div class="footer-widgets-single">
                                <h3>Shop</h3>
                                <ul>
                                    <li><a href="#">New Arrivals</a></li>
                                    <li><a href="#">Women</a></li>
                                    <li><a href="#">Men</a></li>
                                    <li><a href="#">Kids</a></li>
                                    <li><a href="#">Sale</a></li>
                                    <li><a href="#">Accessories</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Single -->
                        <div class="col-lg-3 col-md-6 mb-30">
                            <div class="footer-widgets-single">
                                <h3>Newsletter</h3>
                                <p>Subscribe to our newsletter to get the latest updates on new arrivals and exclusive offers.</p>
                                <form action="#">
                                    <input type="email" name="email" placeholder="Your Email">
                                    <button type="submit" class="button-1">Subscribe</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer Bottom -->
        </footer>

        <!-- End Footer Area -->



        <div class="scroll-area">
            <i class="fa fa-angle-up"></i>
        </div>


        <!-- Js File -->
        <script src="assets/js/modernizr.min.js"></script>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/jquery.nav.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/mixitup.min.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/script.js"></script>
        <script src="assets/js/mobile-menu.js"></script>
    </body>
</html>