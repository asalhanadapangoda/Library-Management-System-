<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Elite Library - Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/index.jsp" class="nav-brand">
            <i class="fas fa-book-open"></i> ELITE LIBRARY
        </a>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/books?action=list">Books</a>
            <a href="${pageContext.request.contextPath}/authors?action=list">Authors</a>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <c:if test="${sessionScope.user.role == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp" style="color: var(--accent);">Admin Panel</a>
                    </c:if>
                    <c:if test="${sessionScope.user.role == 'USER'}">
                        <a href="${pageContext.request.contextPath}/user/dashboard.jsp">Dashboard</a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/auth?action=logout" class="btn btn-danger" style="padding: 0.5rem 1rem;">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/auth/login.jsp">Login</a>
                    <a href="${pageContext.request.contextPath}/auth/register.jsp" class="btn btn-primary" style="padding: 0.5rem 1rem;">Register</a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
    <div class="container">
