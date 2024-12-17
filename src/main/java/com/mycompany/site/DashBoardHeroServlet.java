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
    private static final String SELECT_QUERY = "SELECT * FROM addmovie WHERE timeframe IS NOT NULL";

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

            // Start the HTML response
            out.println("<!DOCTYPE html>");
            out.println("<html lang='en'>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<title>Hero Movies</title>");
            out.println("<link rel='stylesheet' href='/Site/DashBoard.css'>");
            out.println("</head>");
            out.println("<body>");

            // JavaScript Array for Movie Data
            out.println("<script>");
            out.println("let movies = [];");
            while (rs.next()) {
                int movieId = rs.getInt("movieid");
                String movieName = rs.getString("movieName");
                String movieThumbnail = rs.getString("movieThumbnail");
                String trailerLink = rs.getString("youtube");

                out.println("movies.push({ id: " + movieId + ", name: '" + movieName + "', thumbnail: '" 
                            + movieThumbnail + "', trailerLink: '" + trailerLink + "' });");
            }

            // JavaScript Logic for Movie Rotation
            out.println("let currentIndex = 0;");
            out.println("function displayMovie(index) {");
            out.println("    const movie = movies[index];");
            out.println("    if (!movie) return;");
            out.println("    document.querySelector('.hero').style.backgroundImage = `url(${movie.thumbnail})`;");
            out.println("    document.getElementById('movie-title').textContent = movie.name;");
            out.println("    document.getElementById('play-button').href = movie.trailerLink;");
            out.println("}");
            out.println("function nextMovie() {");
            out.println("    currentIndex = (currentIndex + 1) % movies.length;");
            out.println("    displayMovie(currentIndex);");
            out.println("}");
            out.println("function prevMovie() {");
            out.println("    currentIndex = (currentIndex - 1 + movies.length) % movies.length;");
            out.println("    displayMovie(currentIndex);");
            out.println("}");
            out.println("window.onload = function() {");
            out.println("    if (movies.length > 0) {");
            out.println("        displayMovie(currentIndex);");
            out.println("        setInterval(nextMovie, 3000);");
            out.println("    } else {");
            out.println("        console.log('No movies available.');");
            out.println("    }");
            out.println("};");
            out.println("</script>");

            // Hero Section HTML
            out.println("<section class='hero' style='background-size: cover; background-position: center;'>");
            out.println("    <div class='hero-change-buttons'>");

            // Prev Movie Button with SVG
            out.println("        <button onclick='prevMovie()' class='hero-icon'>");
            out.println("            <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='currentColor'>");
            out.println("                <path fill-rule='evenodd' d='M7.72 12.53a.75.75 0 0 1 0-1.06l7.5-7.5a.75.75 0 1 1 1.06 1.06L9.31 12l6.97 6.97a.75.75 0 1 1-1.06 1.06l-7.5-7.5Z' clip-rule='evenodd' />");
            out.println("            </svg>");
            out.println("        </button>");

            // Next Movie Button with SVG
            out.println("        <button onclick='nextMovie()' class='hero-icon'>");
            out.println("            <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='currentColor'>");
            out.println("                <path fill-rule='evenodd' d='M16.28 11.47a.75.75 0 0 1 0 1.06l-7.5 7.5a.75.75 0 0 1-1.06-1.06L14.69 12 7.72 5.03a.75.75 0 0 1 1.06-1.06l7.5 7.5Z' clip-rule='evenodd' />");
            out.println("            </svg>");
            out.println("        </button>");

            out.println("    </div>");
            out.println("    <div class='hero-content'>");
            out.println("        <h1 id='movie-title'>Loading...</h1>");
            out.println("    </div>");

            // Play Button with SVG
            out.println("    <a id='play-button' href='#' target='_blank'>");
            out.println("        <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='currentColor' class='play-button'>");
            out.println("            <path fill-rule='evenodd' d='M4.5 5.653c0-1.427 1.529-2.33 2.779-1.643l11.54 6.347c1.295.712 1.295 2.573 0 3.286L7.28 19.99c-1.25.687-2.779-.217-2.779-1.643V5.653Z' clip-rule='evenodd' />");
            out.println("        </svg>");
            out.println("    </a>");
            out.println("</section>");

            out.println("</body>");
            out.println("</html>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error: Unable to load movies. Please try again later.</p>");
        }
    }
}
