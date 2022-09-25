<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<%
				LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				
				User user = (User) session.getAttribute("currentUser");
				if (user == null) {
					response.sendRedirect("Login_Page.jsp");
				}

				%>

<div class="row">



	<%
	Thread.sleep(300);

	PostDao postdao = new PostDao(ConnectionProvider.getConnection());
	ArrayList<Post> list = null;
	int cid = Integer.parseInt(request.getParameter("cid"));

	if (cid == 0) {
		list = postdao.getAllPost();
	} else {
		list = postdao.getAllPostbyCatId(cid);
	}

	if (list.size() == 0) {
		out.println(" <h3 class='display-3 text-center mt-5'>No Posts in This Category</h3>");
		return;

	}

	for (Post p : list) {
	%>
	<div class="container-fluid md-6 mt-3">

		<!-- style="width: 18rem;"   class="col-md-6 mt-2"-->

		<div class="card "  border:5px solid #297687;">

			<div class="card-header  text-center text-white primary-background">
				<h4 class="post-title"><%=p.getpTitle()%></h4>

			</div>


			<div class="card-body ">

				<img class="card-img-top my-2 " style=" height: 350px; width: 100%;" src="postPic/<%=p.getpPic()%> " alt="Image Not Available" >

				<hr>
				<div class="row">

					<div class="col-md-8">
					
					<%
							UserDao udao = new UserDao(ConnectionProvider.getConnection());
							
							%>
							<p class="post-user">
									<a href="#!"><%= udao.getUserFromUserId(p.getuId()).getName() %></a> has Posted...
								</p>
					
						

					</div>
					<div class="col-md-4">
						<p class="post-date">
							<%=p.getPdate().toLocaleString()%></p>

					</div>

				</div>

				<%!String content = "";%>
				<%
				if (p.getpContent().length() <= 150) {
					content = p.getpContent();
				} else {
					content = p.getpContent().substring(0, 150) + ".....";
				}
				%>
				<p><%=content%></p>
				<hr>

				<div class="card-footer text-center primary-background">
				
				
				
						<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId()%>)" class="btn btn-outline-light btn-small"> <i
							class="fa fa-thumbs-o-up"><span class="like-counter" ><%=ld.countLikeOnPost(p.getPid()) %></span></i></a> 

						<a href="showPost.jsp?post_id=<%=p.getPid()%>"
						class="btn btn-outline-light btn-small"> Read more...</a> <a
						href="#!" class="btn btn-outline-light btn-small"> <i
						class="fa fa-commenting-o"><span>10</span></i></a>

				</div>


			</div>
		</div>

	</div>



	<%
	}
	%>

</div>