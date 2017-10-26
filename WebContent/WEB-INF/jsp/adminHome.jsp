<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function stopStudent() {
	var x = document.getElementById("studentInfoDisplay");
	
	x.display == "none";
}

function courseFunction() {
    var x = document.getElementById("courseInfoDisplay");
    var y = document.getElementById("studentInfoDisplay");
    
    if (x.style.display === "none"&& y.style.display === "block") {
		y.style.display = "none";
		x.style.display = "block";
	} else if (x.style.display === "none" && y.style.display === "none") {
		x.style.display = "block";
	} else {
		x.style.display = "none";
	}
}

function studentFunction() {
	var x = document.getElementById("studentInfoDisplay");
	var y = document.getElementById("courseInfoDisplay");
	if (x.style.display === "none" && y.style.display === "block") {
		y.style.display = "none";
		x.style.display = "block";
	} else if (x.style.display === "none" && y.style.display === "none") {
		x.style.display = "block";
	} else {
		x.style.display = "none";
	}
}

</script>

<link rel="stylesheet" href="css/adminStyle.css"></link>

		<title>Welcome Admin</title>
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
    <span class="navbar-text">
      Log Out
    </span>
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
			Admin Admin</h3>
		</div>
	</div>
	
	<div class="col-9">
	<div class="btn-group btn-group-lg" role="group" aria-label="Toolbar with button groups">
		<button class="btn btn-secondary" onclick="studentFunction()">Student</button>
		<button class="btn btn-secondary" onclick=" courseFunction()">Courses</button>
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