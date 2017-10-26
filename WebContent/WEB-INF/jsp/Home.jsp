<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value="/css/Home.css"/>" />
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="<c:url value="/img/wumbo-icon.png"/>" />
<title>${user.name} Home</title>
</head>
<body>
	
		<div class= "goldBackground">
		
		<!-- Top Right Logo -->
			<a href="http://www.calstatela.edu/"> 
			<img src="http://www.calstatela.edu/sites/default/files/groups/Mind%20Matters/brand_logo_homepage.png" style='width: 300px;' /> <br> <br>
			</a>
			
			<!--nav bar-->
			<nav class="navbar navbar-inverse navbar-static-top marginBottom-0" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle"
						data-target="#navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> 
						
					</button>
					 <a class="navbar-brand" href="Home">Home</a> <a
						class="navbar-brand" href="#">Courses</a> 
				</div>
				
				<!-- Logout Button -->
				<div class="logout" class="profile-userbuttons">
					<form action="Logout" method="post">
						<input class="btn btn-danger btn-sm" type="submit" value="Logout" />
					</form>

				</div>
			</nav>
			
			<!-- Profile Picture -->
			<div class="container">
				<div class="row profile">
					<div class="col-md-3">
						<div class="profile-sidebar">
							<img class="profile" src=<c:url value="/WEB-INF/ProfilePics/${user.cin}.jpg" />> <br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<form class ="Home" method="Post" action="${pageContext.request.contextPath}/UploadController" enctype="multipart/form-data">
								<input type="file" name=file value="select image..." /> 
								<input type="submit" value="start upload" />
							</form> 
							<br>
							<br>
							<!-- Students Info -->
							<div class="profile-usertitle">
								<div class="profile-usertitle-name">
									<h1>
										Welcome <br>
										<c:out value="${user.name}"></c:out>
									</h1>
									<br>
								</div>
								<h4>
									Email:
									<c:out value="${user.email}"></c:out>
								</h4>
								<br>
								<h4>
									CIN:
									<c:out value="${user.cin}"></c:out>
								</h4>
								<br>
								<h4>
									GPA:
							
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
						<br> <br> <br> <br> <br>
					</div>
				</div>
			</div>
		</div>
</body>
</html>