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

			<div class="col-md-4 offset-md-4">

				<div class="card">


					<div class="card-body">
						<p class="fs-3 fw-bold text-center">EDIT DOCTOR</p>
						<c:if test="${not empty successMessage}">
							<p class="text-center text-success small fw-bold">${successMessage}</p>
							<c:remove var="successMessage" scope="session" />
						</c:if>

						<c:if test="${not empty errorMessage}">
							<p class="text-center text-danger small fw-bold">${errorMessage}</p>
							<c:remove var="errorMessage" scope="session" />
						</c:if>
						
						<%
						int id  = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2 = new DoctorDao(DbConnection.getConnection());
						Doctor doctor = dao2.getDoctorById(id);
						
						%>
						

						<form action="../updateDoctor" method="post">



							<div class="mb-3">
								<label class="form-label">Full Name : </label> <input
									type="text" required class="form-control" value="<%=doctor.getFullName() %>" name="fullName">

							</div>

							<div class="mb-3">
								<label class="form-label">DOB : </label> <input type="date"
									required class="form-control" value="<%=doctor.getDob() %>" name="dob">

							</div>
							<div class="mb-3">
								<label class="form-label">Qualification : </label> <input
									type="text" value="<%=doctor.getQualification() %>" required class="form-control" name="qualification">

							</div>
							<div class="mb-3">
								<label class="form-label">Specialist :</label> <select
									name="spec" required="required" class="form-control">

									<option><%=doctor.getSpecialist()%></option>


									<%
									SpecialistsDao dao = new SpecialistsDao(DbConnection.getConnection());
									List<Specialists> list = dao.getAllSpecialist();
									for (Specialists s : list) {
									%>

									<option><%=s.getSpecialistName()%></option>

									<%
									}
									%>


								</select>

							</div>

							<div class="mb-3">
								<label class="form-label">Email : </label> <input type="email"
									required class="form-control" value="<%=doctor.getEmail() %>"  name="email">

							</div>

							<div class="mb-3">
								<label class="form-label">Mobile Number : </label> <input
									type="text" required value="<%=doctor.getMobNo() %>" class="form-control" name="mobile">

							</div>

							<div class="mb-3">
								<label class="form-label">Password : </label> <input
									type="password" value="<%=doctor.getPassword() %>" required class="form-control" name="password">

							</div>
							
							<input type="hidden" name="id" value="<%= doctor.getId()%>">

							<button type="submit" class="btn btn-secondary">UPDATE</button>

						</form>


					</div>


				</div>

			</div>



		</div>



	</div>


	<%@ include file="../js.jsp"%>

</body>
</html>