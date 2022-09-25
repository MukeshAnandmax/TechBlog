

<%@page import="java.lang.Exception"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Server Error!!!</title>
        <link href="css/Mystyle.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
    
  <%@include file="Nav_Bar.jsp"%> 
    
        <div class="container p-3 text-centre   offset-md-3">
            
            <img src="img/500error2.png"  height="900" width="700"  class="img-fluid" alt=""/>
            <h1 class="offset-md-1">Internal Server Error  !!!!!</h1>
             <p class="offset-md-2"><%= exception%></p>
             <a class="btn btn-outline-primary offset-md-3  primary-background text-white " href="index.jsp">Home Page</a>
    </div>
</body>
</html>
