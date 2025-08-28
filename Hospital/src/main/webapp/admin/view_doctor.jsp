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

<!-- Doctor Details Table -->
<div class="col-md-12">
    <div class="card point-card">
        <div class="card-body">
            <p class="fs-3 text-center">Doctor Details</p>
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
            
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Full Name</th>
                        <th scope="col">DOB</th>
                        <th scope="col">Specialist</th>
                        <th scope="col">Email</th>
                        <th scope="col">Mob No</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                <%DoctorDao dao2= new DoctorDao(DBConnect.getConn()); 
                List<Doctor> list2=dao2.getAllDoctor();
                for(Doctor d:list2)
                {%>
                <tr>
                <td><%=d.getFullName() %></td>
                 <td><%=d.getDob() %></td>
                   <td><%=d.getQualification() %></td> 
                    <td><%=d.getSpecialist() %></td>
                     <td><%=d.getEmail() %></td>
                      <td><%=d.getMobNo() %></td>
                       <td><%=d.getPassward() %></td>
                       <td>
                <a href="edit_doctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                     <a href="../deletedoctor?id=<%= d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                       </td>
                       </tr>
               <% }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
