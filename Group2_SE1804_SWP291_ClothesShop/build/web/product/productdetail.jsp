<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Detail</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Product Detail</h1>
        <div class="card">
            <div class="card-header">
                <h2>${product.name}</h2>
            </div>
            <div class="card-body">
                <p><strong>ID:</strong> ${product.pid}</p>
                <p><strong>Quantity:</strong> ${product.quantity}</p>
                <p><strong>Price:</strong> $${product.price}</p>
                <p><strong>Category:</strong> ${product.category.name}</p>
                <p><strong>Brand:</strong> ${product.brand.name}</p>
                <p><strong>Gender:</strong> ${product.gender.description}</p>
                <p><strong>Size:</strong> ${product.size}</p>
                <p><strong>Release Date:</strong> ${product.releaseDate}</p>
                <p><strong>Description:</strong> ${product.describe}</p>
                <img src="${product.img}" alt="${product.name}" class="img-fluid">
            </div>
        </div>
        <a href="listproduct" class="btn btn-primary mt-4">Back to Products</a>
    </div>
</body>
</html>
