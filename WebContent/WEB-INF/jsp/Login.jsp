<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="shortcut icon" href="<c:url value="/img/wumbo-icon.png"/>" />

<!-- Website CSS style -->
<link rel="stylesheet" href="<c:url value="/css/Register.css"/>" />

<!-- Web Page JS -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<c:url value="/js/Login.js"/>"></script>

<!-- Website Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>

<title>Login</title>
</head>
<body>
	<div class="container">
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
					<h1 class="title">
						<b>W</b>eb-<b>U</b>ser <b>M</b>ajor-<b>B</b>ound <b>O</b>rganizer
					</h1>
					<hr />
				</div>
			</div>
			<div class="main-login main-center">
				<h3>Login</h3>
				<form class="form-horizontal" method="post" action="Login">

					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label">Username</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="username" id="username" placeholder="Enter your Username"
									required />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="cols-sm-2 control-label">Password</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="password"
									id="password" placeholder="Enter your Password" required />
							</div>
						</div>
					</div>
					
					<div class="row" id="matching" style="display: none;">
						<div class="col-sm-12">
							<span id="pwmatch" class="glyphicon glyphicon-remove"
								style="color: #FF0004;"></span> Wrong Username or Password
						</div>
					</div>

					<div class="form-group ">
						<button type="submit"
							class="btn btn-primary btn-lg btn-block login-button">Login</button>
					</div>
					<div class="login-register">
						<a href="Register">Go Back</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>