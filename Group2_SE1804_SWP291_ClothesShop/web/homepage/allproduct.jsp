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
        <title>BulkShop - Electronics Shop HTML Template | Shop</title>
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

    </head>
    <body>
        <div id="preloader" class="preeloader">
            <div class="sk-circle">
                <div class="sk-circle1 sk-child"></div>
                <div class="sk-circle2 sk-child"></div>
                <div class="sk-circle3 sk-child"></div>
                <div class="sk-circle4 sk-child"></div>
                <div class="sk-circle5 sk-child"></div>
                <div class="sk-circle6 sk-child"></div>
                <div class="sk-circle7 sk-child"></div>
                <div class="sk-circle8 sk-child"></div>
                <div class="sk-circle9 sk-child"></div>
                <div class="sk-circle10 sk-child"></div>
                <div class="sk-circle11 sk-child"></div>
                <div class="sk-circle12 sk-child"></div>
            </div>
        </div>
        <div class="off_canvars_overlay"></div>
        <!-- Header -->
        <header class="header">
            <!-- Header Top -->
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="top-text">
                                <p>Welcome to Clothes Shop</p>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="top-list">
                                <a href="#"><i class="fas fa-mobile-alt"></i> +02456 054546</a>
                                <a href="wishlist.html"><i class="far fa-heart"></i> Wishlist</a>
                                <a href="login.html"><i class="fas fa-user"></i> Login / Register</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Middle -->
            <div class="header-middle" style="padding-top: 30px; padding-bottom: 30px;">
                <div class="container">
                    <div class="row" style="display: flex; align-items: center;">
                        <!-- Logo -->
                        <div class="col-lg-2">
                            <div class="logo">
                                <h2 style="margin: 0;"><a href="index.html"><img src="assets/img/logo3.jpg"></a></h2>
                            </div>
                        </div>
                        <!-- Search Bar -->
                        <div class="col-lg-7" style="margin-top: 10px;">
                            <div class="header-search-form">
                                <form action="#" style="display: flex; align-items: center;">
                                    <select class="form-select" style="height: 40px;">
                                        <option selected>All Categories</option>
                                        <c:forEach var="category" items="${categories}">
                                            <option value="${category.cid}">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="search" name="search" placeholder="Search keyword here..." style="height: 40px;">
                                    <button type="submit" style="height: 40px;"><i class="fas fa-search"></i></button>
                                </form>
                            </div>
                        </div>
                        <!-- MiniCart -->
                        <div class="col-lg-2">
                            <div class="desktop-mini-cart">
                                <div class="mini-cart">
                                    <div class="mini-cart-icon" style="display: flex; align-items: center;">
                                        <i class="fas fa-shopping-cart"></i>
                                        <span class="counter" style="margin-left: 10px;">02</span>
                                        <span class="counter-cart" style="margin-left: 10px;"><small>Your Cart</small>$10.00</span>
                                        <!-- Mini Cart Content -->
                                        <div class="minicart-content-wrapper">
                                            <ul class="cart-list-full">
                                                <!-- Single -->
                                                <li class="cart-list-single">
                                                    <img src="assets/img/product/1.jpg" alt="img">
                                                    <h5><a href="#">simple product</a></h5>
                                                    <span class="price">$120</span>
                                                    <div class="close"><i class="fas fa-times"></i></div>
                                                </li>
                                                <!-- Single -->
                                                <li class="cart-list-single">
                                                    <img src="assets/img/product/2.jpg" alt="img">
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
                        </div>
                        <div class="col-lg-1"></div> <!-- Added an empty column to adjust alignment -->
                    </div>
                </div>
            </div>

            <!-- Header Bottom -->
            <div class="header-bottm">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="logo-2">
                                <h2><a href="index.html"><img src="assets/img/logo.png"></a></h2>
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
                                                    <img src="assets/img/product/1.jpg" alt="img">
                                                    <h5><a href="#">simple product</a></h5>
                                                    <span class="price">$120</span>
                                                    <div class="close"><i class="fas fa-times"></i></div>
                                                </li>
                                                <!-- Single -->
                                                <li class="cart-list-single">
                                                    <img src="assets/img/product/2.jpg" alt="img">
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
                                        <li><a href="/Home">Home</a></li>
                                        <li><a href="shop.html">Shop <i class="fa fa-angle-down"></i></a>
                                            <ul class="submenu-item">
                                                <li><a href="shop.html">All Products</a></li>
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

        <!-- Start Shop Area -->
        <section class="shop-area pt-70 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Shop Top Pagination -->
                        <div class="row section-bg pt-20 pb-20 mb-30">
                            <div class="col-lg-5 col-md-6 order-1 order-md-2">
                                <div class="top-bar-right">
                                    <select class="form-select" aria-label="Default select example">
                                        <option selected>Sort by popularity</option>
                                        <option value="1">Sort by Name</option>
                                        <option value="2">Sort by Price</option>
                                        <option value="3">Sort by Ratting</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!-- Shop -->
                        <div class="row">
                            <!-- Product Single -->
                            <c:forEach var="product" items="${products}">
                            <div class="col-lg-4 col-md-4 col-sm-6 mb-30">
                                <div class="product-single">
                                    <div class="product-thumbnail">
                                        <a href="product-details.html">
                                            <img src="${product.img}" alt="${product.name}" style="width: 100%; height: 350px; object-fit: cover;">
                                        <div class="product-thumbnail-overly">
                                            <ul>
                                                <li><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></li>
                                                <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                <li><a href="#"><i class="far fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <h4><a href="product-details.html">${product.name}</a></h4>
                                        <div class="pricing">
                                            <span>$${product.price}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        <!-- Pagination -->
                        <div class="row">
                            <div class="col-12 mb-30">
                                <div class="page-pagination text-center">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><span>3</span></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Siderbar -->
                    <div class="col-lg-4">
                        <!-- Single -->
                        <div class="sidebar-widgets">
                            <h4 class="title">Search</h4>
                            <form action="#">
                                <input type="search" name="search" placeholder="Search Here..">
                                <button type="submit"><i class="fas fa-search"></i></button>
                            </form>
                        </div>
                        <!-- Single -->
                        <div class="sidebar-widgets">
                            <h4 class="title">Latest Products</h4>
                            <div class="widgets-latest-product-full">
                                <!-- Single -->
                                <div class="widgets-latest-product-single mb-30">
                                    <div class="thumbanil">
                                        <a href="#">
                                            <img src="assets/img/product/1.jpg" alt="Products">
                                        </a>
                                    </div>
                                    <div class="content">
                                        <h4><a href="#">Homasy Portable</a></h4>
                                        <div class="pricing">
                                            <span>$200</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Single -->
                        <div class="sidebar-widgets">
                            <h4 class="title">Recent Post</h4>
                            <ul>
                                <li><a href="#">Gallery Post with Supported Animation</a></li>
                                <li><a href="#">Announcement – Standard Post without Image</a></li>
                                <li><a href="#">We’re the best Designers from UK</a></li>
                                <li><a href="#">A Beautiful Day – Standard Post with Image</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Area -->



        <!-- Start Footer Area -->
        <footer class="footer">
            <!-- Footer Top -->
            <div class="footer-top pt-50">
                <div class="container">
                    <div class="row">
                        <!-- SIngle -->
                        <div class="col-lg-3 col-md-6 mb-30">
                            <div class="footer-widgets-single">
                                <h2><img src="assets/img/white-logo.png"></h2>
                                <p> Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim veniamquis </p>
                            </div>
                        </div>
                        <!-- SIngle -->
                        <div class="col-lg-3 col-md-6 mb-30">
                            <div class="footer-widgets-single">
                                <h3>My account</h3>
                                <ul>
                                    <li><a href="#">Sign In</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">My Wishlist</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li><a href="#">Contact us</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- SIngle -->
                        <div class="col-lg-3 col-md-6 mb-30">
                            <div class="footer-widgets-single">
                                <h3>Categories</h3>
                                <ul>
                                    <li><a href="#">Home Audio & Theater</a></li>
                                    <li><a href="#">TV & Video</a></li>
                                    <li><a href="#">Camera, Photo & Video</a></li>
                                    <li><a href="#">Cell Phones & Accessories</a></li>
                                    <li><a href="#">Headphones</a></li>
                                    <li><a href="#">Video Games</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- SIngle -->
                        <div class="col-lg-3 col-md-6 mb-30">
                            <div class="footer-widgets-single">
                                <h3>Newsletter</h3>
                                <p> Get notified of new products, limited releases, and more. </p>
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
            <div class="footer-bottom pt-30 pb-30">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="copyright-text">
                                <p> &copy; Copyright 2021 <a href="https://codepopular.com" target="_blank">CodePopular</a> All Rights Reserved. </p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ul class="footer_payment">
                                <li><a href="#"><img src="assets/img/visa.png" alt="visa"></a></li>
                                <li><a href="#"><img src="assets/img/discover.png" alt="discover"></a></li>
                                <li><a href="#"><img src="assets/img/master_card.png" alt="master_card"></a></li>
                                <li><a href="#"><img src="assets/img/paypal.png" alt="paypal"></a></li>
                                <li><a href="#"><img src="assets/img/amarican_express.png" alt="amarican_express"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
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