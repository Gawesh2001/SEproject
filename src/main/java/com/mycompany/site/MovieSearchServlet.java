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

        
        String query = request.getParameter("query");
        if (query != null && !query.trim().isEmpty()) {
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT movieName, movieThumbnail, movieid, timeframe FROM addmovie WHERE movieName LIKE ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, "%" + query + "%");
                    try (ResultSet rs = pstmt.executeQuery()) {
                        StringBuilder suggestions = new StringBuilder();
                        while (rs.next()) {
                            String movieName = rs.getString("movieName");
                            String movieThumbnail = rs.getString("movieThumbnail"); 
                            String movieid = rs.getString("movieid"); 
                            String timeframe = rs.getString("timeframe"); 
                            
                            
                            suggestions.append("<li style='cursor: pointer;'>");
                            suggestions.append("<a href='Seats.jsp?movieid=").append(movieid)
                                       .append("&movieName=").append(movieName)
                                       .append("&movieThumbnail=").append(movieThumbnail)
                                       .append("&timeframe=").append(timeframe)
                                       .append("' style='text-decoration: none; display: flex; align-items: center;'>");
                            suggestions.append("<img src='").append(movieThumbnail)
                                       .append("' alt='").append(movieName)
                                       .append("' style='width: 85px; height: 100px; margin-right: 10px; object-fit: cover; border-radius: 5px; border: 2px solid #ff8800;'>");
                            suggestions.append(movieName);
                            suggestions.append("</a>");
                            suggestions.append("</li>");

                        }
                        
                        suggestions.append("<script>");
                        suggestions.append("document.addEventListener('click', function(event) {");
                        suggestions.append("    const searchInput = document.getElementById('movie-search');");
                        suggestions.append("    const suggestionsList = document.getElementById('suggestions-list');");
                        suggestions.append("    if (!searchInput.contains(event.target) && !suggestionsList.contains(event.target)) {");
                        suggestions.append("        suggestionsList.style.display = 'none';");
                        suggestions.append("    }");
                        suggestions.append("});");
                        suggestions.append("</script>");
                        
                        out.println(suggestions.toString());
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
