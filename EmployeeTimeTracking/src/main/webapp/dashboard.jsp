<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #c9d6ff, #e2e2e2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 600px;
            animation: fadeIn 1s ease-in-out;
            max-height: 90vh;
            overflow-y: auto;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #666;
            margin-bottom: 30px;
        }

        form {
            margin: 15px 0;
        }

        button {
            background: #4a90e2;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: #357ABD;
            transform: scale(1.05);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f0f0f0;
            color: #333;
        }

        td {
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %> 👋</h1>
        <p>This is your personal dashboard.</p>

        <!-- Time Entry Buttons -->
        <form method="post" action="TimeEntryServlet">
            <input type="hidden" name="action" value="checkin">
            <button type="submit">✅ Check In</button>
        </form>
        <form method="post" action="TimeEntryServlet">
            <input type="hidden" name="action" value="checkout">
            <button type="submit">⏰ Check Out</button>
        </form>

        <!-- Display Time Logs -->
        <h2>🕒 Your Time Logs</h2>
        <table>
            <tr>
                <th>Action</th>
                <th>Timestamp</th>
            </tr>
            <%
                try {
                    Connection con = com.emptrack.controller.DBConnection.getConnection();
                    String user = (String) session.getAttribute("username");
                    PreparedStatement ps = con.prepareStatement("SELECT action, timestamp FROM time_logs WHERE username = ? ORDER BY timestamp DESC LIMIT 10");
                    ps.setString(1, user);
                    ResultSet rs = ps.executeQuery();
                    boolean hasLogs = false;
                    while (rs.next()) {
                        hasLogs = true;
            %>
            <tr>
                <td><%= rs.getString("action").toUpperCase() %></td>
                <td><%= rs.getTimestamp("timestamp") %></td>
            </tr>
            <%
                    }
                    if (!hasLogs) {
                        out.println("<tr><td colspan='2'>No logs found.</td></tr>");
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='2'>Failed to load logs.</td></tr>");
                }
            %>
        </table>
    </div>
</body>
</html>
