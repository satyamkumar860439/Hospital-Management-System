<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Doctor</title>
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
<div class="container-fluid p-3">
<div class="row">
<div class="col-md-5 offset-md-4">

<div class="card point-card">
    <div class="card-body">
        <p class="fs-3 text-center">Add Doctor</p>

        <!-- Success Message -->
        <c:if test="${not empty sucMsg}">
            <p class="text-center text-success fs-5">${sucMsg}</p>
            <c:remove var="sucMsg" scope="session" />
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty errorMsg}">
            <p class="text-center text-danger fs-5">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session" />
        </c:if>

        <form action="../add_doctor" method="post">
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" required name="fullname" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Date of Birth</label>
                <input type="date" required name="dob" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Qualification</label>
                <input type="text" required name="qualification" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Specialist</label>
                <select name="specialist" required class="form-control">
                    <option>--select--</option>
                    <%
                        SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                        List<Specialist> list = dao.getAllSpecialist();
                        for (Specialist s : list) {
                    %>
                        <option value="<%= s.getSpecialistName() %>"><%= s.getSpecialistName() %></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" required name="email" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Mobile No</label>
                <input type="text" required name="mobno" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Passward</label>
                <input type="passward" required name="passward" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>

    </div>
</div>

</body>
</html>
