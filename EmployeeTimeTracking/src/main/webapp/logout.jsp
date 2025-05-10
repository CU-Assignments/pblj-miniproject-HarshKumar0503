<%@ page language="java" session="true" %>
<%
    session.invalidate(); // End the session
    response.sendRedirect("index.jsp"); // Redirect to home page
%>
