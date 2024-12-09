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

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema";
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "2001"; // Replace with your DB password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user inputs
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL query
            String sql = "SELECT * FROM cususers WHERE email = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Valid user: redirect to Dashboard
                response.sendRedirect("DashBoard.jsp");
            } else {
                // Invalid credentials: show an alert and stay on the login page
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid email or password!');");
                out.println("location='LoginPage.jsp';"); // Redirect back to login page
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
            out.println("location='LoginPage.jsp';");
            out.println("</script>");
        }
    }
}

