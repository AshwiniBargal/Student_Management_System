<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library Administration - Login</title>
</head>
<body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; padding: 0;">
<body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; padding: 0;">
    
    <div style="width: 100%; max-width: 400px; background: rgba(255, 255, 255, 0.98); padding: 45px 40px; border-radius: 16px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2); text-align: center; box-sizing: border-box;">
        
        <div style="font-size: 50px; margin-bottom: 15px; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">🔐</div>
        <h2 style="color: #2d3748; margin-top: 0; margin-bottom: 5px; font-size: 28px; font-weight: 700; letter-spacing: -0.5px;">System Portal Login</h2>
        <p style="color: #718096; font-size: 14px; margin-bottom: 35px;">Library Management System</p>
        
        <c:if test="${not empty errorMessage}">
            <div style="background-color: #fff5f5; color: #c53030; padding: 12px 15px; border-radius: 8px; margin-bottom: 25px; font-size: 14px; text-align: left; border: 1px solid #fed7d7; border-left: 4px solid #e53e3e; font-weight: 500;">
                <c:out value="${errorMessage}"/>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post" style="text-align: left;">
            <div style="margin-bottom: 22px;">
                <label style="font-weight: 600; color: #4a5568; font-size: 14px; display: block; margin-bottom: 8px;">Username</label>
                <input type="text" name="username" required placeholder="Enter username"
                       style="width: 100%; padding: 12px 16px; border: 1px solid #cbd5e0; border-radius: 8px; box-sizing: border-box; font-size: 14px; background-color: #f7fafc; color: #2d3748; outline: none;"/>
            </div>
            
            <div style="margin-bottom: 35px;">
                <label style="font-weight: 600; color: #4a5568; font-size: 14px; display: block; margin-bottom: 8px;">Password</label>
                <input type="password" name="password" required placeholder="Enter password"
                       style="width: 100%; padding: 12px 16px; border: 1px solid #cbd5e0; border-radius: 8px; box-sizing: border-box; font-size: 14px; background-color: #f7fafc; color: #2d3748; outline: none;"/>
            </div>
            
            <button type="submit" 
                    style="width: 100%; padding: 14px; background: linear-gradient(135deg, #4f46e5 0%, #3b82f6 100%); color: white; border: none; border-radius: 8px; font-weight: 600; font-size: 16px; cursor: pointer; box-shadow: 0 4px 14px rgba(59, 130, 246, 0.4);">
                Sign In
            </button>
        </form>
    </div>

</body>
</html>