package com.library.controller;

import com.library.dao.BookDAO;
import com.library.model.Book;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookDAO bookDAO;

    public void init() {
        bookDAO = new BookDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getServletPath();
        
        if ("/logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return; 
        }

        String userRole = (String) session.getAttribute("userRole");

        try {
            switch (action) {
                case "/new":
                    if (!"admin".equals(userRole)) {
                        response.sendRedirect(request.getContextPath() + "/list");
                    } else {
                        showNewForm(request, response);
                    }
                    break;
                    
                case "/insert":
                    if (!"admin".equals(userRole)) {
                        response.sendRedirect(request.getContextPath() + "/list");
                    } else {
                        insertBook(request, response);
                    }
                    break;
                    
                case "/delete":
                    if (!"admin".equals(userRole)) {
                        response.sendRedirect(request.getContextPath() + "/list");
                    } else {
                        deleteBook(request, response);
                    }
                    break;

                case "/issue":
                    if (!"admin".equals(userRole)) {
                        response.sendRedirect(request.getContextPath() + "/list");
                    } else {
                        issueBook(request, response);
                    }
                    break;

                case "/return":
                    if (!"admin".equals(userRole)) {
                        response.sendRedirect(request.getContextPath() + "/list");
                    } else {
                        returnBook(request, response);
                    }
                    break;
                    
                case "/list":
                default:
                    listBooks(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String keyword = request.getParameter("searchKeyword");
        List<Book> listBook;

        if (keyword != null && !keyword.trim().isEmpty()) {
            listBook = bookDAO.searchBooks(keyword);
        } else {
            listBook = bookDAO.selectAllBooks();
        }

        int totalBooks = bookDAO.getTotalBookCount();
        int availableBooks = bookDAO.getAvailableBookCount();
        int issuedBooks = bookDAO.getIssuedBookCount();
        
        request.setAttribute("listBook", listBook);
        request.setAttribute("totalBooks", totalBooks); 
        request.setAttribute("availableBooks", availableBooks);
        request.setAttribute("issuedBooks", issuedBooks);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/book-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        Book newBook = new Book(title, author, isbn);
        
        try {
            bookDAO.insertBook(newBook);
            response.sendRedirect(request.getContextPath() + "/list");
        } catch (SQLException e) {
            if (e.getMessage().contains("duplicate key") || e.getMessage().contains("books_isbn_key")) {
                response.sendRedirect(request.getContextPath() + "/new?error=duplicateIsbn");
            } else {
                throw e;
            }
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookDAO.deleteBook(id);
        response.sendRedirect(request.getContextPath() + "/list");
    }

    private void issueBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookDAO.updateBookStatus(id, "Issued");
        response.sendRedirect(request.getContextPath() + "/list");
    }

    private void returnBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookDAO.updateBookStatus(id, "Available");
        response.sendRedirect(request.getContextPath() + "/list");
    }
}