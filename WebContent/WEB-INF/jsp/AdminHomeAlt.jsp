<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<c:url value="/img/wumbo-icon.png"/>" />

<!-- JS files -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<c:url value="/js/Admin.js"/>"></script>

<link rel="stylesheet" href="css/adminStyle.css"></link>

		<title>${user.name}'s Home</title>
	</head>

	<body>

	<div class="header_logo">
		<img class="img_logo" src="http://staticx.ibncollege.com/wcsstore/calstate-la/images/logo.jpg">
	</div>
	
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Students</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Help</a>
      </li>
    </ul>
    <div class="logout" class="profile-userbuttons" align="Right">
		<form action="Logout" method="post">
			<input class="btn btn-danger btn-sm" type="submit" value="Logout" />
		</form>
	</div>
  </div>
</nav>
	
<div class="row">
	<div class="col-3">
		<div class="admin_info">
			<img src="http://pasp.org.pk/assets/img/pic.png">
			<br>
			<br>
			<h3>Welcome,
			<br>
			${user.name}</h3>
		</div>
	</div>
	
	<div class="col-9">
	<div class="btn-group btn-group-lg" role="group" aria-label="Toolbar with button groups">
		<button class="btn btn-secondary" id="studentTable"><!-- onclick="studentFunction()" -->Student</button>
		<button class="btn btn-secondary" id="courseTable"><!-- onclick=" courseFunction()" -->Courses</button>
	</div>
		<div id="courseInfoDisplay">
			<table class="table table-dark">
  			<thead>
    				<tr>
					<th scope="col">Code</th>
					<th scope="col">Semester</th>
					<th scope="col">Available</th>
				</tr>
				</thead>
			</table>
		</div>
		
		<div id="studentInfoDisplay">
			<table class="table table-dark">
  			<thead>
    				<tr>
					<th scope="col">CIN</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">GPA</th>
				</tr>
				</thead>
			</table>
		</div>
	</div>
</div>



	</body>
</html>