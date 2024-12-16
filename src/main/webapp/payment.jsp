<%-- 
    Document   : payment
    Created on : Dec 16, 2024, 11:46:55 AM
    Author     : Akmal Ifthikar
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing Page</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- External CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/paymentcss.css">
</head>
<body>
    <div class="payment-container">
        <h1>Billing Details</h1>
        <form id="billing-form" class="billing-form" method="post" action="https://www.paypal.com/ncp/payment/694HTD3U9PWGU">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Chris Thomas" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="070 123 2345" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="you@example.com" required>
            </div>
            <div class="form-group">
                <label for="address">Billing Address</label>
                <input type="text" id="address" name="address" placeholder="123 Main St, City, Country" required>
            </div>
            <form action="https://www.paypal.com/ncp/payment/694HTD3U9PWGU" method="post" target="_top" style="display:inline-grid;justify-items:center;align-content:start;gap:0.5rem;">
                <input class="buybtn" type="submit" value="Checkout" />
                <center>
                    <img src="https://www.paypalobjects.com/images/Debit_Credit.svg" alt="cards" />
                    <section>Powered by 
                        <img src="https://www.paypalobjects.com/paypal-ui/logos/svg/paypal-wordmark-color.svg" alt="paypal" style="height: 0.875rem; vertical-align: middle;" />
                    </section>
                </center>
            </form>
        </form>
    </div>
</body>
</html>


