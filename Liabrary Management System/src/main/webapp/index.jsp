<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome - Library Management System</title>
</head>
<body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; padding: 0;">
    <body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; padding: 0;">
    <div style="width: 100%; max-width: 550px; background: rgba(255, 255, 255, 0.95); padding: 50px 40px; border-radius: 16px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2); text-align: center; margin: 20px;">
        
        <div style="font-size: 64px; margin-bottom: 20px; filter: drop-shadow(0 4px 6px rgba(0,0,0,0.1));">📚</div>
        
        <h1 style="color: #2d3748; margin-top: 0; margin-bottom: 12px; font-size: 32px; font-weight: 700; letter-spacing: -0.5px; line-height: 1.2;">
            Welcome to the Library Management System
        </h1>
        
        <p style="color: #718096; font-size: 16px; margin-bottom: 40px; line-height: 1.6; max-width: 420px; margin-left: auto; margin-right: auto;">
            Easily manage your book repository, view catalogs seamlessly, and verify system status via an integrated role-based security framework.
        </p>
        
        <a href="${pageContext.request.contextPath}/login" 
           style="display: inline-block; padding: 14px 36px; background: linear-gradient(135deg, #4f46e5 0%, #3b82f6 100%); color: white; text-decoration: none; border-radius: 8px; font-weight: 600; font-size: 16px; box-shadow: 0 4px 14px rgba(59, 130, 246, 0.4); transition: all 0.2s ease; border: 1px solid rgba(255,255,255,0.1);">
           Go to Dashboard ➡️
        </a>

       
    </div>

</body>
</html>