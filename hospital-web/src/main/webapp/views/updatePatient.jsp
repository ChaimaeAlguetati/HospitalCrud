<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@page import="com.hospital.is.entity.Patient"%>
<%@page import="com.hospital.is.repository.impl.PatientRespositoryImpl"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">


<title>Update Patient</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">TetouanHospital</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> PatientManagement </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Show Patients</a> <a
							class="dropdown-item" href="#">Add Patient</a>
					</div></li>
			</ul>
		</div>
	</nav>
	  <div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
    <section class="content-header sty-one">
      <h1 class="text-black"></h1>
    
    </section>
	<section class="content">
		<div class="row">
			<div class="col-md-8  offset-md-1">
				<div class="card card-outline">
					<div class="card-header bg-blue">
						<h5 class="text-black m-b-0">Update patient ${patient.id}</h5>
					</div>
					            <%
                int id = Integer.parseInt(request.getParameter("id"));
					            PatientRespositoryImpl patientRespositoryImpl=new PatientRespositoryImpl();
                Patient patient = patientRespositoryImpl.findByid(id);
            %>
					<div class="card-body">
						<form method="post" action="../UpdatePatient">
						 <input type="hidden"  class="form-control"
									name="id" value="<%=patient.getId() %>" placeholder="Enter your firstName">
							<div class="form-group">
								<label>FirtName </label> <input type="text"  class="form-control"
									name="firstName" value="<%=patient.getFirstName() %>" placeholder="Enter your firstName">
							</div>
							<div class="form-group">
								<label>LastName</label> <input type="text" value="<%=patient.getLastName() %>" class="form-control"
									name="lastName" placeholder="Enter your lastName">
							</div>
							<div class="form-group">
								<label>Address</label> <input type="text"  value="<%=patient.getAddress() %>" class="form-control"
									name="address" placeholder="Enter your address">
							</div>
							<div class="form-group">
								<label>Phone</label> <input type="text"  value="<%=patient.getPhone() %>" class="form-control"
									name="phone" placeholder="Enter your Phone number">
							</div>
							<div class="form-group">
								<label>BirthDate</label> <input type="text" value="<%=patient.getBirthdate() %>" class="form-control"
									name="birthdate" placeholder="Enter your birthDate">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>
						</div></div></div></div></section></div>
</body>
</html>