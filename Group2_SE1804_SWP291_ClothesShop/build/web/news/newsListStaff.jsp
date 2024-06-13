<%-- 
    Document   : newsListStaff
    Created on : 13/06/2024, 2:50:08 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

        <!-- Custom styles for this page -->
        <link href="adminassets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
     <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Clothes Shop Manager
                    </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="index.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">Interface</div>

                <!-- Nav Item - Tables -->
                <li class="nav-item active">
                    <a class="nav-link" href="listproduct">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Product Table</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
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
                   <div class="container" style="background-color:whitesmoke;height:auto;overflow: auto;">

    <div class="row">
        <div class="col-3">
                <h3 style="padding-left:40px; margin-top:20px;white-space: nowrap">Bài Đăng</h3>
        </div>
        <div class="col-9">
            <input id="createBlogbtn" type="button" class="btn btn-info" style="float:right;margin-top:20px" value="Tạo Bài Đăng" />


        </div>
    </div>
        
    <div class="row" style="margin-top:50px;margin-left:50px;margin-bottom:20px">
       
            <div class="col-3">            
                <button id="blogList" type="button" class="btn btn-link" style="height:20px;color:royalblue;width:160px;font-size:18px">News</button>

            </div>
            <div class="col-3">
                <button id="waitingList" type="button" class="btn btn-link" style="height:20px;color:royalblue;width:160px;font-size:18px">Waiting News</button>
            </div>
    </div>
    <div id="box" class="row" style="   min-width: 500px;max-width: 1060px;position: relative;margin-left:40px;border:solid;height:auto;background-color:white;min-height: 350px;border-radius: 7px;overflow: auto;">
    </div>
</div>

                        <!-- Pagination -->
                        <nav aria-label="Page navigation example" class="mt-4">
                            <ul class="pagination justify-content-center">
                           
                                <c:forEach begin="1" end = "${pages}" var = "i">
                                    <li> 
                                    <c:if test="${not empty param.search}">
                                        <a href="newsList?index=${i}&search=${param.search}">${i}</a>
                                    </c:if>
                                    <c:if test="${empty param.search}">
                                        <a href="newsList?index=${i}">${i}</a>
                                    </c:if>
                                    </li>
                                </c:forEach>
								
							
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
        <script src="../assets/js/jquery-3.5.1.min.js" type="text/javascript"></script>
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
