<%-- 
    Document   : login
    Created on : Jun 10, 2024, 12:44:39 AM
    Author     : chien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  class="no-js" lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> Login</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/style.css">

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


        <!-- Start Login Register Form -->
        <div class="login-register-form pt-160 pb-60" style="justify-content: center; align-items:center ">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 offset-lg-4 text-center">
                        <div class="login-register-form-full">
                            <h3 style="margin-bottom: 35px"><img src="assets/img/logo.png"></h3>
 <form action="login" method="POST">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Your Email"
                                pattern="[a-zA-Z0-9._%+-]+@gmail\.com" required
                                oninput="checkEmailValidity()">
                            <div id="email-error" class="error"></div>
                            <input type="password" class="form-control" name="pass" placeholder="Your Password"
                                required>
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox"
                                            style="transform: scale(0.75);" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">Remember
                                            me</label>
                                    </div>
                                </div>
                                <div class="col-6 text-right">
                                    <a href="reset-password.html">Forgot password?</a>
                                </div>
                            </div>
                            <button class="button-1" type="submit">Log In</button>
                        </form>
                            <p>Don't Have an Account? Please <a href="register.html">Sign up now</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Login Register Form -->





        <!-- Js File -->

        <script src="assets/js/jquery-3.5.1.min.js"></script>

        <script src="assets/js/script.js"></script>
   <script>
        function checkEmailValidity() {
            const input = document.getElementById("email");
            const email = input.value.trim();

            if (email === "") {
                input.setCustomValidity("Please input your email!");
            } else if (!email.endsWith("@gmail.com")) {
                input.setCustomValidity("Please enter an email ending with @gmail.com");
            } else {
                input.setCustomValidity("");
            }
        }
    </script>
    </body>
</html>