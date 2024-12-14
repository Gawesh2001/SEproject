/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.site;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Arrays;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookSeatServlet")
public class SeatsServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abccinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "2001";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String movieName = request.getParameter("movieName");
        String movieId = request.getParameter("movieId");
        String timeFrame = request.getParameter("timeFrame");
        String[] selectedSeats = request.getParameterValues("selectedSeats");
        String totalPrice = request.getParameter("totalPrice");

        if (selectedSeats == null || selectedSeats.length == 0) {
            response.getWriter().write("<script>alert('No seats selected. Please try again.'); window.history.back();</script>");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO ticketbookings (movie_name, movie_id, timeframe, selected_date, selected_seats, total_price) VALUES (?, ?, ?, CURDATE(), ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            BigDecimal pricePerSeat = new BigDecimal(totalPrice).divide(new BigDecimal(selectedSeats.length), 2, BigDecimal.ROUND_HALF_UP);

            for (String seat : selectedSeats) {
                statement.setString(1, movieName);
                statement.setString(2, movieId);
                statement.setString(3, timeFrame);
                statement.setString(4, seat);
                statement.setBigDecimal(5, pricePerSeat);
                statement.addBatch();
            }

            int[] rowsInserted = statement.executeBatch();
            if (rowsInserted.length > 0) {
                response.getWriter().write("<script>alert('Booking successful for " + rowsInserted.length + " seats!'); window.location.href='Seats.jsp';</script>");
            } else {
                response.getWriter().write("<script>alert('Booking failed. Please try again.'); window.history.back();</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("<script>alert('An error occurred: " + e.getMessage() + "'); window.history.back();</script>");
        }
    }
}
