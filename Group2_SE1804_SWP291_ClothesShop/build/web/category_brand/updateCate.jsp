<%-- 
    Document   : updateCate
    Created on : May 26, 2024, 9:07:13 PM
    Author     : chien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/user-style/edit-style.css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark"
                 style="background-color: tomato">
                <div class="navbar-brand"> Online Shopping System </div>

                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/listCate"
                           class="nav-link">Category</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <form action="updateCate" method="post"  >
                        <fieldset class="form-group">
                            <div> <label>Category ID</label></div>  
                            <input readonly="" name="cid" value="${cate.cid}"/>
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Category Name</label> 
                            <input type="text" value="${cate.name}" class="form-control"
                                   name="category_name"  id="name" required >
                        </fieldset>

                        <div class="text-right">

                            <button type="submit" value="Update" onclick="myFunction()" class="btn btn-success">Save</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <script>
            function myFunction() {
                const inpObj = document.getElementById("name");

                inpObj.setCustomValidity("");

                const valueLength = inpObj.value.length;

                if (valueLength < 1) {
                    inpObj.setCustomValidity("Text is too short. Please enter between 1 and 50 characters.");
                } else if (valueLength > 50) {
                    inpObj.setCustomValidity("Text is too long. Please enter between 1 and 50 characters.");
                }

            }
        </script>
    </body>
</html>
