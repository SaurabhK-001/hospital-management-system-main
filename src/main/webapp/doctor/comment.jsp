<%@page import="com.entities.Appointment"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMENT</title>
<%@ include file="../css.jsp"%>
<%@ include file="../fonts.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
</head>
<body>
	<c:if test="${empty docObj}">

		<c:redirect url="../doctor.jsp"></c:redirect>

	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container p-3 mt-5">
    <div class="row justify-content-center">
        <div class="card col-md-8">
            <div class="card-body">
                <p class="text-center fs-4 fw-bold">Patient Comment</p>
                
                
                <%
                int id = Integer.parseInt(request.getParameter("id"));
                AppointmentDao dao = new AppointmentDao(DbConnection.getConnection());
                Appointment appointment = dao.getAllAppointmentById(id);
                %>
                
                <form class="row g-3" action="../updateStatus" method="post">
                    <div class="col-md-6">
                        <label for="patientName" class="form-label">Patient Name :</label>
                        <input type="text" id="patientName" class="form-control" readonly="readonly"  value="<%= appointment.getFullName() %>">
                    </div>
                    <div class="col-md-6">
                        <label for="age" class="form-label">Age :</label>
                        <input type="number" id="age" class="form-control" readonly="readonly"  value="<%= appointment.getAge()%>">
                    </div>
                  
                     <div class="col-md-6">
                        <label for="phone" class="form-label">Phone No :</label>
                        <input type="text" id="phone" class="form-control" readonly="readonly" value="<%= appointment.getPhNo()%>">
                    </div>
                    <div class="col-md-6">
                        <label for="disease" class="form-label">Disease :</label>
                        <input type="text" id="disease" class="form-control" readonly="readonly" value="<%= appointment.getDisease() %>">
                    </div>
                    <div class="col-md-12">
                        <label for="comment" class="form-label">Comment :</label>
                        <input type="text" name="comment" value="<%=appointment.getStatus() %>" id="comment" class="form-control" value="">
                    </div>
                    <input type="hidden" name="did" value="<%= appointment.getDoctorId()%>">
                    <input type="hidden" name="id" value="<%= appointment.getId()%>">
                    <div class="col-12">
                        <button type="submit" class="btn btn-secondary w-100">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

	<%@ include file="../js.jsp"%>
</body>
</html>