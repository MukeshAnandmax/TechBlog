<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="Error_Page.jsp"%>





<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("Login_Page.jsp");
}
%>

<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao postdao1 = new PostDao(ConnectionProvider.getConnection());
Post post = postdao1.getAllPostbyPostId(postId);
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=post.getpTitle()%></title>

<!-- ================================================CSS start============================================================ -->
<link href="css/NewFile.css" rel="stylesheet" type="text/css" />


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

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 20px;
}

.post-date {
	font-style: italic;
	font-weight: bold;
}

.main-body{

border:5px solid #297687;

}
.post-code {
	
}

body{
background:url(img/bg.jpg);
background-size:cover;
background-attachment:fixed;
}


</style>



<!-- ===============================================CSS end========================================================= -->


</head>

<body>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v13.0" nonce="nAeQHeUx"></script>
	<!-- ========================================= Navbar Start ======================================================= -->



	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span class="fa fa-home"></span>TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Profile.jsp"><span class="fa fa-laptop"></span>Learn Code
						with Mukesh <span class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-navicon"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Java</a> <a
							class="dropdown-item" href="#">DSA</a> <a class="dropdown-item"
							href="#">C Programing</a> <a class="dropdown-item" href="#">Low
							Level Design</a> <a class="dropdown-item" href="#">Spring
							Framework</a> <a class="dropdown-item" href="#">Servlet & Jsp</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Development</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-phone-square"></span> Contact us</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#New-post"><span
						class="fa fa-pencil"></span> New Post </a></li>

			</ul>

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"> <span
						class="fa fa-user-circle "></span> <%=user.getName()%>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="LogoutServlet">
						<span class="fa fa-sign-out "></span> Logout
				</a></li>
			</ul>




		</div>
	</nav>


	<!-- ========================================= Navbar end ======================================================= -->

	<!-- ========================================= Profile Modal======================================================= -->



	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<!--++++++++++++++++++++++Default Profile image according to gender  code+++++++++++++++++++++++ -->

					<%!String img1;%>
					<%
					if (user.getGender().equalsIgnoreCase("male") && user.getProfile().equalsIgnoreCase("default.png")) {
						img1 = "Male" + user.getProfile();
					} else if (user.getGender().equalsIgnoreCase("female") && user.getProfile().equalsIgnoreCase("default.png")) {
						img1 = "Female" + user.getProfile();
					} else {
						img1 = user.getProfile();
					}
					%>
					<!--+++++++++++++++++++ END Default Profile image according to gender  code++++++++++++++++++++ -->


					<div class="container text-center">
						<img src="Profilepic/<%=img1%>" class="img-fluid"
							style="border-radius: 50%; max-width: 100px;"> <br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>


						<!--++++++++++++++++++++++++++++ Profile Details +++++++++++++++++++++++++++++++++++++++ -->


						<div id="profile-detail">

							<table class="table">

								<tbody>
									<tr>
										<th scope="row">Id :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>

									</tr>

									<tr>
										<th scope="row">Registered Date :</th>
										<td><%=user.getDateTime().toLocaleString()%></td>

									</tr>
								</tbody>
							</table>

						</div>
						<!--++++++++++++++++++++++++++++ Profile Details end +++++++++++++++++++++++++++++++++++++++ -->


						<!--++++++++++++++++++++++++++++ Profile Edit +++++++++++++++++++++++++++++++++++++++ -->

						<div id="profile-edit" style="display: none;">

							<h3 class="mt-2">Please Edit Carefully....</h3>

							<form action="EditServlet" method="post"
								enctype="multipart/form-data">

								<table class="table">
									<thead>

									</thead>
									<tbody>

										<tr>
											<th scope="row">Id :</th>
											<td><%=user.getId()%></td>

										</tr>
										<tr>
											<th scope="row">Name :</th>
											<td><input type="text" class="form-control"
												name="user_name" value="<%=user.getName()%>"></td>

										</tr>
										<tr>
											<th scope="row">Email :</th>
											<td><input type="email" class="form-control"
												name="user_email" value="<%=user.getEmail()%>"></td>

										</tr>
										<tr>
											<th scope="row">Gender :</th>
											<td><input type="text" class="form-control"
												name="user_gender"
												value="<%=user.getGender().toUpperCase()%>"></td>

										</tr>

										<tr>
											<th scope="row">Password :</th>
											<td><input type="password" class="form-control"
												name="user_password" value="<%=user.getPassword()%>">
											</td>

										</tr>
										<tr>
											<th scope="row">Status :</th>
											<td><textarea class="form-control" name="user_about"
													rows="3" cols=""><%=user.getAbout()%></textarea></td>

										</tr>

										<tr>
											<th scope="row">New Profile Pic:</th>
											<td><input type="File" class="form-control"
												name="user_profile"></td>

										</tr>

									</tbody>

								</table>

								<hr>

								<div class="container">
									<button type="submit"
										class="btn btn-primary primary-background text-white">Save</button>

								</div>

							</form>

						</div>

						<!--++++++++++++++++++++++++++++ Profile Edit end +++++++++++++++++++++++++++++++++++++++ -->



					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="edit-profile-btn"
						class="btn btn-primary primary-background text-white">
						<span class="	fa fa-edit"></span> Edit
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- ====================================End of Profile Modal======================================================== -->

	<!-- ====================================Post Modal======================================================== -->



	<!-- Modal -->
	<div class="modal fade" id="New-post" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">

								<option selected disabled>---Select Category---</option>
								<%
								PostDao postdao = new PostDao(ConnectionProvider.getConnection());

								ArrayList<Category> list = postdao.getAllCategory();

								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>

								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post Title"
								class="form-control">
						</div>

						<div class="form-group">
							<textarea name="pContent" placeholder="Enter post Content(min)"
								class="form-control"></textarea>
						</div>

						<div class="form-group ">
							<textarea name="pCode" placeholder="Enter your Program(if any..)"
								class="form-control"></textarea>
						</div>


						<div class="form-group">
							<label> Select your photo.</label> <input type="file" name="pPic"
								class="form-control">
						</div>

						<div class="container text-center">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="Submit"
								class="btn btn-primary primary-background text-white">Post</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- ====================================End Post Modal======================================================== -->



	<!-- ====================================<Main Content of Body>======================================================== -->



	<div class="container-fluid ">


		<div class="row my-4 ">
			<div class="col-md-8 offset-md-2">

				<div class="card main-body">
					<div class="card-header  text-center text-white primary-background">
						<h4 class="post-title"><%=post.getpTitle()%></h4>

					</div>

					<div class="card-body">

						<img class="card-img-top " src="postPic/<%=post.getpPic()%>">
						<hr>
						<div class="row">

							<div class="col-md-8">
							
							<%
							UserDao udao = new UserDao(ConnectionProvider.getConnection());
							
							%>
							<p class="post-user">
									<a href="#!"><%= udao.getUserFromUserId(post.getuId()).getName() %></a> has Posted...
								</p>

							</div>
							<div class="col-md-4">
								<p class="post-date">
									<%=post.getPdate().toLocaleString()%></p>

							</div>

						</div>

						<hr>

						<p class="post-content">
							<%=post.getpContent()%>
						</p>
						<hr>
						<div class="post-code">
							<pre><%=post.getpCode()%></pre>
						</div>
					</div>

					<div class="card-footer text-center primary-background">
					
					<%
					LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
					
					%>

						<a href="#!" onclick="doLike(<%=post.getPid() %>,<%=user.getId()%>)" class="btn btn-outline-light btn-small"> <i
							class="fa fa-thumbs-o-up"><span class="like-counter"><%=ld.countLikeOnPost(post.getPid()) %></span></i></a> 
							
						<a href="#!"
							class="btn btn-outline-light btn-small"> <i
							class="fa fa-commenting-o"><span>10</span></i></a>

					</div>
					
					<div class="card-footer ">
					
					<div class="fb-comments" data-href="http://localhost:8080/TechBlog/showPost.jsp?post_id=<%=postId%>" data-width="" data-numposts="5"></div>
					
					</div>
					
					
				</div>


			</div>

		</div>



	</div>





	<!-- ====================================<END of Main Content of Body>======================================================== -->




	<!-- ===================================================javascript start================================================== -->




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

