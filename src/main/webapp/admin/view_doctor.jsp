<%@page import="com.entities.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entities.Specialists"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.SpecialistsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../css.jsp"%>
<%@ include file="../fonts.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<title>DOCTOR</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container-fluid p-3">

		<div class="row">



			<div class="col-md-12">
				<div class="card">

					<div class="card-body">

						<p class="fs-3 fw-bold text-center">Doctor Details</p>

						<c:if test="${not empty successMessage}">
							<p class="text-center text-success small fw-bold">${successMessage}</p>
							<c:remove var="successMessage" scope="session" />
						</c:if>

						<c:if test="${not empty errorMessage}">
							<p class="text-center text-danger small fw-bold">${errorMessage}</p>
							<c:remove var="errorMessage" scope="session" />
						</c:if>

						<div class="table-responsive">

							<table class="table ">

								<thead>
									<tr>

										<th scope="col">Full Name</th>
										<th scope="col">DOB</th>
										<th scope="col">Qualification</th>
										<th scope="col">Specialization</th>
										<th scope="col">Email</th>
										<th scope="col">Mob No</th>
										<th scope="col">Action</th>
									</tr>
								</thead>

								<tbody>

									<%
									DoctorDao dao2 = new DoctorDao(DbConnection.getConnection());
									List<Doctor> list1 = dao2.getAllDoctors();
									for (Doctor d : list1) {
									%>

									<tr>


										<td><%=d.getFullName()%></td>
										<td><%=d.getDob()%></td>
										<td><%=d.getQualification()%></td>
										<td><%=d.getSpecialist()%></td>
										<td><%=d.getEmail()%></td>
										<td><%=d.getMobNo()%></td>

										<td><a href="edit_doctor.jsp?id=<%=d.getId()%>"
											class="btn btn-sm btn-secondary">EDIT</a> <a
											href="../deleteDoctor?id=<%=d.getId()%>"
											class="btn btn-sm btn-danger">DELETE</a></td>

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



	</div>


	<%@ include file="../js.jsp"%>

</body>
</html>