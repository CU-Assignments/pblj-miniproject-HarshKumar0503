package com.emptrack.controller;

import java.sql.*;
import java.util.*;

import org.eclipse.jdt.internal.compiler.batch.Main;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3307/emp_time_tracking"; // Update with your database details
    private static final String USER = "root"; // Database username
    private static final String PASSWORD = "root"; // Database password

    public static Connection getConnection() throws SQLException {
        try {
            // Load and register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        }
    }
    public static void main(String[] args) {
    	try {
			DBConnection.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
