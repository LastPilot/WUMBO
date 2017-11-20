<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<c:url value="/img/wumbo-icon.png"/>" />
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css ">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Website CSS style -->
<link rel="stylesheet" href="<c:url value="/css/courses.css"/>" />

<!-- Website Font style -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

<title>${user.name}'s Courses</title>
</head>
<body>

	<!-- Insert menu here as well as logout for user -->
	<div class="header">
		<!-- Top Right Logo -->
		<a href="http://www.calstatela.edu/"> <img
			src="http://www.calstatela.edu/sites/default/files/groups/Mind%20Matters/brand_logo_homepage.png"
			style='width: 300px; display: inline-block;' />
		</a>
		<h1 class="title" style="display: inline-block;">
			<b>W</b>eb-<b>U</b>ser <b>M</b>ajor-<b>B</b>ound <b>O</b>rganizer
		</h1> <br>
	</div>

	<nav class="navbar navbar-static-top navbar-inverse marginBottom-0"
		role="navigation">
		<div class="container-fluid">
			<div class="navbar-header ">

				<a class="navbar-brand" href="Home">Home</a> <a
					class="navbar-brand active" href="#">Courses</a>	


			</div>

			<div class="logout" class="profile-userbuttons" align="Right">
				<form action="Logout" method="post">
					<input class="btn btn-link " type="submit" value="Logout" />
				</form>
			</div>
		</div>
	</nav>



	<!-- List of courses (in database)-->
	<div class="container">
		<table
			class="table table-striped table-hover table-bordered table-condensed">
			<tr>
				<th>Code</th>
				<th>Name</th>
				<th>Units</th>
				<th>Coordinator</th>
				<th>Semester</th>
				<th>Prerequisites</th>
			</tr>

			<c:forEach items="${courses}" var="course">
				<tr>
					<td>${course.code}</td>
					<td>${course.name}</td>
					<td>${course.units}</td>
					<td>${course.coordinator}</td>
					<td>${course.semester}</td>
					<td>${course.prerequisites}</td>
				</tr>
			</c:forEach>
		</table>
	</div>



	<div class="footer">&copy; Kristen Marenco, Luis Gonzales, Franky
		Gudino, Roi Chico 2017. All Rights Reserved.</div>

</body>
</html>