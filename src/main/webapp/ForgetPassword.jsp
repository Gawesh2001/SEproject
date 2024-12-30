

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change The Password</title>
        <link rel="stylesheet" href="ForgetPasswordCss.css">
    </head>
    <body>
        
        <div class="forgot-password-container">
        <div class="forgot-password-form">
            <h1>Forgot Password</h1>
            <form id="forgotPasswordForm" action="forgotPasswordServlet" method="POST">
                <div class="form-group">
                    <label for="email">Enter your Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your registered email" required>
                </div>
                 <div class="form-group">
                    <label for="password">Enter The New Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter The New Password" required>
                </div>
                <button type="submit" class="change-btn">Change Password</button>
            </form>
        </div>
    </div>
    </body>
</html>
