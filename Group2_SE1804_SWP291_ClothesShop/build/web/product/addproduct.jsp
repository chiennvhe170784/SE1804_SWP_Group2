<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Product</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Add New Product</h1>
        <form action="addproduct" method="post">
            <div class="form-group">
                <label for="name">Product Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" required>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="describe">Description</label>
                <textarea class="form-control" id="describe" name="describe" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="img">Image URL</label>
                <input type="text" class="form-control" id="img" name="img" required>
            </div>
            <div class="form-group">
                <label for="releaseDate">Release Date</label>
                <input type="date" class="form-control" id="releaseDate" name="releaseDate" required>
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <select class="form-control" id="category" name="category" required>
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.cid}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="brand">Brand</label>
                <select class="form-control" id="brand" name="brand" required>
                    <c:forEach var="brand" items="${brands}">
                        <option value="${brand.bid}">${brand.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select class="form-control" id="gender" name="gender" required>
                    <c:forEach var="gender" items="${genders}">
                        <option value="${gender.gid}">${gender.description}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="size">Size</label>
                <input type="text" class="form-control" id="size" name="size" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>
</body>
</html>
