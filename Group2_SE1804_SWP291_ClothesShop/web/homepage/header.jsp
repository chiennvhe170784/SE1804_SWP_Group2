<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .dropdown-menu {
                position: absolute;
                right: 0;
                display: none;
                background-color: white;
                border: 1px solid #ccc;
                padding: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
            }

            .dropdown-menu a {
                display: block;
                padding: 5px 10px;
                color: black;
                text-decoration: none;
            }

            .dropdown-menu a:hover {
                background-color: #f0f0f0;
            }
        </style>
    </head>
    <body>
        <!-- Header Middle -->
        <div class="header-middle" style="padding-top: 30px; padding-bottom: 30px;">
            <div class="container">
                <div class="row" style="display: flex; align-items: center;">
                    <!-- Logo -->
                    <div class="col-lg-2">
                        <div class="logo">
                            <h2 style="margin: 0;"><a href="index.html"><img src="assets/img/logo3.jpg" alt="Logo"></a></h2>
                        </div>
                    </div>
                    <!-- Search Bar -->
                    <div class="col-lg-6" style="margin-top: 10px;">
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
                                    <span class="counter-cart" style="margin-left: 10px;"><small>Your Cart</small></span>
                                    <span class="counter" style="margin-left: 10px;">0</span>
                                    <!-- Mini Cart Content -->
                                  
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- User Icon and Name -->
                    <!--                <div class="col-lg-1 text-right">
                    <c:if test="${sessionScope.user != null}">
                        <span style="line-height: 30px;">hello</span>
                    </c:if>
                

                </div>-->
                    <div class="col-lg-1 text-center" style="margin-left: 100px">
                        <c:if test="${sessionScope.user != null}" >
                            <div style="position: relative; display: inline-block;">

                                <!--                                <i class="fas fa-user" id="userIcon" style="font-size: 30px; color: black; cursor: pointer;"></i>-->
                                <span class="logo" style="margin-left: 20px"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuzZt1REzKbmypTgYKn0rAvtrwEIPnK6Kfnw&s" id="userIcon" style="border-radius: 50%; height: 50px; width: 50px;"></span>

                                <span class="dropdown-menu" id="dropdownMenu">
                                    <a href="#"><i class="fas fa-user"></i>&nbsp;&nbsp;Show profile</a>
                                    <a href="#"><i class="fas fa-cog"></i>&nbsp;&nbsp;Setting</a>
                                    <a href="logOut"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;Logout</a>

                                </span>
                                <span style="line-height: 30px; display: block; color: #04414d; white-space: nowrap ">${sessionScope.user.fullName}</span>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.user == null}">
                            <a href="login" style="display: block;">
                                <i class="fas fa-user" style="font-size: 30px; color: #ccc; cursor: pointer"></i>
                                <span style="line-height: 30px; display: block; color: #04414d  ">Login/register</span>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.getElementById('userIcon').addEventListener('click', function () {
                var dropdown = document.getElementById('dropdownMenu');
                if (dropdown.style.display === 'none' || dropdown.style.display === '') {
                    dropdown.style.display = 'block';
                } else {
                    dropdown.style.display = 'none';
                }
            });

            // Close the dropdown if clicked outside
            document.addEventListener('click', function (event) {
                var isClickInside = document.getElementById('userIcon').contains(event.target);
                if (!isClickInside) {
                    document.getElementById('dropdownMenu').style.display = 'none';
                }
            });
        </script>
    </body>
</html>
