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

@WebServlet(urlPatterns = {"/hero"})
public class DashBoardHeroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "2001";
    private static final String SELECT_QUERY = "SELECT * FROM addmovie LIMIT 1"; // Only fetch one movie

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(SELECT_QUERY);
             ResultSet rs = pstmt.executeQuery()) {

            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Start the response HTML
            out.println("<!DOCTYPE html>");
            out.println("<html lang='en'>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<title>View Movies</title>");
            out.println("<link rel=\"stylesheet\" href=\"/Site/DashBoard.css\">");
            out.println("</head>");
            out.println("<body>");
            
            out.println("<script src='/Site/js/hero.js'></script>");


            // Movie section (only one movie will be shown)
            if (rs.next()) {
                int movieId = rs.getInt("movieid"); // Ensure this matches your database column name
                String movieName = rs.getString("movieName");
                String movieCategory = rs.getString("movieCategory");
                String releaseDate = rs.getString("releaseDate");
                String movieThumbnail = rs.getString("movieThumbnail");

                out.println("<section class='hero' style='background-image: url(" + movieThumbnail + ");'>");

                out.println("<div class='hero-change-buttons'>");
                out.println("<button id='prev-movie'>");
                out.println("<svg xmlns='http://www.w3.org/2000/svg' height='48' viewBox='0 96 960 960' width='48' class='hero-icon'>");
                out.println("<path d='M560 816 320 576l240-240 42 42-198 198 198 198-42 42Z' />");
                out.println("</svg>");
                out.println("</button>");
                out.println("<button id='next-movie'>");
                out.println("<svg xmlns='http://www.w3.org/2000/svg' height='48' viewBox='0 96 960 960' width='48' class='hero-icon'>");
                out.println("<path d='M400 816l240-240-240-240-42 42 198 198-198 198 42 42Z'/>");
                out.println("</svg>");
                out.println("</button>");
                out.println("</div>");

                out.println("<div class='hero-content' style='backg'>");
                out.println("<h1 id='movie-title'>" + movieName + "</h1>");
                out.println("<div class='hero-buttons'>");
                out.println("<a href='#'>");
                out.println("<button id='book-ticket' class='primary-buttons'>Book Tickets</button>");
                out.println("</a>");
                out.println("<a href='#'>");
                out.println("<button id='see-details' class='secondary-buttons'>See Details</button>");
                out.println("</a>");
                out.println("</div>");
                out.println("</div>");

                out.println("<a href='#'>");
                out.println("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='currentColor' class='play-button'>");
                out.println("<path fill-rule='evenodd' d='M4.5 5.653c0-1.427 1.529-2.33 2.779-1.643l11.54 6.347c1.295.712 1.295 2.573 0 3.286L7.28 19.99c-1.25.687-2.779-.217-2.779-1.643V5.653Z' clip-rule='evenodd' />");
                out.println("</svg>");
                out.println("</a>");

                out.println("</div>");
                out.println("</section>");


            } else {
                out.println("<p>No movie available at the moment.</p>");
            }

            out.println("</body>");
            out.println("</html>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error: Unable to load movies. Please try again later.</p>");
        }
    }
}
