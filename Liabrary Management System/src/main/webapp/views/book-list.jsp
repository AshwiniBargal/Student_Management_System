<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library Management - Dashboard</title>
</head>
<body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); margin: 0; padding: 40px 20px; display: flex; justify-content: center; min-height: 100vh; box-sizing: border-box;">
    <div style="width: 100%; max-width: 1100px; background: white; padding: 40px; border-radius: 16px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); align-self: flex-start; box-sizing: border-box;">
        
        <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #e5e7eb; padding-bottom: 25px; margin-bottom: 35px; flex-wrap: wrap; gap: 15px;">
            <div>
                <h2 style="color: #1f2937; margin: 0; font-size: 28px; font-weight: 700; letter-spacing: -0.5px; display: flex; align-items: center; gap: 10px;">
                    📚 Library Management Dashboard
                </h2>
                <p style="color: #6b7280; font-size: 14px; margin: 5px 0 0 0;">Welcome back to your repository digital portal</p>
            </div>
            
            <div style="display: flex; align-items: center; gap: 12px; background: #f8fafc; padding: 10px 18px; border-radius: 99px; border: 1px solid #e2e8f0; font-size: 14px; color: #4a5568; font-weight: 500;">
                <span style="display: inline-block; width: 8px; height: 8px; background-color: #10b981; border-radius: 50%;"></span>
                User: <strong style="color: #1a202c; margin-left: 2px;"><c:out value="${sessionScope.username}"/></strong> 
                <span style="color: #cbd5e1; margin: 0 4px;">|</span>
                Role: 
                <c:choose>
                    <c:when test="${sessionScope.userRole eq 'admin'}">
                        <span style="background: #ecfdf5; color: #059669; padding: 4px 10px; border-radius: 99px; font-size: 12px; font-weight: 700; text-transform: uppercase;">Admin</span>
                    </c:when>
                    <c:otherwise>
                        <span style="background: #fff7ed; color: #ea580c; padding: 4px 10px; border-radius: 99px; font-size: 12px; font-weight: 700; text-transform: uppercase;">Student</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div style="display: flex; gap: 15px; margin-bottom: 35px; width: 100%; box-sizing: border-box; flex-wrap: wrap;">
            <div style="flex: 1; min-width: 220px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 20px; border-radius: 12px; color: white; box-shadow: 0 4px 15px rgba(102,126,234,0.25); box-sizing: border-box;">
                <span style="text-transform: uppercase; font-size: 11px; font-weight: 700; letter-spacing: 1px; opacity: 0.85; display: block; margin-bottom: 8px;">Catalog Volume</span>
                <span style="font-size: 24px; font-weight: 700; display: block;"><c:out value="${totalBooks}"/> Total Books</span>
            </div>
            
            <div style="flex: 1; min-width: 220px; background: linear-gradient(135deg, #10b981 0%, #059669 100%); padding: 20px; border-radius: 12px; color: white; box-shadow: 0 4px 15px rgba(16,185,129,0.25); box-sizing: border-box;">
                <span style="text-transform: uppercase; font-size: 11px; font-weight: 700; letter-spacing: 1px; opacity: 0.85; display: block; margin-bottom: 8px;">Available Now</span>
                <span style="font-size: 24px; font-weight: 700; display: block;"><c:out value="${availableBooks}"/> In Library</span>
            </div>

            <div style="flex: 1; min-width: 220px; background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%); padding: 20px; border-radius: 12px; color: white; box-shadow: 0 4px 15px rgba(245,158,11,0.25); box-sizing: border-box;">
                <span style="text-transform: uppercase; font-size: 11px; font-weight: 700; letter-spacing: 1px; opacity: 0.85; display: block; margin-bottom: 8px;">Borrowed Books</span>
                <span style="font-size: 24px; font-weight: 700; display: block;"><c:out value="${issuedBooks}"/> Issued Out</span>
            </div>
            
            <div style="flex: 1; min-width: 220px; background: linear-gradient(135deg, #111827 0%, #374151 100%); padding: 20px; border-radius: 12px; color: white; box-shadow: 0 4px 15px rgba(17,24,39,0.2); box-sizing: border-box;">
                <span style="text-transform: uppercase; font-size: 11px; font-weight: 700; letter-spacing: 1px; opacity: 0.85; display: block; margin-bottom: 8px;">Infrastructure Status</span>
                <span style="font-size: 20px; font-weight: 700; display: flex; align-items: center; gap: 6px; margin-top: 2px;">
                    ⚡ <span style="color: #34d399;">PostgreSQL Live</span>
                </span>
            </div>
        </div>

        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; flex-wrap: wrap; gap: 15px;">
            <div style="display: flex; gap: 12px;">
                <a href="${pageContext.request.contextPath}/logout" 
                   style="padding: 12px 24px; background-color: #ef4444; color: white; text-decoration: none; border-radius: 8px; font-weight: 600; font-size: 14px; box-shadow: 0 4px 10px rgba(239,68,68,0.2);">
                   🚪 Sign Out
                </a>

                <c:if test="${sessionScope.userRole eq 'admin'}">
                    <a href="${pageContext.request.contextPath}/new" 
                       style="padding: 12px 24px; background: linear-gradient(135deg, #10b981 0%, #059669 100%); color: white; text-decoration: none; border-radius: 8px; font-weight: 600; font-size: 14px; box-shadow: 0 4px 10px rgba(16,185,129,0.25);">
                       ➕ Add New Book
                    </a>
                </c:if>
            </div>

            <form action="${pageContext.request.contextPath}/list" method="get" style="display: flex; gap: 8px; align-items: center;">
                <input type="text" name="searchKeyword" placeholder="Search title or author..." value="<c:out value='${param.searchKeyword}'/>"
                       style="padding: 11px 16px; border: 1px solid #cbd5e1; border-radius: 8px; font-size: 14px; width: 240px; outline: none; box-sizing: border-box;" />
                <button type="submit" 
                        style="padding: 11px 20px; background-color: #4f46e5; color: white; border: none; border-radius: 8px; font-weight: 600; font-size: 14px; cursor: pointer; box-shadow: 0 4px 10px rgba(79,70,229,0.15);">
                    🔍 Search
                </button>
                <c:if test="${not empty param.searchKeyword}">
                    <a href="${pageContext.request.contextPath}/list" 
                       style="padding: 11px 16px; background-color: #e2e8f0; color: #475569; text-decoration: none; border-radius: 8px; font-weight: 600; font-size: 14px; text-align: center;">
                        Clear
                    </a>
                </c:if>
            </form>
        </div>

        <div style="overflow-x: auto; border: 1px solid #e5e7eb; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.02); width: 100%;">
            <table style="width: 100%; border-collapse: collapse; text-align: left; font-size: 15px; background: white;">
                <thead>
                    <tr style="background-color: #f8fafc; color: #475569; border-bottom: 2px solid #e5e7eb;">
                        <th style="padding: 16px 20px; font-weight: 600;">ID</th>
                        <th style="padding: 16px 20px; font-weight: 600;">Book Title</th>
                        <th style="padding: 16px 20px; font-weight: 600;">Author</th>
                        <th style="padding: 16px 20px; font-weight: 600;">ISBN Value</th>
                        <th style="padding: 16px 20px; font-weight: 600; text-align: center;">Status</th>
                        <c:if test="${sessionScope.userRole eq 'admin'}">
                            <th style="padding: 16px 20px; font-weight: 600; text-align: center;">Administrative Management</th>
                        </c:if>
                    </tr>
                </thead>
                <tbody style="color: #334155;">
                    <c:forEach var="book" items="${listBook}">
                        <tr style="border-bottom: 1px solid #f1f5f9;">
                            <td style="padding: 16px 20px; color: #64748b; font-weight: 500;"><c:out value="${book.id}" /></td>
                            <td style="padding: 16px 20px; font-weight: 600; color: #1e293b;"><c:out value="${book.title}" /></td>
                            <td style="padding: 16px 20px;"><c:out value="${book.author}" /></td>
                            <td style="padding: 16px 20px;">
                                <span style="background-color: #f1f5f9; color: #475569; padding: 4px 8px; border-radius: 6px; font-family: monospace; font-size: 13px;">
                                    <c:out value="${book.isbn}" />
                                </span>
                            </td>
                            <td style="padding: 16px 20px; text-align: center;">
                                <c:choose>
                                    <c:when test="${book.status eq 'Available'}">
                                        <span style="background: #ecfdf5; color: #059669; padding: 4px 12px; border-radius: 99px; font-size: 13px; font-weight: 600;">Available</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="background: #fef2f2; color: #dc2626; padding: 4px 12px; border-radius: 99px; font-size: 13px; font-weight: 600;">Issued</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <c:if test="${sessionScope.userRole eq 'admin'}">
                                <td style="padding: 16px 20px; text-align: center;">
                                    <div style="display: flex; gap: 8px; justify-content: center; align-items: center;">
                                        <c:choose>
                                            <c:when test="${book.status eq 'Available'}">
                                                <a href="${pageContext.request.contextPath}/issue?id=${book.id}" 
                                                   style="color: #4f46e5; text-decoration: none; font-weight: 600; font-size: 13px; padding: 6px 12px; border-radius: 6px; background-color: #e0e7ff; border: 1px solid #c7d2fe;">
                                                    ⚡ Issue
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/return?id=${book.id}" 
                                                   style="color: #d97706; text-decoration: none; font-weight: 600; font-size: 13px; padding: 6px 12px; border-radius: 6px; background-color: #fef3c7; border: 1px solid #fde68a;">
                                                    🔄 Return
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                        <a href="${pageContext.request.contextPath}/delete?id=${book.id}" 
                                           onclick="return confirm('Are you sure you want to remove this book?');"
                                           style="color: #ef4444; text-decoration: none; font-weight: 600; font-size: 13px; padding: 6px 12px; border-radius: 6px; background-color: #fef2f2; border: 1px solid #fee2e2;">
                                            ❌ Delete
                                        </a>
                                    </div>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty listBook}">
                        <tr>
                            <td colspan="${sessionScope.userRole eq 'admin' ? 6 : 5}" style="padding: 40px; text-align: center; color: #94a3b8; font-style: italic;">
                                No books found in the database catalog repository.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
        
    </div>
</body>
</html>