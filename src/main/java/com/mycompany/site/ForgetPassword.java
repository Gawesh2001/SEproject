/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.site;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotPasswordServlet")
public class ForgetPassword extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema";
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "2001"; // Replace with your DB password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user inputs
        String email = request.getParameter("email");
        String newPassword = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Check if the email exists in the database
            String checkEmailSql = "SELECT * FROM cususers WHERE email = ?";
            PreparedStatement pstmt = conn.prepareStatement(checkEmailSql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Email exists, update the password
                String updatePasswordSql = "UPDATE cususers SET password = ? WHERE email = ?";
                PreparedStatement updatePstmt = conn.prepareStatement(updatePasswordSql);
                updatePstmt.setString(1, newPassword);
                updatePstmt.setString(2, email);
                int rowsUpdated = updatePstmt.executeUpdate();

                if (rowsUpdated > 0) {
                    // Password updated successfully
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Password changed successfully!');");
                    out.println("location='LoginPage.jsp';"); // Redirect to login page
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Error updating password. Please try again.');");
                    out.println("location='ForgetPassword.jsp';");
                    out.println("</script>");
                }
            } else {
                // Email doesn't exist
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Entered email is incorrect!');");
                out.println("location='ForgetPassword.jsp';"); // Stay on the forget password page
                out.println("</script>");
            }

            // Close resources
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('An error occurred while processing your request.');");
            out.println("location='ForgetPassword.jsp';");
            out.println("</script>");
        }
    }
}
