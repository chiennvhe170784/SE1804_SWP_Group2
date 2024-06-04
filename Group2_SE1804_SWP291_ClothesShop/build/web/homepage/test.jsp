<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Collapsible Vertical Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .wrapper {
            width: 200px;
            transition: width 0.3s;
        }
        .wrapper.collapsed {
            width: 50px;
        }
        .menu nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .menu nav ul li {
            position: relative;
        }
        .menu nav ul li a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #000;
            background: #f4f4f4;
            border-bottom: 1px solid #ccc;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            transition: padding 0.3s;
        }
        .wrapper.collapsed .menu nav ul li a {
            padding: 10px 10px 10px 20px;
        }
        .menu nav ul li a:hover {
            background: #ddd;
        }
        .menu nav ul li ul.submenu-item {
            display: none;
            list-style-type: none;
            padding: 0;
            margin: 0;
            position: absolute;
            left: 200px;
            top: 0;
            width: 200px;
        }
        .wrapper.collapsed .menu nav ul li ul.submenu-item {
            left: 50px;
        }
        .menu nav ul li:hover ul.submenu-item {
            display: block;
        }
        .menu nav ul li ul.submenu-item li a {
            background: #e9e9e9;
            border-bottom: 1px solid #ccc;
        }
        .toggle-button {
            display: block;
            padding: 10px;
            background: #ccc;
            text-align: center;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="wrapper" id="menuWrapper">
        <div class="toggle-button" onclick="toggleMenu()">?</div>
        <div class="menu">
            <nav>
                <ul>
                    <li><a href="admin">Home</a></li>
                    <li><a href="trending-product">Trending Product</a></li>
                    <li><a href="#">Product <i class="fa fa-angle-down"></i></a>
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
                    <li><a href="blog.html">Blog <i class="fa fa-angle-down"></i></a>
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

    <script>
        function toggleMenu() {
            var wrapper = document.getElementById('menuWrapper');
            wrapper.classList.toggle('collapsed');
        }
    </script>
</body>
</html>
