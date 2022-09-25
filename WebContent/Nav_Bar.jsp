 
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-home"></span>TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-laptop"></span>Learn Code with Mukesh <span class="sr-only">(current)</span></a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-navicon"></span>
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        
                       
                      
                            <a class="dropdown-item" href="#">Java</a>
                            <a class="dropdown-item" href="#">DSA</a>
                            <a class="dropdown-item" href="#">C Programing</a>
                            <a class="dropdown-item" href="#">Low Level Design</a>
                            <a class="dropdown-item" href="#">Spring Framework</a>
                            <a class="dropdown-item" href="#">Servlet & Jsp</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Development</a>
                            s
                        </div>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-phone-square"></span> Contact us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="Signup_Page.jsp"><span class="fa   fa-solid fa-user-plus "></span> SignUp</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link " href="Login_Page.jsp"><span class="fa fa-sign-in"></span> Login</a>
                    </li>
                    
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>