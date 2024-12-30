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

    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema"; 
    private static final String DB_USER = "root";  
    private static final String DB_PASSWORD = "2001"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String feedback = request.getParameter("feedback");

        
        response.setContentType("text/html");

       
        PrintWriter out = response.getWriter();

       
        if (feedback == null || feedback.trim().isEmpty()) {
            out.println("<h3>Please provide your feedback before submitting.</h3>");
        } else {
        
            boolean result = insertFeedback(feedback);

            if (result) {
                out.println("<h3>Thank you for your feedback!</h3>");
            } else {
                out.println("<h3>Sorry, there was an error. Please try again later.</h3>");
            }
        }
    }

    
    private boolean insertFeedback(String feedback) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            
            String sql = "INSERT INTO feedback (feedback) VALUES (?)";

         
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, feedback); 

        
            int rowsAffected = stmt.executeUpdate();

           
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace(); 
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
