

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="LoginPageCSS.css">
    </head>
    <body>
    <div class="login-container">
        <div class="login-form">
            <h1>Login</h1>
            <form id="loginForm" action="loginServlet" method="GET">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="login-btn">Login</button>
                <div class="extra-options">
                    <p>Don't have an account? <a href="CreateAccount.jsp">Sign Up</a></p>
                    <p><a href="ForgetPassword.jsp">Forgot Password?</a></p>
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>
