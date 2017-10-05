<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang ="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		
		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="assets/css/main.css">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Courses</title>
	</head>
	<body>
		<!-- Insert menu here as well as logout for user -->
		
		<h1 class="title">Computer Science Courses</h1>
		
		<!-- List of courses (in database)-->
		<table>
			<tr>
			    <th>Code </th>	
			    <th>Name </th>	
			    <th>Units </th>	
			    <th>Coordinator </th>	
			    <th>Available This Semester </th>	
			</tr>
			
			<c:forEach items="${courses}" var="course">
			<tr>
				<td>${course.code}</td>
				<td>${course.name}</td>
				<td>${course.units}</td>
				<td>${course.coordinator}</td>
				<td>${course.available}</td>
			</tr>
			</c:forEach>
		</table>
		
		<hr> 
		
		<div class="footer"> &copy; Kristen Marenco, Luis Gonzales, Franky Gudino, Roi Chien 2017. All Rights Reserved. </div>
		
	</body>
	
	<style> 
		body, html{
		    height: 100%;
		 	background-repeat: no-repeat;
		 	background-color: #d3d3d3;
		 	font-family: 'Oxygen', sans-serif;
		}
		table {
			border: 5px;
		}
		h1.title { 
			font-size: 50px;
			font-family: 'Passion One', cursive; 
			font-weight: 400; 
			text-align: left;
		}	
		hr {
			width: 10%;
			color: #fff;
		}
		.footer {
			background-color: #d0d0d0;
			text-align: center;
		}
	</style>
	
	
	
</html>