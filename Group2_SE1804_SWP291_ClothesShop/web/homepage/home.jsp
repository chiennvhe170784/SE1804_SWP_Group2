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
                                <a href="login"><i class="fas fa-user"></i> Login / Register</a>
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
        <!--offcanvas menu area end-->
        <!-- End Mobile Menu Area -->



        <!-- Start Hero Area -->
        <section class="hero-area">
            <div class="hero-area-full owl-carousel">
                <!-- Single -->
                <div class="hero-slider-single" style="background-image: url('assets/img/cw1_11zon.jpg');">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="hero-slider-single-content">
                                    <h2>Leading Hand Tools <span>Manufacturer</span></h2>
                                    <p>Ostromi Is A Specialist Of Hand Tools Which Are</p>
                                    <a class="button-1" href="shop.html">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single -->
                <div class="hero-slider-single" style="background-image: url('assets/img/es1_11zon.jpg');">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="hero-slider-single-content">
                                    <h2>Leading Hand Tools <span>Manufacturer</span></h2>
                                    <p>Ostromi Is A Specialist Of Hand Tools Which Are</p>
                                    <a class="button-1" href="shop.html">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero-slider-single" style="background-image: url('assets/img/mt1_11zon.jpg');">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="hero-slider-single-content">
                                    <h2>Leading Hand Tools <span>Manufacturer</span></h2>
                                    <p>Ostromi Is A Specialist Of Hand Tools Which Are</p>
                                    <a class="button-1" href="shop.html">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
        <div class="banner-area container">
            <div class="row">
                <!-- Single -->
                <div class="col-lg-4 col-md-6 mb-30">
                    <div class="banner-item">
                        <a href="#">
                            <img src="assets/img/pd1.jpg" alt="img">
                        </a>
                    </div>
                </div>
                <!-- Single -->
                <div class="col-lg-4 col-md-6 mb-30">
                    <div class="banner-item">
                        <a href="#">
                            <img src="assets/img/pd2.jpg" alt="img">
                        </a>
                    </div>
                </div>
                <!-- Single -->
                <div class="col-lg-4 col-md-6 mb-30">
                    <div class="banner-item">
                        <a href="#">
                            <img src="assets/img/pd3.jpg" alt="img">
                        </a>
                    </div>
                </div>
            </div>
        </div>
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
                                        <span class="nav-link" id="bastsaller1-tab" data-bs-toggle="tab" data-bs-target="#bastsaller1" role="tab" aria-controls="bastsaller1" aria-selected="false">Best Saller</span>
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

                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="sale-badge"><span>sale</span></div>
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="discount-badge"><span>50%</span></div>
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="discount-badge"><span>50%</span></div>
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="tab-pane product-tab-item fade" id="bastsaller1" role="tabpanel" aria-labelledby="bastsaller1-tab">
                                <div class="product-tab-slider-full owl-carousel">

                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="sale-badge"><span>sale</span></div>
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="discount-badge"><span>50%</span></div>
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Single -->
                                    <div class="product-single">
                                        <div class="sale-badge"><span>sale</span></div>
                                        <div class="product-thumbnail">
                                            <a href="product-details.html"><img src="assets/img/product/2.jpg" alt="product"></a>
                                            <div class="product-thumbnail-overly">
                                                <ul>
                                                    <li><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></li>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook 7" 128GB full HD</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane product-tab-item fade" id="featured1" role="tabpanel" aria-labelledby="featured1-tab">
                                <div class="product-tab-slider-full owl-carousel">

                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="sale-badge"><span>sale</span></div>
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single -->
                                    <div class="product-single product-style-1">
                                        <div class="discount-badge"><span>50%</span></div>
                                        <div class="product-thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="product">
                                                <img src="assets/img/product/5.jpg" alt="product">
                                            </a>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                            <div class="product-content-btn">
                                                <ul>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="active" href="cart.html">Add to Cart</a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Single -->
                                    <div class="product-single">
                                        <div class="sale-badge"><span>sale</span></div>
                                        <div class="product-thumbnail">
                                            <a href="product-details.html"><img src="assets/img/product/2.jpg" alt="product"></a>
                                            <div class="product-thumbnail-overly">
                                                <ul>
                                                    <li><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></li>
                                                    <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                                    <li><a href="#"><i class="far fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <h4><a href="product-details.html">Funda Para Ebook 7" 128GB full HD</a></h4>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
        <!-- End Product Style -->


        <!-- Start Sales Banner Area -->

        <!-- End Sales Banner Area -->

        <!-- Start Our Latest Product -->
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
                            <div class="product-single">
                                <div class="product-thumbnail">
                                    <a href="product-details.html"><img src="assets/img/product/8.jpg" alt="product"></a>
                                    <div class="product-thumbnail-overly">
                                        <ul>
                                            <li><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></li>
                                            <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                            <li><a href="#"><i class="far fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h4><a href="product-details.html">Funda Para Ebook 7" 128GB full HD</a></h4>
                                    <div class="pricing">
                                        <span>$200 <del>$210</del></span>
                                    </div>
                                </div>
                            </div>
                            <div class="product-single">
                                <div class="product-thumbnail">
                                    <a href="product-details.html"><img src="assets/img/product/1.jpg" alt="product"></a>
                                    <div class="product-thumbnail-overly">
                                        <ul>
                                            <li><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></li>
                                            <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                            <li><a href="#"><i class="far fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h4><a href="product-details.html">Funda Para Ebook 7" 128GB full HD</a></h4>
                                    <div class="pricing">
                                        <span>$200 <del>$210</del></span>
                                    </div>
                                </div>
                            </div>
                            <div class="product-single">
                                <div class="product-thumbnail">
                                    <a href="product-details.html"><img src="assets/img/product/3.jpg" alt="product"></a>
                                    <div class="product-thumbnail-overly">
                                        <ul>
                                            <li><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></li>
                                            <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                            <li><a href="#"><i class="far fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h4><a href="#">Funda Para Ebook 7" 128GB full HD</a></h4>
                                    <div class="pricing">
                                        <span>$200 <del>$210</del></span>
                                    </div>
                                </div>
                            </div>
                            <div class="product-single">
                                <div class="product-thumbnail">
                                    <a href="product-details.html"><img src="assets/img/product/4.jpg" alt="product"></a>
                                    <div class="product-thumbnail-overly">
                                        <ul>
                                            <li><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></li>
                                            <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                            <li><a href="#"><i class="far fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h4><a href="#">Funda Para Ebook 7" 128GB full HD</a></h4>
                                    <div class="pricing">
                                        <span>$200 <del>$210</del></span>
                                    </div>
                                </div>
                            </div>
                            <div class="product-single">
                                <div class="product-thumbnail">
                                    <a href="product-details.html"><img src="assets/img/product/5.jpg" alt="product"></a>
                                    <div class="product-thumbnail-overly">
                                        <ul>
                                            <li><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></li>
                                            <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                            <li><a href="#"><i class="far fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h4><a href="#">Funda Para Ebook 7" 128GB full HD</a></h4>
                                    <div class="pricing">
                                        <span>$200 <del>$210</del></span>
                                    </div>
                                </div>
                            </div>
                            <div class="product-single">
                                <div class="product-thumbnail">
                                    <a href="product-details.html"><img src="assets/img/product/6.jpg" alt="product"></a>
                                    <div class="product-thumbnail-overly">
                                        <ul>
                                            <li><a href="cart.html"><i class="fas fa-shopping-cart"></i></a></li>
                                            <li><a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                                            <li><a href="#"><i class="far fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h4><a href="#">Funda Para Ebook 7" 128GB full HD</a></h4>
                                    <div class="pricing">
                                        <span>$200 <del>$210</del></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Our Latest Product -->

        <!-- Start Deal Product -->
        <!-- Start Deal Product -->

        <!-- Start Product Widget List Area -->
        <section class="pt-50 pb-60">
            <div class="container">
                <div class="row">
                    <!-- Single -->
                    <div class="col-lg-3 col-md-6">
                        <h3 class="deal-title">Best Selling</h3>
                        <div class="product-widgets-single">
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/5.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/5.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Single -->
                    <div class="col-lg-3 col-md-6">
                        <h3 class="deal-title">Sale Products</h3>
                        <div class="product-widgets-single">
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/1.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/2.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/3.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/4.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Single -->
                    <div class="col-lg-3 col-md-6">
                        <h3 class="deal-title">Latest Products</h3>
                        <div class="product-widgets-single">
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/3.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/2.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/1.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single -->
                            <div class="p-widgets-single mb-20">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="thumbnail">
                                            <a href="product-details.html">
                                                <img src="assets/img/product/6.jpg" alt="img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-7 align-self-center">
                                        <div class="content">
                                            <h4><a href="product-details.html">Funda Para Ebook</a></h4>
                                            <div class="ratting">
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                                <span><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="pricing">
                                                <span>$200 <del>$210</del></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Single -->
                    <div class="col-lg-3 col-md-6">
                        <h3 class="deal-title">Weekly Discount</h3>
                        <div class="weekly-discount-full">
                            <!-- single -->
                            <div class="weekly-discount-single mb-30">
                                <a href="#"><img src="assets/img/diccount1.jpg" alt="img"></a>
                            </div>
                            <!-- single -->
                            <div class="weekly-discount-single">
                                <a href="#"><img src="assets/img/diccount2.jpg" alt="img"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product Widget List Area -->

        <!-- Start Latest Blog -->
        <section class="latest-blog pt-70 pb-40 section-border">
            <div class="container">
                <!-- Section Title -->
                <div class="row">
                    <div class="col-12">
                        <div class="section-headding-1 mb-50">
                            <h2><span>Latest News</span></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Single -->
                    <div class="col-lg-4 col-md-6 mb-30">
                        <div class="blog-item">
                            <div class="thumnail">
                                <a href="single.html"><img src="assets/img/blog/1.jpg" alt="blog"></a>
                            </div>
                            <div class="content">
                                <ul class="auth">
                                    <li><a href="#">by Admin</a></li>
                                    <li><a href="#">02 Comments</a></li>
                                    <li><a href="#">Fashion</a></li>
                                </ul>
                                <h2><a href="single.html">Slow cooker apple cinnamon oatmeal pot </a></h2>
                                <p> Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim veniamquis </p>
                            </div>
                        </div>
                    </div>
                    <!-- Single -->
                    <div class="col-lg-4 col-md-6 mb-30">
                        <div class="blog-item">
                            <div class="thumnail">
                                <a href="single.html"><img src="assets/img/blog/5.jpg" alt="blog"></a>
                            </div>
                            <div class="content">
                                <ul class="auth">
                                    <li><a href="#">by Admin</a></li>
                                    <li><a href="#">02 Comments</a></li>
                                    <li><a href="#">Fashion</a></li>
                                </ul>
                                <h2><a href="single.html">Slow cooker apple cinnamon oatmeal pot </a></h2>
                                <p> Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim veniamquis </p>
                            </div>
                        </div>
                    </div>
                    <!-- Single -->
                    <div class="col-lg-4 col-md-6 mb-30">
                        <div class="blog-item">
                            <div class="thumnail">
                                <a href="single.html"><img src="assets/img/blog/3.jpg" alt="blog"></a>
                            </div>
                            <div class="content">
                                <ul class="auth">
                                    <li><a href="#">by Admin</a></li>
                                    <li><a href="#">02 Comments</a></li>
                                    <li><a href="#">Fashion</a></li>
                                </ul>
                                <h2><a href="single.html">Slow cooker apple cinnamon oatmeal pot </a></h2>
                                <p> Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim veniamquis </p>
                            </div>
                        </div>
                    </div>
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