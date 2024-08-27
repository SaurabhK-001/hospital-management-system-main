<%@page import="com.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME PAGE</title>
<%@ include file="css.jsp"%>
<%@ include file="fonts.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<style>

body{
background: #e2e2e2;
}

/* Style the scrollbar */
::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-thumb {
    background-color: black;
}

::-webkit-scrollbar-track {
    background-color: white; /* You can adjust this if you want a different color for the track */
}

.carousel-item img {
	height: 600px; /* Set the desired height */
	object-fit: cover; /* Maintain aspect ratio */
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	
	<%-- <%Connection connection = DbConnection.getConnection();
	out.println(connection); to test connection only
	%> --%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="./img/pexels-jmeyer1220-668298.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="./img/pexels-rdne-6129045.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="./img/pexels-andre-124356440-11722768.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>



	<div class="container p-4 mt-3">
    <p class="text-center fs-3 fw-bold">KEY FEATURES</p>
    <div class="row mt-5">
        <div class="col-md-6">
            <div class="card paint-card">
                <div class="card-body">
                    <h5 class="card-title">Advanced Technology Integration</h5>
                    <p class="card-text">Harness the power of cutting-edge technology to streamline your workflow and enhance productivity.</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card paint-card">
                <div class="card-body">
                    <h5 class="card-title">Personalized User Experience</h5>
                    <p class="card-text">Tailor the platform to meet your specific needs and preferences, ensuring a seamless and personalized user experience.</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 mt-4">
            <div class="card paint-card">
                <div class="card-body">
                    <h5 class="card-title">Enhanced Security Measures</h5>
                    <p class="card-text">Implement robust security protocols to safeguard your data and protect against potential threats and vulnerabilities.</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 mt-4">
            <div class="card paint-card">
                <div class="card-body">
                    <h5 class="card-title">Seamless Integration</h5>
                    <p class="card-text">Integrate seamlessly with existing systems and third-party applications to maximize efficiency and connectivity.</p>
                </div>
            </div>
        </div>
    </div>
</div>




<%@ include file="footer.jsp"%>

	<%@ include file="js.jsp"%>
</body>
</html>