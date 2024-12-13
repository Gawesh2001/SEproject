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
    private static final String SELECT_QUERY = "SELECT * FROM addmovie";

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
            out.println("<title>Hero Movies</title>");
            out.println("<link rel=\"stylesheet\" href=\"/Site/DashBoard.css\">");
            out.println("<script>");
            out.println("let movies = [];"); // JavaScript array to hold movie data

            // Add movies to JavaScript array
            while (rs.next()) {
                int movieId = rs.getInt("movieid");
                String movieName = rs.getString("movieName");
                String movieThumbnail = rs.getString("movieThumbnail");

                // Populate the JavaScript array
                out.println("movies.push({ id: " + movieId + ", name: '" + movieName + "', thumbnail: '" + movieThumbnail + "' });");
            }

            // JavaScript for rotating the hero movies
            out.println("let currentIndex = 0;");
            out.println("function displayMovie(index) {");
            out.println("    const movie = movies[index];");
            out.println("    if (!movie) return;");
            out.println("    const heroSection = document.querySelector('.hero');");
            out.println("    const movieTitle = document.getElementById('movie-title');");
            out.println("    const bookTicketBtn = document.getElementById('book-ticket');");
            out.println("    const seeDetailsBtn = document.getElementById('see-details');");
            out.println("    heroSection.style.backgroundImage = `url(${movie.thumbnail})`;");
            out.println("    movieTitle.textContent = movie.name;");
            out.println("    bookTicketBtn.href = `/book/${movie.id}`;");
            out.println("    seeDetailsBtn.href = `/details/${movie.id}`;");
            out.println("}");
            out.println("function rotateMovies() {");
            out.println("    displayMovie(currentIndex);");
            out.println("    currentIndex = (currentIndex + 1) % movies.length;");
            out.println("}");
            out.println("window.onload = function() {");
            out.println("    if (movies.length > 0) {");
            out.println("        rotateMovies();");
            out.println("        setInterval(rotateMovies, 5000);"); // Rotate every 5 seconds
            out.println("    }");
            out.println("};");
            out.println("</script>");
            out.println("</head>");
            out.println("<body>");

            // Hero section with placeholders for dynamic content
            out.println("<section class='hero'>");
            out.println("<div class='hero-content'>");
            out.println("<h1 id='movie-title'>Loading...</h1>");
            out.println("<div class='hero-buttons'>");
            out.println("<a id='book-ticket' href='#'><button class='primary-buttons'>Book Tickets</button></a>");
            out.println("<a id='see-details' href='#'><button class='secondary-buttons'>See Details</button></a>");
            out.println("</div>");
            out.println("</div>");
            out.println("<a href='#'>");
            out.println("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='currentColor' class='play-button'>");
            out.println("<path fill-rule='evenodd' d='M4.5 5.653c0-1.427 1.529-2.33 2.779-1.643l11.54 6.347c1.295.712 1.295 2.573 0 3.286L7.28 19.99c-1.25.687-2.779-.217-2.779-1.643V5.653Z' clip-rule='evenodd' />");
            out.println("</svg>");
            out.println("</a>");
            out.println("</section>");

            out.println("</body>");
            out.println("</html>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error: Unable to load movies. Please try again later.</p>");
        }
    }
}
