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
<title>REGISTER</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center fw-bold">USER SIGNUP</p>

						<c:if test="${not empty successMessage}">
							<p class="text-center text-success small fw-bold">${successMessage}</p>
							<c:remove var="successMessage" />
						</c:if>

						<c:if test="${not empty errorMessage}">
							<p class="text-center text-danger small fw-bold">${errorMessage}</p>
							<c:remove var="errorMessage" />
						</c:if>

						<form action="user-register" method="post">
							<div class="mb-3">
								<label class="form-label small fw-bold">FULL NAME : </label> <input
									name="name" type="text" class="form-control"
									required="required">
							</div>
							<div class="mb-3">
								<label class="form-label small fw-bold">EMAIL : </label> <input
									name="email" type="email" class="form-control"
									required="required">
							</div>
							<div class="mb-3">
								<label class="form-label small text-sm fw-bold">PASSWORD
									: </label> <input type="password" class="form-control" name="password"
									required="required">
							</div>
							<button type="SUBMIT"
								class="btn p-2 btn-dark small fw-bold text-white mt-2 mb-2 col-md-12 btn-sm">SIGNUP</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="js.jsp"%>
</body>
</html>