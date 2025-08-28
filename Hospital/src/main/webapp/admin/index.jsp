<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <%@ include file="../Component/allcss.jsp" %>
    <style>
        .point-card {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            cursor: pointer;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container p-5">
        <p class="text-center fs-3">Admin Dashboard</p>

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

        <div class="row">
            <!-- Doctor Card -->
            <div class="col-md-4 mb-4">
                <div class="card point-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-md fa-3x"></i><br>
                        <p class="fs-4">Doctor<br>5</p>
                    </div>
                </div>
            </div>

            <!-- User Card -->
            <div class="col-md-4 mb-4">
                <div class="card point-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-circle fa-3x"></i><br>
                        <p class="fs-4">User<br>43</p>
                    </div>
                </div>
            </div>

            <!-- Total Appointment Card -->
            <div class="col-md-4 mb-4">
                <div class="card point-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-calendar-check fa-3x"></i><br>
                        <p class="fs-4">Total Appointment<br>453</p>
                    </div>
                </div>
            </div>

            <!-- Specialist Card (Clickable) -->
            <div class="col-md-4 mb-4">
                <div class="card point-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-tag fa-3x"></i><br>
                        <p class="fs-4">Specialist<br>43</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional button if needed -->
    <!--
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
      Launch demo modal
    </button>
    -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">
            <!-- Example form to add specialist -->
            <form action="../addSpecialist" method="post">
                <div class="mb-3">
                    <label for="spac" class="form-label">Specialist Name</label>
                    <input type="text" class="form-control" id="spac" name="spaceName" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Specialist</button>
            </form>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>

        </div>
      </div>
    </div>
</body>
</html>