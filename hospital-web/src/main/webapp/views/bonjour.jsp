<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>


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


<title>Bonjour</title>
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
		<section class="content-header sty-one">
			<ol class="breadcrumb">

				<li class="text-black">List of Patients</li>


			</ol>
		</section>
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<a class="btn btn-dark"
						href="<c:url value="/views/createPatient.jsp"/>"><i
						class="fas fa-plus"></i> Add a patient</a> <br> <br>
			
					<table class="table table-dark">
						<thead>
							<tr>

								<th scope="col">#</th>
								<th scope="col">FirstName</th>
								<th scope="col">LastName</th>
								<th scope="col">Actions</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${listPatient}" var="patient">

								<tr>
									<th scope="row">${patient.id}</th>
									<td>${patient.firstName}</td>
									<td>${patient.lastName}</td>
									<td><a class="btn btn-primary"
										href="<c:url value="/views/updatePatient.jsp?id=${patient.id}"/>"><i
											class="fas fa-edit"></i> </a> <a class="btn btn-secondary"
										href="${pageContext.request.contextPath}/deletePatient?id=${patient.id }"
										onclick="return confirm('Are you sure  you want to delete this patient?')"><i
											class="fas fa-trash-alt"></i></a>

										<button type="button" class="btn btn-success"
											data-toggle="modal" data-target="#exampleModal-${patient.id}">
											<i class="far fa-address-card"></i>
										</button></td>

								</tr>
								<div class="modal fade" id="exampleModal-${patient.id}"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Patient
													Details</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="card">
													<div class="card-header">Full Name:
														${patient.firstName}&nbsp;${patient.lastName}</div>
													<div class="card-body">
														<p class="card-text">
															<i class="fa fa-phone-square"></i>&nbsp;&nbsp;Phone
															Number : ${patient.phone}
														</p>
														<p class="card-text">
															<i class="fa fa-map-marker"></i>&nbsp;&nbsp;Address:
															${patient.address}
														</p>
														
														<p class="card-text">
															<i class="far fa-address-card"></i>&nbsp;&nbsp;birthDate
															: ${patient.birthdate}
														</p>

													</div>
												</div>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>


						</tbody>

					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>