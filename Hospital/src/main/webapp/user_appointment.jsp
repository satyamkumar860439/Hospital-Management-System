<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Appointment</title>
    <%@ include file="Component/allcss.jsp" %>
    <style type="text/css">
        .point-card {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <%@ include file="Component/navbar.jsp" %>

    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white">Book an Appointment</p>
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 p-5">
                <!-- Optional image or description -->
            </div>
            <div class="col-md-6">
                <div class="card point-card p-4">
                    <p class="text-center fs-3">User Appointment</p>

                    <c:if test="${not empty errorMsg}">
                        <p class="text-center text-danger fs-5">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <!-- Success Message -->
           <c:if test="${not empty sucMsg}">
            <p class="text-center text-success fs-5">${sucMsg}</p>
            <c:remove var="sucMsg" scope="session" />
            </c:if>

                    <form class="row g-3" action="add_appoint" method="post">
                        <input type="hidden" name="userid" value="${userobj.id}" />

                        <div class="col-md-6">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="fullname" required />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Gender</label>
                            <select class="form-control" name="gender" required>
                                <option value="">--Select--</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Age</label>
                            <input type="number" class="form-control" name="age" required />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Appointment Date</label>
                            <input type="date" class="form-control" name="appoint_date" required />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" required />
                        </div>
                        
                           <div class="col-md-6">
                            <label class="form-label">Phone No</label>
                            <input type="text" class="form-control" name="number" required />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Diseases</label>
                            <input type="text" class="form-control" name="diseases" required />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Doctor</label>
                            <select class="form-control" name="doct" required>
                                <option value="">--Select--</option>
                      <% 
                      DoctorDao dao = new DoctorDao(DBConnect.getConn());
                          List<Doctor> list = dao.getAllDoctor();
                        for (Doctor d : list) {
                    %>
                       <option value="<%=d.getId() %>">
                    <%= d.getFullName() %> (<%= d.getSpecialist() %>)
                  </option>

                    <%
                        }
                    %>
                     
                            </select>
                        </div>

                        <div class="col-md-12">
                            <label class="form-label">Full Address</label>
                            <textarea name="address" class="form-control" rows="3" required></textarea>
                        </div>

                        <div class="col-md-12 text-center">
                            <button type="submit" class="btn btn-success px-4">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
