<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Booking</title>
        <link rel="stylesheet" href="SeatCss.css">
        <link rel="stylesheet" href="DashBoard.css">
        <link rel="stylesheet" href="cancelCSS.css">
       
        <style>
            
   .cancel {
    height: 600px;
    margin-top: 140px;
    
}
.cancel-btn {
    background: #ff8800;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.cancel-btn:hover {
    background: #d94444;
}
.popup {
    display: none;
    position: fixed;
    top: 100px;
    left: 20%;
    width: 60%;
    height: 60%;
    background: rgba(0, 0, 0, 0.6);
   z-index: 1000;

}
.blurred{
    filter:blur(5px);
    pointer-events: none;
}

.popup-content {
    background: white;
    padding: 30px;
    border-radius: 20px;
    box-shadow:  4px 8px rgba(0, 0, 0, 0.2);
    text-align: left;
    height: 100%;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}
.popup-content button {
    margin: 10px;
    padding: 15px 40px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
      background: #ff4c4c;
    color: white;
  font-weight: bold;
    align-content: right;
    float: right;
}
.popup-content button:hover {
    background: #d94444;

.popup-content button:first-of-type {
    
    align-items: right;
    float: right;
}

.popup-content button:last-of-type {
  
   
}
p span{
    font-weight:700;
}
</style>
</head>
<body>
    <header>
        <div class="logo">
            <a href="DashBoard.jsp">
                <img src="assets/logo.png" alt="Site Logo" width="100" height="auto">
            </a>
        </div>
        <nav class="nav">
            <a href="DashBoard.jsp">Home</a>
            <a href="#movies">Movies</a>
            <a href="#deals-advertisements">Deals and Advertise</a>
            <a href="#">Contacts</a>
            <a href="#">About Us</a>
            <div class="dropdown">
                <a href="#" class="support">
                    Support
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="icon">
                        <path fill-rule="evenodd" d="M12.53 16.28a.75.75 0 0 1-1.06 0l-7.5-7.5a.75.75 0 0 1 1.06-1.06L12 14.69l6.97-6.97a.75.75 0 1 1 1.06 1.06l-7.5 7.5Z" clip-rule="evenodd" />
                    </svg>
                </a>
                <div class="dropdown-menu">
                    <a href="#feedback">Feedback</a>
                    <a href="cancelBooking.jsp">Next</a>
                </div>
            </div>
        </nav>
        <div class="actions">
            <div class="search-bar">
                <input type="text" id="movie-search" placeholder="Search" autocomplete="off">
                <button class="search-btn">Search</button>
            </div>
            <ul id="suggestions-list"></ul>

            <!-- Dynamic Login/Profile Section -->
            <%
                HttpSession existingSession = request.getSession(false); // Do not create a session if none exists
                String username = null;
                if (existingSession != null) {
                    username = (String) existingSession.getAttribute("username");
                }
            %>
            <% if (username == null) { %>
                <!-- User is not logged in -->
                <a href="LoginPage.jsp">
                    <button class="login-btn">Login</button>
                </a>
            <% } else { %>
                <!-- User is logged in -->
                <div class="dropdown">
                    <button class="profile-btn">
                        <%= username %> <!-- Display username -->
                    </button>
                    <div class="dropdown-menu">
                        <a href="LogoutServlet">Logout</a>
                    </div>
                </div>
            <% } %>
        </div>
    </header>



 
    <%
        // Get query parameters from URL
        String movieId = request.getParameter("movieid");
        String movieName = request.getParameter("movieName");
        String movieThumbnail = request.getParameter("movieThumbnail");
        String timeframe = request.getParameter("timeframe");
    %>

   

    <!-- Movie Thumbnail -->
  
    <div class="cancel" style="text-align: center;">
         <h1>Cancel Booking</h1>
    <form  action="CancelBookingServlet" method="POST">
     

        
         <!-- Email and Phone Number -->
       <div class="user-info" style="text-align: center; margin-top: 20px;">
           <spane for="bookingId" style="display: block; margin-bottom: 2px;">Booking ID:</spane>
         <input type="text" id="bookingId" name="bookingId" required style="display: block; margin: 0 auto; padding: 5px; width: 50%;"><br><br>

         <spane for="email" style="display: block; margin-bottom: 2px;">Email:</spane>
         <input type="email" id="email" name="email" required style="display: block; margin: 0 auto; padding: 5px; width: 50%;"><br><br>

         <spane for="phoneNumber" style="display: block; margin-bottom: 2px;">Phone Number:</spane>
        <input type="text" id="phoneNumber" name="phoneNumber" required style="display: block; margin: 0 auto; padding: 5px; width: 50%;">
       </div>
         <button  class="cancel-btn" onclick="confirmCancel()">Cancel</button>
        <p><a href="DashBoard.jsp">Home</a></p>
    
         
        <div id="popup" class="popup">
          <div class="popup-content">
            <h2> Terms and Conditions</h2>
           <p>1. Booking must be canceled<span>at least 3 days</span>before scheduled show date to receive a refund.
            <br>2. There is<span>no cancellation fee;</span>you will receive the full amount of your booking if canceled within the required time.
            <br>3. Refunds will be processed with<span>7-10 business days</span>after the cancellation request is submitted.
            <br>4. Tickets purchased for special events, premieres, or promotional offers are non- refundable.<br>
            5. Refunds will be provided to the<span>original payment method</span>used during the booking.</p>

            <label><input type="checkbox" id="agree-checkbox"></label>
                <p>I agree to the terms and conditions</p>
             
             <br>
            <div class="cell action">
                <button type="submit" class="next-btn">Next</button>   
            </div>
            
          </div>
        </div>
    </form>

        
</div>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    
    <script src="https://cdn.jsdelivr.net/npm/flatpickr">
           
           document.body.classList.add('blurred'); // Apply blur effect to body
            document.getElementById('popup').style.display = 'block';
        }

        function closePopup() {
            // Close pop-up
            document.getElementById('popup').style.display = 'none';
 
  
}

       
    </script>
   
</body>
</html>
