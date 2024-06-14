<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>BulkShop - Electronics Shop HTML Template | Register</title>
        <link rel="icon" href="assets/img/icon.png" type="image/gif" sizes="16x16">
        <link rel="icon" href="assets/img/icon.png" type="image/gif" sizes="18x18">
        <link rel="icon" href="assets/img/icon.png" type="image/gif" sizes="20x20">

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

        <!--offcanvas menu area end-->
        <!-- End Mobile Menu Area -->
        <!-- Start BreadCrumb Area -->
        <div class="breadcrumb-area pt-50 pb-50" style="background-image: url('assets/img/breadcrumb.jpg');">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-content">
                            <h2>Reset Password</h2>
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li class="active">Reset Password</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End BreadCrumb Area -->

        <!-- Start Login Register Form -->
        <div class="login-register-form pt-70 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3">
                        <div class="login-register-form-full">
                            <form id="resetForm" action="resetPass" method="POST">
                                <div class="form-control-range" style="display: flex; align-items: center;">
                                    <input type="email" class="form-control" id="inputEmail" pattern="[a-zA-Z0-9._%+-]+@gmail\.com" required
                                           oninput="checkEmailValidity()" name="email" placeholder="Enter your email" style="flex: 8; height: 40px;">
                                    <button type="button"  id="getCodeBtn" onclick="sendEmail()" style="border-radius: 10px ;background-color: #ff9933 ;flex: 2;height: 40px; display: flex; align-items: center; justify-content: center; margin-bottom: 20px;">Get Code</button>
                                </div>
                                <p style="color: #0061f2; display: none;" id="pleaseCheckEmail">Please check your email and enter the code!</p>
                                <!--<p style="color: red; display: none;" id="invalidEmail">Invalid email address. Please use a @gmail.com address.</p>-->



                                <input type="text" class="form-control" name="code" id="code" placeholder="Enter Code">
                                <input type="password" class="form-control" name="pass" id="pass" placeholder="Enter new password">
                                <input type="password" class="form-control" name="repass" id="repass" placeholder="Confirm password">
                                <button class="button-1" id="resetBtn" type="submit">Reset Now</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Login Register Form -->

        <div class="scroll-area">
            <i class="fa fa-angle-up"></i>
        </div>

        <!-- Js File -->
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/script.js"></script>
        <script>
                                        function checkEmailValidity() {
                                            var emailInput = document.getElementById('inputEmail');
                                            var invalidEmailMessage = document.getElementById('invalidEmail');
                                            var emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

                                            if (emailPattern.test(emailInput.value)) {
                                                invalidEmailMessage.style.display = 'none';
                                            } else {
                                                invalidEmailMessage.style.display = 'block';
                                            }
                                        }

                                        function sendEmail() {
                                            var emailInput = document.getElementById('inputEmail');
                                            var email = emailInput.value;
                                            var emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

                                            if (email && emailPattern.test(email)) {
                                                var confirmed = confirm('Are you sure you want to send the code to the email: ' + email + '?');
                                                if (confirmed) {
                                                    var resetPassLink = 'resetPass?email=' + encodeURIComponent(email);
                                                    document.getElementById('pleaseCheckEmail').style.display = 'block';

//                                                    // Redirect to the reset password link
//                                                    window.location.href = resetPassLink;
                                                }
                                            } else {
                                                document.getElementById('invalidEmail').style.display = 'block';
                                                alert('Please enter a valid email address.');
                                            }
                                        }

        </script>
    </body>
</html>
