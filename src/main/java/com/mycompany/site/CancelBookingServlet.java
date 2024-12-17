package com.mycompany.site;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "CancelBookingServlet", urlPatterns = {"/CancelBookingServlet"})
public class CancelBookingServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "2001";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        
        

        // Validate inputs
        if (bookingId == null || bookingId.isEmpty() ) {
            response.getWriter().write("<script>alert('Please fill all required fields.'); window.history.back();</script>");
            return;
        }


        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
    // SQL query to delete booking details matching bookingId, email, and phone number (optional)
    String sql = "DELETE FROM ticketbookings WHERE booking_id = ?";
    
    // You can choose to include email and phone number if needed for more specific deletion
    if (email != null && phoneNumber != null) {
        sql = "DELETE FROM ticketbookings WHERE booking_id = ? AND u_email = ? AND u_no = ?";
    }
    
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        // Set parameters for the DELETE query
        statement.setString(1, bookingId);  // Setting booking_id
        
        // If email and phone number are used for more specific matching
        if (email != null && phoneNumber != null) {
            statement.setString(2, email);  // Set email if used
            statement.setString(3, phoneNumber);  // Set phone number if used
        }
            
              
        // Execute the delete operation
        int rowsAffected = statement.executeUpdate();
        

        
        // Provide feedback to the user based on the operation result
        if (rowsAffected > 0) {
            // If rows were deleted, send a success response
            response.getWriter().write("<script>alert('Booking canceled successfully! Confirmation mail sent to " + email + "'); window.location.href='DashBoard.jsp';</script>");
        } else {
            // If no matching booking was found, show a failure message
            response.getWriter().write("<script>alert('No matching booking found to cancel for Ticket ID: " + bookingId + "'); window.history.back();</script>");
        }
    }
    catch(Exception e) {
                String s = "<script>alert(\"" + e.getMessage() + "\"); window.history.back();</script>";
                response.getWriter().write(s);
//            response.getWriter().write("<script>alert('An error occurred: " + e.getMessage() + "'); window.history.back();</script>");
    }
} catch (Exception e) {
//    e.printStackTrace();
    // In case of an error, display the exception message
            response.getWriter().write("<script>alert('Here.'); window.history.back();</script>");
    response.getWriter().write("<script>alert('An error occurred: " + e.getMessage() + "'); window.history.back();</script>");
    return;
}

    }
}