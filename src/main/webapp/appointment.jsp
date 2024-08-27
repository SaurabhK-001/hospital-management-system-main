<%@page import="com.entities.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="css.jsp"%>
<%@ include file="fonts.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<title>USER APPOINTMENT</title>
</head>
<body>
<%@include file="navbar.jsp"%>

<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center fw-bold">BOOK APPOINTMENT</p>

						<c:if test="${not empty successMessage}">
							<p class="text-center text-success small fw-bold">${successMessage}</p>
							<c:remove var="successMessage" />
						</c:if>

						<c:if test="${not empty errorMessage}">
							<p class="text-center text-danger small fw-bold">${errorMessage}</p>
							<c:remove var="errorMessage" />
						</c:if>

						<form action="addAppointment" method="post">
						
							<input type="hidden" name="userId" value="${userObj.id}">
						
							<div class="mb-3">
								<label class="form-label small fw-bold">FULL NAME : </label> <input
									name="name" type="text" class="form-control"
									required="required">
							</div>
							
							<div class="mb-3">
								<label>Gender</label>
								<select class="form-control" name="gender" required>
								 
								 <option value="male">Male</option>
								 <option value="female">Female</option>
								  
								</select>
								
							</div>
							
							<div class="mb-3">
								<label class="form-label small text-sm fw-bold">Date
									: </label> <input type="date" class="form-control" name="appoint_date"
									required="required">
							</div>
							
							<div class="mb-3">
								<label class="form-label small text-sm fw-bold">Age
									: </label> <input type="number" class="form-control" name="age"
									required="required">
							</div>
							
							<div class="mb-3">
								<label class="form-label small text-sm fw-bold">Email
									: </label> <input type="email" class="form-control" name="email"
									required="required">
							</div>
							
							<div class="mb-3">
								<label class="form-label small text-sm fw-bold">Phone Number
									: </label> <input type="text" class="form-control" name="phno"
									required="required">
							</div>
							
							<div class="mb-3">
								<label class="form-label small text-sm fw-bold">Disease
									: </label> <input type="text" class="form-control" name="disease"
									required="required">
									
		
							</div>
							
							
							<div class="mb-3">
								<label class="form-label small text-sm fw-bold">Doctor
									: </label>
									
									<select required class="form-control" name="doct">
									<option value="">--select--</option>
									
									<%
									
									DoctorDao dao = new DoctorDao(DbConnection.getConnection());
									List<Doctor> list = dao.getAllDoctors();
									
									for(Doctor d : list)
									{
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%= d.getSpecialist() %>) </option>
									<% 
									}
									%>
									
									
								
									
									
									
									
									</select>
							</div>
							
							<div class="mb-3">
								<label class="form-label small text-sm fw-bold">Address
									: </label> <input type="text" class="form-control" name="address"
									required="required">
							</div>
							
							<c:if test="${empty userObj }">
							  <a href="user.jsp" class="btn btn-success">SUBMIT</a>
							
							</c:if>
							
							
							<c:if test="${not empty userObj }">
							  <button class="btn btn-success">SUBMIT</button>
							
							</c:if>
							
						
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

<%@ include file="js.jsp"%>
</body>
</html>