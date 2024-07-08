<%@ page import="model.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  class="no-js" lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clothes Shop - Search Results</title>
        <link rel="icon" href="assets/img/icon.png" type="image/gif" sizes="16x16">
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
        <div class="off_canvars_overlay"></div>
        <!-- Header -->
        <header class="header">
            <%@include file="header.jsp" %>
            <!-- Header Bottom -->
            <div class="header-bottm">
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
                                        <span class="counter-cart"><small>Your Cart</small>$10.00</span>
                                        <div class="minicart-content-wrapper">
                                            <ul class="cart-list-full">
                                                <li class="cart-list-single">
                                                    <img src="assets/img/product/1.jpg" alt="img">
                                                    <h5><a href="#">simple product</a></h5>
                                                    <span class="price">$120</span>
                                                    <div class="close"><i class="fas fa-times"></i></div>
                                                </li>
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
                                        <li><a href="/clothesShop/Home">Home</a></li>
                                        <li><a href="/clothesShop/AllProduct">Shop <i class="fa fa-angle-down"></i></a>
                                            <ul class="submenu-item">
                                                <li><a href="/clothesShop/AllProduct">All Products</a></li>
                                                <li><a href="gender-products?gender=men">Men</a></li>
                                                <li><a href="gender-products?gender=women">Women</a></li>
                                                <li><a href="gender-products?gender=other">Other</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Collections</a>
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
                            <li><a href="/clothesShop/Home">Home</a></li>
                            <li class="menu-item-has-children">
                                <a href="/clothesShop/AllProduct">Shop</a>
                                <ul class="submenu-item">
                                    <li><a href="/clothesShop/AllProduct">All Products</a></li>
                                    <li><a href="gender-products?gender=men">Men</a></li>
                                    <li><a href="gender-products?gender=women">Women</a></li>
                                    <li><a href="gender-products?gender=other">Other</a></li>
                                </ul>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="#">Collections</a>
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
                                    <select class="form-select" id="sortSelect" aria-label="Default select example" onchange="changeSort()">
                                        <option value="name" ${sortBy == 'name' ? 'selected' : ''}>Sort by Name</option>
                                        <option value="price" ${sortBy == 'price' ? 'selected' : ''}>Sort by Price</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <script>
                            function changeSort() {
                                var sortBy = document.getElementById('sortSelect').value;
                                window.location.href = 'searchresult?sortBy=' + sortBy + '&searchKeyword=${searchKeyword}&categoryId=${categoryId}';
                            }
                        </script>
                        <!-- Shop -->
                        <div class="row">
                            <!-- Product Single -->
                            <c:forEach var="product" items="${products}">
                                <div class="col-lg-4 col-md-4 col-sm-6 mb-30">
                                    <div class="product-single">
                                        <div class="product-img">
                                            <img src="${product.image}" alt="Product Image">
                                            <div class="product-img-overlay">
                                                <a href="product?productId=${product.id}">View Details</a>
                                            </div>
                                        </div>
                                        <div class="product-info">
                                            <h4>${product.name}</h4>
                                            <p>${product.price}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- End Product Single -->
                        </div>
                        <!-- End Shop -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Area -->

        <!-- Footer -->
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

        <!-- Footer -->

        <!-- Javascript -->
        <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
        <script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
        <script src="assets/js/vendor/popper.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>
        <script src="assets/js/vendor/owl.carousel.min.js"></script>
        <script src="assets/js/vendor/slick.min.js"></script>
        <script src="assets/js/vendor/jquery.counterup.min.js"></script>
        <script src="assets/js/vendor/jquery.countdown.js"></script>
        <script src="assets/js/vendor/waypoints.min.js"></script>
        <script src="assets/js/vendor/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
