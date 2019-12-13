<%@ page language="java" session="true"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Profile - AMS</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
</head>

<body id="page-top">
	<div id="wrapper">
		<nav
			class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
			<div class="container-fluid d-flex flex-column p-0">
				<a
					class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0"
					href="#">
					<div class="sidebar-brand-icon rotate-n-15">
						<i class="fas fa-laugh-wink"></i>
					</div>
					<div class="sidebar-brand-text mx-3">
						<span>AMS</span>
					</div>
				</a>
				<hr class="sidebar-divider my-0">
				<ul class="nav navbar-nav text-light" id="accordionSidebar"></ul>
				<div class="text-center d-none d-md-inline">
					<button class="btn rounded-circle border-0" id="sidebarToggle"
						type="button"></button>
				</div>
			</div>
		</nav>
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">
				<nav
					class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle mr-3"
							id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						<ul class="nav navbar-nav flex-nowrap ml-auto">

							<li role="presentation" class="nav-item dropdown no-arrow mx-1">
								<div class="nav-item dropdown no-arrow">
									<a role="presentation"  aria-expanded="false" href="takeAttendance.jsp"
											class="dropdown-toggle nav-link">Take Attendance</a>
								</div>
							</li>

							<li role="presentation" class="nav-item dropdown no-arrow mx-1">
								<div class="nav-item dropdown no-arrow">
									<a role="presentation"  aria-expanded="false" href="generateReport.jsp"
											class="dropdown-toggle nav-link">Attendance Report</a>
								</div>
							</li>
							<div class="d-none d-sm-block topbar-divider"></div>
							<li role="presentation" class="nav-item dropdown no-arrow">
								<div class="nav-item dropdown no-arrow">
									<a data-toggle="dropdown" aria-expanded="false"
										class="dropdown-toggle nav-link" href="#"><span
										class="d-none d-lg-inline mr-2 text-gray-600 small"><%=session.getAttribute("firstname")%></span><img
										class="border rounded-circle img-profile"
										src="assets/img/avatars/avatar5.jpeg" /></a>
									<div role="menu"
										class="dropdown-menu shadow dropdown-menu-right animated--grow-in">
										<a role="presentation" class="dropdown-item" href="updateProfileTeacher.jsp"><i
											class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>updateProfile</a><a
											role="presentation" class="dropdown-item" href="#"><i
											class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings</a>
										<a role="presentation" class="dropdown-item" href="selectSubject.jsp"><i
											class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>Select Subject</a>
										<div class="dropdown-divider"></div>
										<a role="presentation" class="dropdown-item" href="Logout"
											method="post" value="logout"><i
											class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</nav>
				<div class="container-fluid">
					<h3 class="text-dark mb-4">Profile</h3>
					<div class="row mb-3">
						<div class="col-lg-4">
							<div class="card mb-3">
								<div class="card-body text-center shadow">
									<img class="rounded-circle mb-3 mt-4"
										src="assets/img/dogs/image2.jpeg" width="160" height="160">
								</div>
							</div>
												</div>
						<div class="col-lg-8">
							<div class="row mb-3 d-none">
								<div class="col">
									<div class="card text-white bg-primary shadow">
										<div class="card-body">
											<div class="row mb-2">
												<div class="col">
													<p class="m-0">Peformance</p>
													<p class="m-0">
														<strong>65.2%</strong>
													</p>
												</div>
												<div class="col-auto">
													<i class="fas fa-rocket fa-2x"></i>
												</div>
											</div>
											<p class="text-white-50 small m-0">
												<i class="fas fa-arrow-up"></i>&nbsp;5% since last month
											</p>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="card text-white bg-success shadow">
										<div class="card-body">
											<div class="row mb-2">
												<div class="col">
													<p class="m-0">Peformance</p>
													<p class="m-0">
														<strong>65.2%</strong>
													</p>
												</div>
												<div class="col-auto">
													<i class="fas fa-rocket fa-2x"></i>
												</div>
											</div>
											<p class="text-white-50 small m-0">
												<i class="fas fa-arrow-up"></i>&nbsp;5% since last month
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="card shadow mb-3">
										<div class="card-header py-3">
											<p class="text-primary m-0 font-weight-bold">User
												Details</p>
										</div>
										<div class="card-body">
											<form>

												<div class="form-row">
													<div class="col">
														<div class="form-group">
															<label for="first_name"><strong>First
																	Name</strong></label><input class="form-control" type="text"
																value=<%=session.getAttribute("firstname")%> disabled>
														</div>
													</div>
													<div class="col">
														<div class="form-group">
															<label for="last_name"><strong>Last Name</strong></label><input
																class="form-control" type="text"
																value=<%=session.getAttribute("lastname")%> disabled>
														</div>
													</div>
												</div>
												<div class="form-row">
													<div class="col">
														<div class="form-group">
															<label for="username"><strong>Username</strong></label><input
																class="form-control" type="text"
																value=<%=session.getAttribute("regno")%> disabled>
														</div>
													</div>
													<div class="col">
														<div class="form-group">
															<label for="dob"><strong>DOB</strong></label><input
																class="form-control" type="dob"
																value=<%=session.getAttribute("dob")%> disabled>
														</div>
													</div>
												</div>
												<div class="form-row">
													<div class="col">
														<div class="form-group">
															<label for="Department"><strong>Department</strong></label><input
																class="form-control" type="text"
																value=<%=session.getAttribute("department")%> disabled>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="card shadow">
										<div class="card-header py-3">
											<p class="text-primary m-0 font-weight-bold">Contact
												Details
												</p>
										</div>
										<div class="card-body">
											<form>
												<div class="form-row">
													<div class="col">
														<div class="form-group">
															<label for="MobileNo"><strong>Mobile No</strong></label><input
																class="form-control" type="text"
																value=<%=session.getAttribute("mobileno")%> disabled>
														</div>
													</div>
													<div class="col">
														<div class="form-group">
															<label for="email"><strong>Email</strong></label><input
																class="form-control" type="text"
																value=<%=session.getAttribute("email")%> disabled>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label for="address"><strong>Address</strong></label> <input
														class="form-control" type="text"
														value=<%=session.getAttribute("address")%> disabled>
												</div>
												<div class="form-row">
													<div class="col">
														<div class="form-group">
															<label for="city"><strong>City</strong></label><input
																class="form-control" type="text" value="Allahabad"
																disabled>
														</div>
													</div>
													<div class="col">
														<div class="form-group">
															<label for="country"><strong>Country</strong></label><input
																class="form-control" type="text" value="India" disabled>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card shadow mb-5"></div>
				</div>
			</div>
			<footer class="bg-white sticky-footer">
				<div class="container my-auto">
					<div class="text-center my-auto copyright">
						<span>Copyright © AMS 2019</span>
					</div>
				</div>
			</footer>
		</div>
		<a class="border rounded d-inline scroll-to-top" href="#page-top"><i
			class="fas fa-angle-up"></i></a>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
	<script src="assets/js/theme.js"></script>
</body>

</html>