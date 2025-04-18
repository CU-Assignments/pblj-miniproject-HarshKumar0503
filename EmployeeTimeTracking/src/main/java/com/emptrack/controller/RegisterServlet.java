package com.emptrack.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");  // Role can be 'admin' or 'employee'

        try (Connection con = DBConnection.getConnection()) {
            // Check if the username already exists
            String checkQuery = "SELECT * FROM users WHERE username=?";
            PreparedStatement checkStmt = con.prepareStatement(checkQuery);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Username already exists, redirect to registration page with an error message
                response.sendRedirect("register.jsp?error=username_taken");
            } else {
                // Insert new user into the database with role
                String insertQuery = "INSERT INTO users(name, username, password, role) VALUES (?, ?, ?, ?)";
                PreparedStatement insertStmt = con.prepareStatement(insertQuery);
                insertStmt.setString(1, name);
                insertStmt.setString(2, username);
                insertStmt.setString(3, password);
                insertStmt.setString(4, role);  // Setting the role for the user

                int rowsAffected = insertStmt.executeUpdate();
                if (rowsAffected > 0) {
                    // Successfully registered, redirect to login page
                    response.sendRedirect("login.jsp");
                } else {
                    // If insert fails, show an error message
                    response.sendRedirect("register.jsp?error=registration_failed");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // In case of any error, redirect to register page with a generic error message
            response.sendRedirect("register.jsp?error=server_error");
        }
    }
}
