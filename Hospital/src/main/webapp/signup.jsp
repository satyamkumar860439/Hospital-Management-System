<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <%@ include file="Component/allcss.jsp" %>
    <style>
        .point-card {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

<%@ include file="Component/navbar.jsp" %>

<div class="container p-5">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card point-card">
                <div class="card-body">
                    <p class="fs-4 text-center">User Register</p>

                    <!-- Success Message -->
                    <c:if test="${not empty sucMsg}">
                        <p class="text-center text-success fs-3">${sucMsg}</p>
                        <c:remove var="sucMsg" scope="session" />
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty errorMsg}">
                        <p class="text-center text-danger fs-3">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>

                    <!-- Registration Form -->
                    <form action="user_register" method="post">
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input id="fullName" name="fullName" type="text" class="form-control" required />
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input id="email" name="email" type="email" class="form-control" required />
                        </div>

                        <div class="mb-3">
                            <label for="passward" class="form-label">Passward</label>
                            <input id="passward" name="passward" type="password" class="form-control" required />
                        </div>

                        <button type="submit" class="btn bg-success text-white col-md-12">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
