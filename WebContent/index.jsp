
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<!-- ================================================================================================================ -->
<!--css start-->

<link href="css/Mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}
</style>

<!--css end-->
<!-- ================================================================================================================ -->

<title>TechBlog</title>
</head>


<!-- ================================================================================================================ -->
<body>

	<!--NavBar-->
<!-- ================================================================================================================ -->
	
	<%@include file="Nav_Bar.jsp"%>
	
	
	
<!-- ================================================================================================================ -->
	<!--banner-->
	

	<div class="container-fluid p-0 m-0">
		<div
			class="jumbotron primary-background text-white banner-background  ">
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>A programming language is any set of rules that converts
					strings, or graphical program elements in the case of visual
					programming languages, to various kinds of machine code output.
					Programming languages are one kind of computer language, and are
					used in computer programming to implement algorithms.</p>


				<a href="Signup_Page.jsp"class="btn btn-outline-light btn-lg">
					<span class="fa   fa-solid fa-user-plus "></span> Start ! it's Free
				</a>
				<a href=" Login_Page.jsp"class="btn btn-outline-light btn-lg ">
					<span class=" fa fa-sign-in "></span> Login
				</a>
			</div>

		</div>
	</div>
	
	
<!-- ================================================================================================================ -->
	<!--Cards-->

	<div class="container">
		<div class="row">

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programing</h5>
						<p class="card-text">Java is a high-level, class-based,
							object-oriented programming language that is designed to have as
							few implementation dependencies as possible.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>


			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Data Structures</h5>
						<p class="card-text">In computer science, a data structure is
							a data organization, management, and storage format that enables
							efficient access and modification.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>


			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Low Level Design</h5>
						<p class="card-text">LLD is a component-level design process
							that follows a step-by-step refinement process. This process can
							be used for designing DS, performance algorithms.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>

		</div>
		<br>
		<div class="row">

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programing</h5>
						<p class="card-text">Java is a high-level, class-based,
							object-oriented programming language that is designed to have as
							few implementation dependencies as possible.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>


			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Data Structures</h5>
						<p class="card-text">In computer science, a data structure is
							a data organization, management, and storage format that enables
							efficient access and modification.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>


			<div class="col-md-4">

				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Low Level Design</h5>
						<p class="card-text">LLD is a component-level design process
							that follows a step-by-step refinement process. This process can
							be used for designing DS, performance algorithms.</p>
						<a href="#" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>

		</div>

	</div>



<!-- ================================================================================================================ -->


	<!--javascript start-->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<!--javascript end-->
<!-- ================================================================================================================ -->
	
</body>
</html>
