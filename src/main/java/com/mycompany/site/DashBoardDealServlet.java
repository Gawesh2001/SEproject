package com.mycompany.site;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/deals"})
public class DashBoardDealServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "2001";
    private static final String SELECT_QUERY = "SELECT * FROM deal";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection and execute query
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement pstmt = conn.prepareStatement(SELECT_QUERY);
                 ResultSet rs = pstmt.executeQuery()) {
                
                // Start the response HTML
                out.println("<!DOCTYPE html>");
                out.println("<html lang='en'>");
                out.println("<head>");
                out.println("<meta charset='UTF-8'>");
                out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
                out.println("<title>View Movies</title>");
                out.println("<link rel=\"stylesheet\" href=\"/Site/DashBoard.css\">");
                out.println("<script>");
                
                out.println("</script>");
                out.println("</head>");
                out.println("<body>");

                // Start HTML output
                
                out.println("<h2>Deals and Advertisements</h2>");
                out.println("<div class=\"slider-container\">");

                // Navigation buttons
                out.println("<button id=\"prev-deal\" class=\"nav-button\">");
                out.println("<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"icon\" viewBox=\"0 0 24 24\">");
                out.println("<path d=\"M15.41 16.59L10.83 12l4.58-4.59L14 6l-6 6 6 6z\" />");
                out.println("</svg>");
                out.println("</button>");

                // Deals wrapper
                out.println("<div class=\"deals-wrapper\">");
                out.println("<div class=\"deals-container\">");

                // Dynamically generate deals/ads
                while (rs.next()) {
                    String dealTitle = rs.getString("dealTitle"); // Replace with DB column names
                    String dealImage = rs.getString("dealImage");
                    String dealLink = rs.getString("dealLink");

                    out.println("<div class=\"deal-item\">");
                    out.println("<a href=\"" + dealLink + "\" target=\"_blank\">");
                    out.println("<img src=\"" + dealImage + "\" alt=\"" + dealTitle + "\" class=\"deal-image\">");
                    out.println("</a>");
                    out.println("<h2 class=\"deal-title\">" + dealTitle + "</h2>");
                    out.println("</div>");
                }

                out.println("</div>"); // End deals-container
                out.println("</div>"); // End deals-wrapper

                // Navigation button (next)
                out.println("<button id=\"next-deal\" class=\"nav-button\">");
                out.println("<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"icon\" viewBox=\"0 0 24 24\">");
                out.println("<path d=\"M8.59 16.59L13.17 12l-4.58-4.59L10 6l6 6-6 6z\" />");
                out.println("</svg>");
                out.println("</button>");

                out.println("</div>"); // End slider-container
                
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<section><p>Error loading deals and advertisements. Please try again later.</p></section>");
        }
    }
}
