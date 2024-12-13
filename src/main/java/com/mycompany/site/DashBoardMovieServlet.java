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

@WebServlet(urlPatterns = {"/movie"})
public class DashBoardMovieServlet extends HttpServlet {

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

        // Get today's date in the format YYYY-MM-DD
        String today = java.time.LocalDate.now().toString();

        // Get the movie filter status ('nowShowing' or 'comingSoon') from the query parameters
        String status = request.getParameter("status");
        if (status == null) {
            status = "nowShowing"; // Default to 'nowShowing' if no status is provided
        }

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

            // JavaScript to handle movie filter and button style change (removed inline style modification)
            out.println("<script>");
            out.println("function filterMovies(status) {");
            out.println("    // Update URL to reflect selected filter");
            out.println("    window.location.href = 'movie?status=' + status;"); // Refresh page with the selected status
            out.println("}");
            out.println("</script>");
            out.println("</head>");
            out.println("<body>");

            // Movie section with existing buttons in JSP
            out.println("<section class='movies' id='movies'>");
            out.println("<div class='movies-top'>");
            out.println("<div class='movie-release-buttons'>");
            // Use the existing 'Now Showing' and 'Coming Soon' buttons with active class logic
            out.println("<button id='nowShowingBtn' class='nowShowingBtn " + (status.equals("nowShowing") ? "active" : "") + "' onclick='filterMovies(\"nowShowing\")'>Now Showing</button>");
            out.println("<button id='comingSoonBtn' class='comingSoonBtn " + (status.equals("comingSoon") ? "active" : "") + "' onclick='filterMovies(\"comingSoon\")'>Coming Soon</button>");
            out.println("</div>");
            out.println("<div class='filter-and-search'>");
            out.println("<div class='search-bar'>");
            out.println("<input type='text' id='movie-search' placeholder='Search' autocomplete='off'>");
            out.println("<button class='search-btn'>Search</button>");
            out.println("</div>");

            // Suggestions List
            out.println("<ul id='suggestions-list'></ul>");
            out.println("</div>");
            out.println("</div>");
            out.println("<hr>");

            // Movie list container
            out.println("<div class='movie-list' id='movieList'>");

            boolean hasMovies = false;
            while (rs.next()) {
                hasMovies = true;
                int movieId = rs.getInt("movieid");
                String movieName = rs.getString("movieName");
                String movieCategory = rs.getString("movieCategory");
                String releaseDate = rs.getString("releaseDate");
                String movieThumbnail = rs.getString("movieThumbnail");
                String timeframe = rs.getString("timeframe");

                // Determine if the movie is now showing or coming soon
                boolean isNowShowing = releaseDate.compareTo(today) <= 0;

                // Show movies based on the selected status
                if ((status.equals("nowShowing") && isNowShowing) || (status.equals("comingSoon") && !isNowShowing)) {
                    out.println("<div class='movie-card'>");

                    // Movie poster (background image)
                    out.println("<div class='poster' style='background-image: url(" + movieThumbnail + ")'></div>");

                    // Movie details (name, genre)
                    out.println("<div class='details'>");
                    
                    out.println("<h3 id='movieName'>" + movieName + "</h3>");
                    
                    out.println("<hr>");
                    out.println("<div class='time-genre'>");
                    out.println("<p id='movieGenre'>" + movieCategory + "</p>");
                    out.println("</div>");
                    out.println("</div>");

                    // Book Tickets button
                    
                    out.println("<a target='_blank'>");
out.println("<button class='primary-buttons' onclick='window.open(\"Seats.jsp?movieid=" + movieId + "&movieName=" + movieName + "&movieThumbnail=" + movieThumbnail + "&timeframe=" + timeframe + "\", \"_blank\")'>Book Tickets</button>");
out.println("</a>");


                    // Play button (SVG icon)
                    out.println("<a href='#'>");
                    out.println("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='currentColor' class='movie-play-button'>");
                    out.println("<path fill-rule='evenodd' d='M4.5 5.653c0-1.427 1.529-2.33 2.779-1.643l11.54 6.347c1.295.712 1.295 2.573 0 3.286L7.28 19.99c-1.25.687-2.779-.217-2.779-1.643V5.653Z' clip-rule='evenodd' />");
                    out.println("</svg>");
                    out.println("</a>");

                    out.println("</div>"); // Close movie card div
                }
            }

            // Check if no movies were found
            if (!hasMovies) {
                out.println("<p>No movies available at the moment.</p>");
            }

            out.println("</div>"); // Close movie-list div
            out.println("</section>"); // Close movies section

            out.println("</body>");
            out.println("</html>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error: Unable to load movies. Please try again later.</p>");
        }
    }
}
