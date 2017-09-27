<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<c:url value="/img/wumbo-icon.png"/>" />

<!-- Web Page CSS style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/css/Register.css"/>" />

<!-- Web Page JS -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<c:url value="/js/Register.js"/>"></script>

<!-- Web Page Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>

<title>Registration</title>
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
				<h3>Registration</h3>
				<form class="form-horizontal" method="post" action="Register">

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

					<div class="row" id="userValidation" style="display: none;">
						<div class="col-sm-12">
							<span id="pwmatch01" class="glyphicon glyphicon-ok"
								style="color: #FF0004;"></span> <span id="availableUser"></span>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Your
							Email</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="text" class="form-control" name="email" id="email"
									placeholder="Enter your Email" required />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="cin" class="cols-sm-2 control-label">Your CIN</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="cin" id="cin" placeholder="Enter your CIN" required />
							</div>
						</div>
					</div>

					<div class="row" id="cinValidation" style="display: none;">
						<div class="col-sm-12">
							<span id="pwmatch02" class="glyphicon glyphicon-ok"
								style="color: #FF0004;"></span> <span id="availableCIN"></span>
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

					<div class="form-group">
						<label for="confirm" class="cols-sm-2 control-label">Confirm
							Password</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="confirm"
									id="confirm" placeholder="Confirm your Password" required />
							</div>
						</div>
					</div>

					<div class="row" id="matching" style="display: none;">
						<div class="col-sm-12">
							<span id="pwmatch" class="glyphicon glyphicon-ok"
								style="color: #FF0004;"></span> <span id="passMatch"></span>
						</div>
					</div>

					<div class="form-group ">
						<input type="submit" name="submit"
							class="btn btn-primary btn-lg btn-block login-button"
							value="Register" />
					</div>
					<div class="login-register">
						<a href="Login">Login</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>