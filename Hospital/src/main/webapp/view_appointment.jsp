<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.entity.User, com.entity.Doctor, com.entity.Appointment" %>
<%@ page import="com.dao.DoctorDao, com.dao.AppointmentDao" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Appointment List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .point-card {
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <%@ include file="Component/navbar.jsp" %>

    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white">Appointments</p>
    </div>

    <div class="container mt-4">
        <div class="card point-card">
            <div class="card-body">
                <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Appointment Date</th>
                            <th>Email</th>
                            <th>Phone No.</th>
                            <th>Diseases</th>
                            <th>Doctor Name</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        User user = (User) session.getAttribute("userobj");
                        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
                        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                        List<Appointment> list = dao.getAllAppointment(user.getId());
                        for(Appointment ap : list) {
                            Doctor d = dao2.DoctorById(ap.getDoctorId());
                    %>
                        <tr>
                            <td><%= ap.getFullName() %></td>
                            <td><%= ap.getGender() %></td>
                            <td><%= ap.getAge() %></td>
                            <td><%= ap.getAppoinDate() %></td>
                            <td><%= ap.getEmail() %></td>
                            <td><%= ap.getPhNo() %></td>
                            <td><%= ap.getDiseases() %></td>
                            <td><%= (d != null) ? d.getFullName() : "N/A" %></td>
                            <td>
                                <% if ("pending".equalsIgnoreCase(ap.getStatus())) { %>
                                    <a href="#" class="btn btn-warning btn-sm">Pending</a>
                                <% } else { %>
                                    <%= ap.getStatus() %>
                                <% } %>
                            </td>
                            <td>
                                <!-- Example action buttons -->
                                <a href="editAppointment?id=<%= ap.getId() %>" class="btn btn-primary btn-sm">Edit</a>
                                <a href="deleteAppointment?id=<%= ap.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
