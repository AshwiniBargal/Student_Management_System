<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Library - Add Book</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #fafafa; margin: 40px;">
    <div style="width: 40%; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
        <h2 style="color: #333; margin-top: 0; border-bottom: 2px solid #eee; padding-bottom: 10px;">Add New Book</h2>
        
        <form action="${pageContext.request.contextPath}/insert" method="post">
            <p style="margin-bottom: 20px;">
                <label style="font-weight: bold; color: #555;">Book Title</label><br/>
                <input type="text" name="title" required style="width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;"/>
            </p>
            <p style="margin-bottom: 20px;">
                <label style="font-weight: bold; color: #555;">Author Name</label><br/>
                <input type="text" name="author" required style="width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;"/>
            </p>
            <p style="margin-bottom: 25px;">
                <label style="font-weight: bold; color: #555;">ISBN Number</label><br/>
                <input type="text" name="isbn" required style="width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;"/>
            </p>
            
            <button type="submit" style="padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 4px; font-weight: bold; cursor: pointer;">💾 Save Book</button>
            <a href="${pageContext.request.contextPath}/list" style="margin-left: 15px; color: #666; text-decoration: none;">Cancel</a>
        </form>
    </div>
</body>
</html>