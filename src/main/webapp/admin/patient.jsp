<%@page import="com.entities.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entities.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../fonts.jsp"%>
<%@include file="../css.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
</head>
<title>PATIENT</title>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container p-3 mt-5">


		<div class="col-md-12">

			<div class="card">



				<div class="card-body">

					<p class="fs-2 text-center fw-bold">PATIENT DETAILS</p>


					<div class="table-responsive">
						<table class="table">

							<thead>

								<tr>

									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile Number</th>
									<th scope="col">Disease</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Address</th>
									<th scope="col">Status</th>

								</tr>

							</thead>
							<tbody>
								<%
								AppointmentDao dao = new AppointmentDao(DbConnection.getConnection());
								List<Appointment> list = dao.getAllAppointment();
								DoctorDao dao2 = new DoctorDao(DbConnection.getConnection());
					
								
								for (Appointment ap : list) {
									
								Doctor doctor = dao2.getDoctorById(ap.getDoctorId());
								%>
								
								<tr>
									<th><%=ap.getFullName() %> </th>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %> </td>
									<td><%=ap.getAppointmentDate()%> </td>
									<td><%=ap.getEmail() %> </td>
									<td><%=ap.getPhNo() %> </td>
									<td><%=ap.getDisease() %> </td>
									<td><%=doctor.getFullName() %> </td>
									<td><%=ap.getAddress() %> </td>
									<td><%=ap.getStatus() %> </td>
								</tr>
								

								<%
								}
								%>

								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@include file="../js.jsp"%>
</body>
</html>