<script src="js/Myjs.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			let editStatus = true;

			$('#edit-profile-btn').click(function() {

				//alert("Butoon clicked")
				if (editStatus) {

					$('#profile-detail').hide()
					$('#profile-edit').show()
					editStatus = false;
					$(this).text("Back")
				} else {

					$('#profile-detail').show()
					$('#profile-edit').hide()
					editStatus = true;
					$(this).text("Edit")

				}

			})
		});
	</script>

	<!-- ---add Post JS---- -->

	<script type="text/javascript">
		$(document)
				.ready(
						function(e) {

							//alert("add Post JS loaded")

							$("#add-post-form")
									.on(
											"submit",
											function(event) {

												//this code  gets called when form is submited

												event.preventDefault();
												console
														.log("you have clicked on submit btn")
												let form = new FormData(this);
												//now requesting to server
												$
														.ajax({

															url : "AddPostServlet",
															type : 'post',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//Success
																console
																		.log(data)
																if (data.trim() == 'Done') {

																	swal(
																			"Good job!",
																			"Your blog is posted Successfully...",
																			"success");

																	$(
																			'#New-post')
																			.modal(
																					'hide');

																} else {
																	swal(
																			"Error",
																			"Something went wrong",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {

																//error
																swal(
																		"Error",
																		"Something went wrong",
																		"error");
															},
															processData : false,
															contentType : false

														})

											})

						});
	</script>

	<!-- 	 this script will reset the add post form after closing the modal -->

	<script>
		$(document).ready(function(e) {

			$("#New-post").on('hidden.bs.modal', function(e) {

				$("#add-post-form").trigger("reset");

			});

		})
	</script>

	<!-- ---end add Post JS---- -->








	<!-- ======================================================Javascript end================================================= -->

</body>
</html>