<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid" >
    <a class="navbar-brand" href="index.jsp"> <i class="ms-2 fa-solid fa-hospital me-2"></i>SCC</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      
      <c:if test="${empty userObj}">
      
       <li class="nav-item">
          <a class="nav-link active small fw-bold" aria-current="page" href="admin.jsp">ADMIN</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active small fw-bold" aria-current="page" href="doctor.jsp">DOCTOR</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active small fw-bold" aria-current="page" href="appointment.jsp">APPOINTMENT</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active small fw-bold" aria-current="page" href="user.jsp">USER</a>
        </li>  
        
      
      
      </c:if>
      
       
        <c:if test="${not empty userObj}">
        
         <li class="nav-item">
          <a class="nav-link active small fw-bold" aria-current="page" href="appointment.jsp">BOOK APPOINTMENT</a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link active small fw-bold" aria-current="page" href="view_appointment.jsp">VIEW APPOINTMENTS</a>
        </li>
        
        <li class="nav-item small dropdown fw-bold text-uppercase">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            ${userObj.fullName}
          </a>
          <ul class="dropdown-menu">
            <li><a class="small fw-bold  dropdown-item" href="change_password.jsp">CHANGE PASSWORD</a></li>
            <li><a class="small fw-bold dropdown-item" href="user-logout">LOGOUT</a></li>
           
          </ul>
        </li>
        
        
        </c:if>
        
      </ul>
    </div>
  </div>
</nav>
