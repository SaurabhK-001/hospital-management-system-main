<%@page import="com.entities.Doctor"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOCTOR DASHBOARD</title>
<%@ include file="../fonts.jsp"%>
<%@include file="../css.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container p-5">

		<p class="text-center fs-3 fw-bold mb-5">DOCTOR DASHBOARD</p>

<%DoctorDao dao = new DoctorDao(DbConnection.getConnection());
    Doctor doctor = (Doctor) session.getAttribute("docObj");
%>


		<div class="row" style="cursor: pointer;">
			<div class="col-md-6 offset-md-3 mb-5">
				<div class="card ">
					<div class="card-body text-success  text-center text-secondary">
						<i class="fas fa-user-md fa-2x"></i><br>
						<p class="fs-4 fw-bold text-dark text-center">DOCTORS
						<br>
						<%= dao.countDoctor() %>
						</p>
						
					</div>
				</div>
			</div>
		</div>


		<div class="row" style="cursor: pointer;">
			<div class="col-md-6 offset-md-3 mt-2">
				<div class="card ">
					<div class="card-body text-success text-center text-secondary">
						<i class="far fa-calendar-check fa-2x"></i><br>
						<p class="fs-4 fw-bold text-dark text-center">TOTAL APPOINTMENTS
						<br>
						<%= 
						dao.countAppointmentByDoctorId(doctor.getId())
						%>
						</p>
						
					</div>
				</div>
			</div>
		</div>

	</div>





	<c:if test="${empty docObj}">

		<c:redirect url="../doctor.jsp"></c:redirect>

	</c:if>

	<%@include file="../js.jsp"%>
</body>
</html>