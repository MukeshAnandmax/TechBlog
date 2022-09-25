<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Page</title>

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


</head>
<body>


	<!--NavBar-->
	<!-- ================================================================================================================ -->

	<%@include file="Nav_Bar.jsp"%>



	<!-- <h1>SignUp Page</h1> -->



	<main class=" primary-background  banner-background "
		style="padding-bottom: 55px">
		<div class="container">

			<div class="col-md-6 offset-md-3">

				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa   fa-solid fa-user-plus fa-3x"></span><br>Register
						Here
					</div>
					<div class="card-body">

						<form id="reg-form" action="RegisterServlet" method="post">

							<div class="form-group">
								<label for="user_name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="user_name"
									aria-describedby="user_name" placeholder="Enter your Name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>


							<div class="form-group">
								<label for="gender">Select Gender : </label> <br> <input
									type="radio" id="user_gender" name="user_gender" value="male">
								Male <input type="radio" id="user_gender" name="user_gender"
									value="female"> Female

							</div>

							<div class="form-group">
								<textarea name="user_about" class="form-control" id="about"
									row="5"></textarea>

							</div>



							<div class="form-check ">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree terms and conditions</label>
							</div>
							<br>

							<div class="container text-center" id="loader"
								style="display: none;">

								<span class="fa fa-refresh  fa-spin fa-4x"></span>
								<h4>Please Wait....</h4>
							</div>

							<br>
							<div class="container text-center">
								<button id="submit-btn" type="submit"
									class="btn primary-background text-white  ">Submit</button>
							</div>
						</form>


					</div>

				</div>

			</div>

		</div>


	</main>








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
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script>
	$(document).ready(function() {
			
			console.log("loaded....")
			
			$('#reg-form').on('submit',function(event){
				
				event.preventDefault();
				
				let form = new FormData(this);
				
				$("#submit-btn").hide();
				$("#loader").show();
				
				$.ajax({
					url:"RegisterServlet",
					type:"post",
					data:form,
					success: function(data,textStatus,jqXHR){
						console.log(data)
						
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim()==='Data saved in DB')
						{
							swal("Successfully Registered...,Please login.")
							.then((value) => {
						 	 window.location="Login_Page.jsp"
							});
						
						}else{
							swal(data);
						}
						
						},
					error: function(jqXHR,textStatus,errorThrown){
						console.log(jqXHR)
						
						
						$("#submit-btn").show();
						$("#loader").hide();
						
						swal("Something went wrong!!!");
						
						
						
						},
					processData:false,
					contentType:false
				});
				
			});
			
		});</script>


	<!--javascript end-->
	<!-- ================================================================================================================ -->


</body>
</html>