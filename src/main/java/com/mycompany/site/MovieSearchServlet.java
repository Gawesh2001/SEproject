package com.mycompany.site;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet(urlPatterns = {"/movie-search"})
public class MovieSearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "2001";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        // Handle the search query to display suggestions from the database
        String query = request.getParameter("query");
        if (query != null && !query.trim().isEmpty()) {
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT movieName, movieThumbnail FROM addmovie WHERE movieName LIKE ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, "%" + query + "%");
                    try (ResultSet rs = pstmt.executeQuery()) {
                        StringBuilder suggestions = new StringBuilder();
                        while (rs.next()) {
                            String movieName = rs.getString("movieName");
                            String movieThumbnail = rs.getString("movieThumbnail");  // Column name is now movieThumbnail
                            suggestions.append("<li>");
                            suggestions.append("<img src='").append(movieThumbnail).append("' alt='").append(movieName).append("' style='width: 85px; height: 100px; margin-right: 10px; object-fit: cover; border-radius: 5px; border: 2px solid #ff8800;'>");
                            suggestions.append(movieName);
                            suggestions.append("</li>");
                        }
                        out.println(suggestions.toString());
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

//@WebServlet(urlPatterns = {"/movie-search"})
//public class MovieSearchServlet extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema";
//    private static final String DB_USER = "root";
//    private static final String DB_PASSWORD = "2001";
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html");
//        response.setCharacterEncoding("UTF-8");
//
//        PrintWriter out = response.getWriter();
//
//        // Search Bar and Suggestions Container HTML
//        out.println("<!DOCTYPE html>");
//        out.println("<html lang='en'>");
//        out.println("<head>");
//        out.println("<meta charset='UTF-8'>");
//        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
//        out.println("<title>Movie Search</title>");
//        out.println("<link rel=\"stylesheet\" href=\"/Site/DashBoard.css\">");
//        out.println("<style>");
//        out.println("#suggestions-list { list-style-type: none; padding: 0; margin: 0; border: 1px solid #ccc; max-height: 200px; overflow-y: auto; display: none; }");
//        out.println("#suggestions-list li { padding: 5px; cursor: pointer; }");
//        out.println("#suggestions-list li:hover { background-color: #f0f0f0; }");
//        out.println("</style>");
//        out.println("</head>");
//        out.println("<body>");
//
//        // Search Bar
//        out.println("<div class='search-bar'>");
//        out.println("<input type='text' id='movie-search' placeholder='Search' autocomplete='off'>");
//        out.println("<button class='search-btn'>Search</button>");
//        out.println("</div>");
//
//        // Suggestion List
//        out.println("<ul id='suggestions-list'></ul>");
//
//        // JavaScript for Search Functionality
//        out.println("<script>");
//        out.println("document.getElementById('movie-search').addEventListener('input', function() {");
//        out.println("    var query = this.value.trim();");
//        out.println("    if (query.length === 0) {");
//        out.println("        document.getElementById('suggestions-list').style.display = 'none';");
//        out.println("        return;");
//        out.println("    }");
//        out.println("    fetch('movie-search?query=' + encodeURIComponent(query))");
//        out.println("        .then(response => response.text())");
//        out.println("        .then(data => {");
//        out.println("            var suggestionsList = document.getElementById('suggestions-list');");
//        out.println("            suggestionsList.innerHTML = data;");
//        out.println("            suggestionsList.style.display = data.trim() !== '' ? 'block' : 'none';");
//        out.println("        })");
//        out.println("        .catch(error => console.error('Error:', error));");
//        out.println("});");
//        out.println("</script>");
//
//        // Handle the search query to display suggestions from the database
//        String query = request.getParameter("query");
//        if (query != null && !query.trim().isEmpty()) {
//            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
//                String sql = "SELECT movieName FROM addmovie WHERE movieName LIKE ?";
//                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
//                    pstmt.setString(1, "%" + query + "%");
//                    try (ResultSet rs = pstmt.executeQuery()) {
//                        StringBuilder suggestions = new StringBuilder();
//                        if (!rs.isBeforeFirst()) {
//                            suggestions.append("<li>No movies found</li>");
//                        } else {
//                            while (rs.next()) {
//                                String movieName = rs.getString("movieName");
//                                // Output safely encoded movie names to avoid XSS
//                                suggestions.append("<li>").append(escapeHtml(movieName)).append("</li>");
//                            }
//                        }
//                        out.println(suggestions.toString());
//                    }
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//
//        out.println("</body>");
//        out.println("</html>");
//    }
//
//    // Utility method to escape HTML entities to prevent XSS
//    private String escapeHtml(String input) {
//        if (input == null) {
//            return "";
//        }
//        return input.replace("&", "&amp;")
//                    .replace("<", "&lt;")
//                    .replace(">", "&gt;")
//                    .replace("\"", "&quot;")
//                    .replace("'", "&#39;");
//    }
//}
