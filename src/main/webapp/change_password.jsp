<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHANGE PASSWORD</title>
<%@ include file="css.jsp"%>
<%@ include file="fonts.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	
	
	<c:if test="${empty userObj }">
	  <c:redirect url="user.jsp"></c:redirect>
	      
	</c:if>

	<div class="container">
		<div class="card mt-5 p-3">

			<p class="fw-bold fs-3 text-center">CHANGE PASSWORD</p>

			<c:if test="${not empty successMessage}">
				<p class="text-center text-success small fw-bold">${successMessage}</p>
				<c:remove var="successMessage" />
			</c:if>

			<c:if test="${not empty errorMessage}">
				<p class="text-center text-danger small fw-bold">${errorMessage}</p>
				<c:remove var="errorMessage" />
			</c:if>



			<div class="card-body">

				<form action="userPassword" method="post">

					<div class="mb-3">

						<label>Enter New Password </label> <input type="text"
							class="form-control" name="newPassword" required="required">
					</div>

					<div class="mb-3">

						<label>Enter Old Password </label> <input type="text"
							class="form-control" name="oldPassword" required="required">
					</div>

					<input type="hidden" name="id" value="${userObj.id}">

					<button type="submit" class="btn btn-small btn-secondary">CHANGE
						PASSWORD</button>

				</form>


			</div>



		</div>



	</div>


	<%@ include file="js.jsp"%>
</body>
</html>