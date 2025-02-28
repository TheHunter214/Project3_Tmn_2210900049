
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Trang jsp demo</title>
</head>
<body>
     <div class="header">
     <h1>Chao mung den jsp</h1>
     </div>
     <div class="content">
        <%
        //viet ma java
        String message ="hello,jsp!";
        out.print("<p>"+message+"</p>");
        %>
     </div>
     <a href="saveform">Den menu chuc nang</a>
     <div class="footer">
     <p>&copy; 2024 Trang Web cua ban</p>
     </div>
</body>
</html>