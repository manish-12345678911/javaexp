package com.studentlogin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class login extends HttpServlet {

    // Hardcoded Student Credentials
    private static final String VALID_USERNAME = "student";
    private static final String VALID_PASSWORD = "student123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null
                && username.equals(VALID_USERNAME)
                && password.equals(VALID_PASSWORD)) {

            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("welcome.jsp");

        } else {
            String errorMsg;
            if (username == null || username.trim().isEmpty()) {
                errorMsg = "Error: Username cannot be empty!";
            } else if (password == null || password.trim().isEmpty()) {
                errorMsg = "Error: Password cannot be empty!";
            } else {
                errorMsg = "Error: Invalid Username or Password! Please try again.";
            }

            request.setAttribute("errorMsg", errorMsg);
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
