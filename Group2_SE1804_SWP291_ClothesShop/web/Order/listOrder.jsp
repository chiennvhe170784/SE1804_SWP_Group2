<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
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
        <!-- Navigation Menu -->
        <div class="header-middle pt-30 pb-30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav>
                            <ul>
                                <li><a href="admin">Home</a></li>
                                <li><a href="orderlist">Orders</a></li>
                                <li><a href="productlist">Products</a></li>
                                <li><a href="userlist">Users</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div style="padding-top: 100px">
        <div class="title text-center">
            <div class="container">
                <h1>Order List</h1>
                <br>
                <div style="margin-left: 100px; margin-right: 100px">
                    <table class="table table-striped table-bordered table-title" cellspacing="0" rules="all" border="1" id="gvLO" style="border-collapse:collapse;">
                        <thead>
                            <tr>
                                <th scope="col">Order ID</th>
                                <th scope="col">Customer Name</th>
                                <th scope="col">Order Date</th>
                                <th scope="col">Total Amount</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.orderList}" var="order">
                                <tr>
                                    <td>${order.orderId}</td>
                                    <td>${order.customerName}</td>
                                    <td>${order.orderDate}</td>
                                    <td>${order.totalAmount}</td>
                                    <td>${order.status}</td>
                                    <td>
                                        <a href="deleteOrder?orderId=${order.orderId}" onclick="return confirm('Are you sure you want to delete this order?')"><button class="btn btn-danger btn-sm rounded-0" type="button"><i class="fa fa-trash"></i></button></a>
                                        <a href="updateOrder?orderId=${order.orderId}"><button class="btn btn-success btn-sm rounded-0" type="button"><i class="fa fa-edit"></i></button></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-12 mb-30">
                    <div class="page-pagination text-center">
                        <ul>
                            <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                <li>
                                    <c:choose>
                                        <c:when test="${empty param.searchOrder}">
                                            <a href="orderlist?index=${i}">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="searchOrder?index=${i}&searchOrder=${param.searchOrder}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-top pt-50">
            <div class="container">
                <div class="row">
                    <!-- Footer Content -->
                    <div class="col-lg-12">
                        <p>&copy; 2021 Electronics Shop. All Rights Reserved.</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="assets/js/jquery-3.5.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>