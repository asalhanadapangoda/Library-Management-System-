<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Elite Library - Management System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800&display=swap" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Theme Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light sticky-top py-0">
        <div class="container">
            <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand nav-brand">
                <i class="bi bi-book-half"></i> ELITE LIBRARY
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link px-3" href="${pageContext.request.contextPath}/books?action=list">Books</a></li>
                    <li class="nav-item"><a class="nav-link px-3" href="${pageContext.request.contextPath}/authors?action=list">Authors</a></li>
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <c:if test="${sessionScope.user.role == 'ADMIN'}">
                                <li class="nav-item"><a class="nav-link px-3 fw-bold" href="${pageContext.request.contextPath}/admin/dashboard.jsp" style="color: var(--accent);">Admin Panel</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user.role == 'USER'}">
                                <li class="nav-item"><a class="nav-link px-3" href="${pageContext.request.contextPath}/user/dashboard.jsp">Dashboard</a></li>
                            </c:if>
                            <li class="nav-item ms-lg-3">
                                <a href="${pageContext.request.contextPath}/auth?action=logout" class="btn btn-danger btn-sm text-white">Logout</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link px-3" href="${pageContext.request.contextPath}/auth/login.jsp">Login</a></li>
                            <li class="nav-item ms-lg-3">
                                <a href="${pageContext.request.contextPath}/auth/register.jsp" class="btn btn-primary btn-sm text-white">Register</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-4">
