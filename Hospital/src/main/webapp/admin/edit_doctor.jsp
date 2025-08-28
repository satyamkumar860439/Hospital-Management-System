<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">
      <i class="fas fa-clinic-medical"></i> MEDI HOME
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
            data-bs-target="#navbarSupportedContent" 
            aria-controls="navbarSupportedContent" 
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="home.jsp">HOME</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="appoitement.jsp">PATIENT</a>
        </li>
      </ul>

      <!-- Dropdown for Doctor User -->
      <div class="dropdown ms-3">
        <button class="btn btn-light dropdown-toggle" type="button" 
                id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        <i class="fas fa-user-circle"></i> ${doctObj.FullName}

        </button>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
          <li><a class="dropdown-item" href="profile.jsp">Edit Profile</a></li>
          <li><a class="dropdown-item" href="doctLogout">Logout</a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>

<%@ page import="java.util.List" %>
<%@ page import="com.dao.DoctorDao" %>

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
<div class="col-md-4 offset-md-4">
       
        <p class="fs-3 text-center">Edit Doctor Details</p>

        <!-- Success Message -->
        <c:if test="${not empty sucMsg}">
            <p class="text-center text-success fs-5">${sucMsg}</p>
            <c:remove var="sucMsg" scope="session" />
        </c:if>
         <% 
         int id = Integer.parseInt(request.getParameter("id"));
        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
         Doctor d= dao2.DoctorById(id);
         %>
        <!-- Error Message -->
        <c:if test="${not empty errorMsg}">
            <p class="text-center text-danger fs-5">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session" />
        </c:if>

        <form action="../updateDoctor" method="post">
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" required name="fullname" class="form-control"value="<%=d.getFullName()%>">
            </div>

            <div class="mb-3">
                <label class="form-label">Date of Birth</label>
                <input type="date" required name="dob" class="form-control"value="<%=d.getDob() %>" >
            </div>

            <div class="mb-3">
                <label class="form-label">Qualification</label>
                <input type="text" required name="qualification" class="form-control"value="<%=d.getQualification()%>">
            </div>

            <div class="mb-3">
                <label class="form-label">Specialist</label>
                <select name="specialist" required class="form-control"value="<%=d.getSpecialist() %>">
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
                <input type="email" required name="email" class="form-control"value="<%=d.getEmail() %>">
            </div>

            <div class="mb-3">
                <label class="form-label">Mobile No</label>
                <input type="text" required name="mobno" class="form-control"value="<%=d.getMobNo() %>">
            </div>

            <div class="mb-3">
                <label class="form-label">Passward</label>
                <input type="passward" required name="passward" class="form-control"value="<%=d.getPassward() %>">
            </div>
            <input type="hidden" name="id"value=<%=d.getId()%>">

            <button type="submit" class="btn btn-primary">Update</button>
    </div>
</div>

<
        </div>
    </div>
</div>

</body>
</html>