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
            out.println("<script>");
            out.println("function confirmDelete(movieId) {");
            out.println("    if (confirm('Are you sure you want to delete this movie?')) {");
            out.println("        const form = document.getElementById('deleteForm-' + movieId);");
            out.println("        form.submit();");
            out.println("    }");
            out.println("}");
            out.println("</script>");
            out.println("</head>");
            out.println("<body>");
          
            out.println("<div class='movies-container'>");

            boolean hasMovies = false;
            while (rs.next()) {
                hasMovies = true;
                int movieId = rs.getInt("movieid"); // Ensure this matches your database column name
                String movieName = rs.getString("movieName");
                String movieCategory = rs.getString("movieCategory");
                String releaseDate = rs.getString("releaseDate");
                String movieThumbnail = rs.getString("movieThumbnail");
                String timeframe = rs.getString("timeframe");
                

                out.println("<div class='movie-card'>");

                out.println("<div class='poster' style='background-image: url(" + movieThumbnail + ")'></div>");

                out.println("<div class='details'>");
                out.println("<a href=''>");
                out.println("<h3 id='movieName'>" + movieName + "</h3>");
                out.println("</a>");
                out.println("<hr>");
                out.println("<div class='time-genre'>");
//                out.println("<p id='movieDuration'>" + movieDuration + "</p>");
                out.println("<p id='movieGenre'>" + movieCategory + "</p>");
                out.println("</div>");
                out.println("</div>");

                out.println("<a href=''>");
                //out.println("<button class='primary-buttons' onclick='window.location.href='Seats.jsp?movieid=" + movieId + "&movieName=" + movieName + "&movieThumbnail=" + movieThumbnail + "&timeframe=" + timeframe + "\"'>Book Tickets</button>");
               out.println("<button class='primary-buttons' onclick=\"window.location.href='Seats.jsp?movieid=" + movieId + "&movieName=" + movieName + "&movieThumbnail=" + movieThumbnail + "&timeframe=" + timeframe + "'\">Book Tickets</button>");

                //out.println("<button type='button' class='action-button' onclick='window.location.href=\"Seats.jsp?movieid=" + movieId + "&movieName=" + movieName + "&movieThumbnail=" + movieThumbnail + "&timeframe=" + timeframe + "\"'>Buy Ticket</button>");
                out.println("</a>");

                out.println("<a href=''>");
                out.println("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='currentColor' class='movie-play-button'>");
                out.println("<path fill-rule='evenodd' d='M4.5 5.653c0-1.427 1.529-2.33 2.779-1.643l11.54 6.347c1.295.712 1.295 2.573 0 3.286L7.28 19.99c-1.25.687-2.779-.217-2.779-1.643V5.653Z' clip-rule='evenodd' />");
                out.println("</svg>");
                out.println("</a>");

                out.println("</div>");

            }

            if (!hasMovies) {
                out.println("<p>No movies available at the moment.</p>");
            }

            out.println("</div>"); // Close movies-container
            out.println("</body>");
            out.println("</html>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<p>Error: Unable to load movies. Please try again later.</p>");
        }
    }
}
