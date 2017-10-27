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
<script type="text/javascript"
	src="<c:url value="/js/profilePicture.js"/>"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="<c:url value="/img/wumbo-icon.png"/>" />
<title>${user.name}'s Home</title>
</head>
<body>

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
						href="Courses">Courses</a> <a class="navbar-brand" href="#RoadMap">Road
						Map</a>
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
							src=<c:url value="/img/profile/${user.cin}.jpg" />> <br> <br>
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
							<hr>
							<h4>
								GPA:
								<c:out value="${user.gpa}"></c:out>
							</h4>

						</div>



					</div>
				</div>

				<!-- Courses Students want to take -->
				<div class="col-md-9">
					<div class="profile-content">
						Some user related content goes here... <br> <br>
						<table>
							<tr>
								<th>Class ID</th>
								<th>Course</th>
								<th>Professor</th>
								<th>Time</th>
							</tr>
							<tr bgcolor="LIGHTGRAY">
								<td>a</td>
								<td>a</td>
								<td>a</td>
								<td>a</td>
							</tr>
						</table>
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">&copy; Kristen Marenco, Luis Gonzales, Franky
		Gudino, Roi Chico 2017. All Rights Reserved.</div>
</body>
</html>