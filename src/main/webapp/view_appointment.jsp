<%@page import="com.entities.User"%>
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
<%@ include file="css.jsp"%>
<%@ include file="fonts.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<title>APPOINTMENT LIST</title>
</head>
<body style="background: #e2e2e2">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userObj }">
		<c:redirect url="user.jsp"></c:redirect>

	</c:if>

	<div class="container p-5">

		<div class="row">

			<div class="card">

				<div class="card-body">

					<p class="text-center fs-4 fw-bold">APPOINTMENT LIST</p>

					<table class="table">
						<thead>

							<tr>


								<th scope="col">Full Name</th>
								<th scope="col">Gender</th>
								<th scope="col">Age</th>
								<th scope="col">Appoint Date</th>
								<th scope="col">Disease</th>
								<th scope="col">Doctor Name</th>
								<th scope="col">Status</th>

							</tr>

						</thead>

						<tbody>
							<%
							User user = (User) session.getAttribute("userObj");
							int id = user.getId();

							AppointmentDao dao = new AppointmentDao(DbConnection.getConnection());
							DoctorDao dao2 = new DoctorDao(DbConnection.getConnection());

							List<Appointment> list = dao.getAllAppointmentUser(id);
							for (Appointment ap : list) {
								Doctor doctor = dao2.getDoctorById(ap.getDoctorId());
							%>
							<tr>
								<th><%=ap.getFullName()%></th>
								<td><%=ap.getGender()%></td>
								<td><%=ap.getAge()%></td>
								<td><%=ap.getAppointmentDate()%></td>
								<td><%=ap.getDisease()%></td>
								<td><%=doctor.getFullName()%></td>
								<td>
									<%
									if ("Pending".equals(ap.getStatus())) {
									%> <a href="#" class="fw-bold btn btn-small btn-warning">PENDING</a>
									<%
									} else {
									%> <%=ap.getStatus()%> <%
 }
 %>
								</td>
							</tr>
							<%
							} // End of loop
							%>
						</tbody>

					</table>

				</div>

			</div>

		</div>







	</div>


	<%@ include file="js.jsp"%>
</body>
</html>