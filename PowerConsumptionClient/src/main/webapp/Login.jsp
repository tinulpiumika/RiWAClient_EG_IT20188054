<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("Username") != null) 
 { 
 response.sendRedirect("powerConsumption.jsp"); 
 } 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title> 
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="Views/login.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/auth.js"></script>
</head>
<body>

<div class="container">

	<form id="formLogin">
		<h2>Login</h2>

		<div class="input-parent">
			<label for="username">Username</label> 
			<input id="txtUsername" name="txtUsername" type="text" class="form-control form-control-sm" > 
		</div>

		<div class="input-parent">
			<label for="password">Password</label>
		    <input id="txtPassword" name="txtPassword" type="password" class="form-control form-control-sm">
		</div>

		<input id="btnLogin" name="btnLogin" type="button" value="Login" class="btn btn-primary">
		<div id="alertError" class="alert alert-danger"></div>
	</form>
	
</div>	
</body>
</html>