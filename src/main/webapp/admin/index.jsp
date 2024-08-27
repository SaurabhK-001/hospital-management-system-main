<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN DASHBOARD</title>
<%@ include file="../css.jsp"%>
<%@ include file="../fonts.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

</head>
<body style="background: #e2e2e2;">
	<%@ include file="navbar.jsp"%>

	<c:if test="${empty adminObj}">
		<c:redirect url="../admin.jsp"></c:redirect>

	</c:if>


	<div class="container p-5">

		<p class="text-center fs-3 fw-bold mb-5">ADMIN DASHBOARD</p>
		<c:if test="${not empty successMessage}">
			<p class="text-center text-success small fw-bold">${successMessage}</p>
			<c:remove var="successMessage" scope="session" />
		</c:if>

		<c:if test="${not empty errorMessage}">
			<p class="text-center text-danger small fw-bold">${errorMessage}</p>
			<c:remove var="errorMessage" scope="session" />
		</c:if>

       <%
       DoctorDao dao = new DoctorDao(DbConnection.getConnection());
       
       
       %>

		<div style="cursor: pointer;" class="row">
			<div class="col-md-6">
				<div class="card ">
					<div class="card-body text-success text-center text-secondary">
						<i class="fas fa-user-md fa-2x"></i><br>
						<p class="fs-4 text-dark fw-bold text-center">DOCTORS 
						<br>
						  <%= dao.countDoctor() %>
						</p>
						
					</div>
				</div>
			</div>
			
			<div style="cursor: pointer;" class="col-md-6">
				<div class="card ">

					<div class="card-body text-success text-center text-secondary">
						<i class="fas fa-user-circle fa-2x"></i><br>
						<p class="fs-4 fw-bold text-dark text-center">USERS
						<br>
						<%= dao.countUser() %>
						</p>
						
					</div>
				</div>
			</div>

			<div style="cursor: pointer;" class="col-md-6 mt-2">
				<div class="card ">

					<div class="card-body text-success text-center text-secondary">
						<i class="far fa-calendar-check fa-2x"></i><br>
						<p class="fs-4 fw-bold text-dark text-center">APPOINTMENTS
						<br>
						<%= dao.countAppointment() %>
						</p>
						
					</div>
				</div>
			</div>

			<div style="cursor: pointer;" class="col-md-6 mt-2">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">

					<div class="card-body text-success  pe-auto text-center text-secondary">
						<i class="fas fa-calendar-check fa-2x"></i><br>
						<p class="fs-4 fw-bold text-dark text-center">SPECIALISTS
						<br>
						<%= dao.countSpecialist() %>
						
						</p>
						
					</div>
				</div>
			</div>
		</div>

                     
                     



	</div>


	<!-- Modal -->
	<div class="modal fade " id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5  small fw-bold" id="exampleModalLabel">ADD</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body small fw-bold text-uppercase">
					<form action="../add-specialist" method="post">

						<div class="form-group">

							<div class="mb-3">
								<label class="form-label small fw-bold">SPECIALISTS NAME : </label> <input
									name="spec_name" type="text" class="form-control"
									required="required">

							</div>
							<button type="submit" class="small fw-bold text-uppercase btn-dark">SUBMIT</button>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button"
						class=" small fw-bold text-uppercase btn-secondary"
						data-bs-dismiss="modal">CLOSE</button>
					
				</div>
				
			</div>
		</div>
	</div>


	<%@ include file="../js.jsp"%>

</body>
</html>