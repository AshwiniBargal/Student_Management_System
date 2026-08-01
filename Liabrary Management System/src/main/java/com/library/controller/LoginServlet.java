package com.library.controller;

import com.library.dao.BookDAO;
import com.library.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; 
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private BookDAO bookDAO;

    public void init() {
        bookDAO = new BookDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 🚪 LOGOUT LOGIC: If an active session exists when hitting this via GET, destroy it
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); 
        }
        
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        User user = new User(username, password);

        // This method validates credentials AND fills the user object with its role ('admin' or 'student')
        if (bookDAO.validateUser(user)) {
            // 🎉 Login successful! Create a secure HTTP Session
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            
            // 🌟 CRITICAL FIX: Save the role into the session so book-list.jsp can customize the view!
            session.setAttribute("userRole", user.getRole()); 
            
            response.sendRedirect(request.getContextPath() + "/list");
        } else {
            // Login failed! Send back an error message
            request.setAttribute("errorMessage", "Invalid Username or Password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}