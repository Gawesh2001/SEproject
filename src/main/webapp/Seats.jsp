<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Seat Booking</title>
    <link rel="stylesheet" href="SeatCss.css">
</head>
<body>
    <%
        // Get query parameters from URL
        String movieId = request.getParameter("movieid");
        String movieName = request.getParameter("movieName");
        String movieThumbnail = request.getParameter("movieThumbnail");
        String timeframe = request.getParameter("timeframe");
    %>

    <div class="movie-info">
        
        <div class="movie-details">
            <h2><%= movieName %></h2>
            <p>Timeframe: <input type="text" value="<%= timeframe %>" readonly></p>
             <div class="date-picker">
            <span for="date">Select Date:</span>
            <input type="date" id="date" name="selectedDate" required>
        </div>
        </div>
    </div>
    <img src="<%= movieThumbnail %>" alt="Movie Thumbnail" class="movie-thumbnail">
    <form id="bookingForm" action="BookSeatServlet" method="POST">
        <input type="hidden" name="movieId" value="<%= movieId %>">
        <input type="hidden" name="movieName" value="<%= movieName %>">
        <input type="hidden" name="timeFrame" value="<%= timeframe %>">

       
       

        <div class="seating-area">
            <!-- Generate 49 seats -->
            <% for (int i = 1; i <= 40; i++) { %>
                <input type="checkbox" id="seat<%= i %>" name="selectedSeats" value="S<%= i %>" class="seat">
                <label for="seat<%= i %>">S<%= i %></label>
            <% } %>
        </div>
        
        <div class="info">
            <span for="totalPrice" >Total Price:</span>
            <input type="text" id="totalPrice" name="totalPrice" readonly>
        </div>

        <button type="submit">Book Seats</button>
    </form>

    <script src="SeatsJS.js"></script>
</body>
</html>
