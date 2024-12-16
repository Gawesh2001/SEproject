/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.site;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class FeedbackServlet extends HttpServlet {

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema"; // Adjust if necessary
    private static final String DB_USER = "root";  // Change to your MySQL username
    private static final String DB_PASSWORD = "2001";  // Change to your MySQL password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get feedback from the form
        String feedback = request.getParameter("feedback");

        // Set content type for the response
        response.setContentType("text/html");

        // Use PrintWriter to send response
        PrintWriter out = response.getWriter();

        // If feedback is empty, show a message
        if (feedback == null || feedback.trim().isEmpty()) {
            out.println("<h3>Please provide your feedback before submitting.</h3>");
        } else {
            // Call method to insert feedback into the database
            boolean result = insertFeedback(feedback);

            if (result) {
                out.println("<h3>Thank you for your feedback!</h3>");
            } else {
                out.println("<h3>Sorry, there was an error. Please try again later.</h3>");
            }
        }
    }

    // Method to insert feedback into the database
    private boolean insertFeedback(String feedback) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert feedback into the feedbacktable
            String sql = "INSERT INTO feedback (feedback) VALUES (?)";

            // Create a PreparedStatement to execute the query
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, feedback); // Set the feedback parameter

            // Execute the update
            int rowsAffected = stmt.executeUpdate();

            // If the update was successful, return true
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Print error details (for debugging)
            return false;
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
