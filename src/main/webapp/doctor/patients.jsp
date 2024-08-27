<%@page import="com.entities.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entities.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PATIENTS</title>
<%@ include file="../fonts.jsp"%>
<%@include file="../css.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
</head>
<body style="background: #e2e2e2">

	<c:if test="${empty docObj}">

		<c:redirect url="../doctor.jsp"></c:redirect>

	</c:if>


	<%@include file="navbar.jsp"%>

	<div class="container p-3 mt-5">


		<div class="col-md-12">

			<div class="card">



				<div class="card-body">

					<p class="fs-2 text-center fw-bold">PATIENT DETAILS</p>

					<c:if test="${not empty successMessage}">
						<p class="text-center text-success small fw-bold">${successMessage}</p>
						<c:remove var="successMessage" scope="session" />
					</c:if>

					<c:if test="${not empty errorMessage}">
						<p class="text-center text-danger small fw-bold">${errorMessage}</p>
						<c:remove var="errorMessage" scope="session" />
					</c:if>

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
									<th scope="col">Status</th>
									<th scope="col">Action</th>

								</tr>

							</thead>
							<tbody>

								<%
								Doctor doctor = (Doctor) session.getAttribute("docObj");
								int id = doctor.getId();
								AppointmentDao dao = new AppointmentDao(DbConnection.getConnection());
								List<Appointment> list = dao.getAllAppointmentDoctor(id);

								for (Appointment ap : list) {
								%>

								<tr>

									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointmentDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getDisease()%></td>
									<td><%=ap.getStatus()%></td>

									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a href="comment.jsp?id=<%=ap.getId()%>"
																				class="btn btn-warning btn-small">COMMENT</a> <%
										 } else {
										 %> <a href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-success btn-small disabled">COMMENT</a> <%
										 }
										 %>
									</td>
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