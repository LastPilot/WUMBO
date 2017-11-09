<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/css/Home.css"/>" />

<!-- JS files -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<c:url value="/js/Admin.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/js/profilePicture.js"/>"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="<c:url value="/img/wumbo-icon.png"/>" />
<title>${user.name}'s Home</title>
</head>
<body>

	<div class="center">
		<div class="editForm">
			<div class="formBox">
				<form action="#" method="Post">
				Change the coordinator for the course.	
				<input	type='text' name='coordinator' placeholder="Change Coordinator"><hr>
				<label for="available">Is the class closed?</label>
				<input type="radio" name="a" id="available" value="available" /><hr>
				<input type="submit" name="submit" value="Submit"  id="submit" class="btn btn-primary btn-sm" />
				<hr> <a class="alink" id="cancel">Cancel</a>
				</form>
			</div>			
		</div>
	</div>

	<div class="goldBackground">

		<!-- Top Right Logo -->
		<a href="http://www.calstatela.edu/"> <img
			src="http://www.calstatela.edu/sites/default/files/groups/Mind%20Matters/brand_logo_homepage.png"
			style='width: 300px; display: inline-block;' />
		</a>
		<h1 class="title" style="display: inline-block;">
			<b>W</b>eb-<b>U</b>ser <b>M</b>ajor-<b>B</b>ound <b>O</b>rganizer
		</h1> <br>

		<!--nav bar-->
		<nav class="navbar navbar-inverse navbar-static-top marginBottom-0"
			role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle"
						data-target="#navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>

					</button>
					<a class="navbar-brand" href="#">Home</a> <a class="navbar-brand"
						href="#">Courses</a> <a class="navbar-brand" href="#">Road Map</a>
				</div>

				<!-- Logout Button -->
				<div class="logout" class="profile-userbuttons">
					<form action="Logout" method="post">
						<input class="btn btn-danger btn-sm" type="submit" value="Logout" />
					</form>

				</div>
			</div>
		</nav>

		<!-- Profile Picture -->
		<div class="container">
			<div class="row profile">
				<div class="col-md-3">
					<div class="profile-sidebar">
						<img class="profile img-circle"
							onerror="if (this.src != 'http://pasp.org.pk/assets/img/pic.png') this.src = 'http://pasp.org.pk/assets/img/pic.png';"
							src=<c:url value="/img/profile/${user.cin}.jpg" />> <br>
						<br>
						<button class="btn btn-success" id="updatePic">Update
							Picture</button>
						<form class="Home" method="Post" action="UploadController"
							enctype="multipart/form-data" id="uploadPic">
							<br> <input type="file" name=file value="select image..." />
							<input class="btn btn-sm btn-primary" type="submit"
								value="Upload" /> <br>
							<br>
						</form>
						<!-- Students Info -->
						<div class="profile-usertitle">
							<div class="profile-usertitle-name">
								<h3>
									Welcome, <br> <strong><c:out value="${user.name}"></c:out></strong>
								</h3>
							</div>
							<hr>
							<h4>
								Email:
								<c:out value="${user.email}"></c:out>
							</h4>
							<hr>
							<h4>
								CIN:
								<c:out value="${user.cin}"></c:out>
							</h4>
						</div>
					</div>
				</div>

				<!-- Courses Students want to take -->
				<div class="col-md-9">
					<div class="profile-content">
						<div class="col-9">
							<div style="text-align: center;">
								<div class="btn-group btn-group-lg" role="group"
									aria-label="Toolbar with button groups">
									<button class="btn btn-primary" id="studentTable">
										Student</button>
									<button class="btn btn-secondary" id="courseTable">
										Courses</button>
								</div>
							</div>
							<div id="courseInfoDisplay">
								<table
									class="table table-striped table-hover table-bordered table-condensed">
									<thead>
										<tr>
											<th>Code</th>
											<th>Name</th>
											<th>Units</th>
											<th>Coordinator</th>
											<th>Available</th>
											<th>Semester</th>
											<th>Prerequisites</th>
										</tr>
									</thead>
									<c:forEach items="${courses}" var="course">
										<tr>
											<td><a id="toggleForm" class="alink">${course.code}</a></td>
											<td>${course.name}</td>
											<td>${course.units}</td>
											<td>${course.coordinator}</td>
											<td><c:choose>
													<c:when test="${course.available}">
														<span class="glyphicon glyphicon-ok"
															style="color: #00A41E;"></span>
													</c:when>
													<c:otherwise>
														<span class="glyphicon glyphicon-remove"
															style="color: #FF0004;"></span>
													</c:otherwise>
												</c:choose></td>
											<td>${course.semester}</td>
											<td>${course.prerequisites}</td>
										</tr>
									</c:forEach>
								</table>
							</div>

							<div id="studentInfoDisplay">
								<table
									class="table table-striped table-hover table-bordered table-condensed">
									<thead>
										<tr>
											<th>CIN</th>
											<th>Name</th>
											<th>Email</th>
											<th>GPA</th>
										</tr>
									</thead>
									<c:forEach items="${students}" var="student">
										<tr>
											<td>${student.cin}</td>
											<td>${student.name}</td>
											<td>${student.email}</td>
											<td>${student.gpa}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">&copy; Kristen Marenco, Luis Gonzales, Franky
		Gudino, Roi Chico 2017. All Rights Reserved.</div>
</body>
</html>