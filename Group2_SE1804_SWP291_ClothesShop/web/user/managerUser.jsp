<%-- 
    Document   : managerUser
    Created on : Jun 16, 2024, 10:00:51 AM
    Author     : chien
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Clothes Shop Manager</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="adminassets/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Custom styles for this page -->
        <link href="adminassets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="../sidebar_admin.jsp" %>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline">
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                    <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Product List</h1>
                        <a href="addproduct" class="btn btn-success mb-3">New User</a>

                        <!-- Search and Filter Form -->
                        <form name="filterForm" action="listproduct" method="get" onsubmit="return validateForm()">
                            <div class="form-row">
                                <!-- Search by name -->
                                <div class="col-md-2 mb-3">
                                    <input type="text" name="search" placeholder="Search by name" value="${search}" class="form-control">
                                </div>

                                <!-- Categories Dropdown -->
                                <div class="col-md-2 mb-3">
                                    <select name="category" class="form-control">
                                        <option value="">All Categories</option>
                                        <c:forEach var="category" items="${categories}">
                                            <option value="${category.cid}" <c:if test="${category.cid == param.category}">selected</c:if>>${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- Brands Dropdown -->
                                <div class="col-md-2 mb-3">
                                    <select name="brand" class="form-control">
                                        <option value="">All Brands</option>
                                        <c:forEach var="brand" items="${brands}">
                                            <option value="${brand.bid}" <c:if test="${brand.bid == param.brand}">selected</c:if>>${brand.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- Genders Dropdown -->
                                <div class="col-md-2 mb-3">
                                    <select name="gender" class="form-control">
                                        <option value="">All Genders</option>
                                        <c:forEach var="gender" items="${genders}">
                                            <option value="${gender.gid}" <c:if test="${gender.gid == param.gender}">selected</c:if>>${gender.description}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- Price Range -->
                                <div class="col-md-1 mb-3">
                                    <input type="number" name="priceFrom" placeholder="Min Price" value="${priceFrom}" class="form-control">
                                </div>
                                <div class="col-md-1 mb-3">
                                    <input type="number" name="priceTo" placeholder="Max Price" value="${priceTo}" class="form-control">
                                </div>

                                <!-- Submit Button -->
                                <div class="col-md-2 mb-3">
                                    <button type="submit" class="btn btn-primary btn-block">Filter</button>
                                </div>
                            </div>
                        </form>

                        <!-- Product Table -->
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Username</th>
                                                <th>Role</th>
                                                <th>Active</th>
                                                <th>Ban</th>
                                                <th>UnBan</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.listU}" var="u">
                                                <tr>


                                                    <td>${u.uid}</td>
                                                    <td>${u.fullName}</td>
                                                    <td>${u.phone}</td>
                                                    <td>${u.email}</td>
                                                    <td>${u.username}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${u.rid == 1}">
                                                                admin
                                                            </c:when>
                                                            <c:when test="${u.rid == 2}">
                                                                staff
                                                            </c:when>
                                                            <c:otherwise>
                                                                user
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${u.active}</td>
                                                    <td><a href="#"><i class="bi bi-ban"></i></a></td>
                                                    <td><a href="#"><i class="bi bi-unlock"></i></a></td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Page navigation example" class="mt-4">
                            <ul class="pagination justify-content-center">
                                <c:if test="${pageIndex > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="listproduct?page=${pageIndex - 1}&search=${param.search}&category=${param.category}&brand=${param.brand}&gender=${param.gender}&priceFrom=${param.priceFrom}&priceTo=${param.priceTo}">Previous</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="page-item <c:if test='${i == pageIndex}'>active</c:if>'">
                                        <a class="page-link" href="listproduct?page=${i}&search=${param.search}&category=${param.category}&brand=${param.brand}&gender=${param.gender}&priceFrom=${param.priceFrom}&priceTo=${param.priceTo}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageIndex < totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="listproduct?page=${pageIndex + 1}&search=${param.search}&category=${param.category}&brand=${param.brand}&gender=${param.gender}&priceFrom=${param.priceFrom}&priceTo=${param.priceTo}">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->
            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="adminassets/js/sb-admin-2.min.js"></script>
        <!-- Page level plugins -->
        <script src="adminassets/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="adminassets/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Page level custom scripts -->
        <script src="adminassets/js/demo/datatables-demo.js"></script>
    </body>

</html>
