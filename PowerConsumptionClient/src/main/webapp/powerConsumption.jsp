<%@page import="com.PowerConsumption"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>

<link rel="stylesheet" href="Views/powerConsumption.css">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/power.js"></script>
<script src="Components/auth.js"></script>


	<%
	if (session.getAttribute("Username") == null) {
		response.sendRedirect("Login.jsp");
	}
	%>

</head>
<body>

<div class="header">
  <h1>Admin Dashboard</h1>
  <p>Power Consumption Management.</p>
</div>

<div class="navbar">
			<div class="btn-nav"> 
				<button class="btn btn-success" id="btnLogout" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">Logout</button>	
			</div>	
</div>


		<br><button id="hide" class="btn btn-secondary">Hide form</button>
        <button id="show" class="btn btn-info">Insert new value</button>

	<div class="container">
	
		<div class="row">

			<div class="col-6" id="divform">
				<h1>Power Consumption</h1>
				<form id="formItem" name="formItem">
					Current Reading: <input id="currentReading" name="currentReading" type="text" class="form-control form-control-sm"> <br> 
					Date: <input id="date" name="date" type="date" class="form-control form-control-sm"> <br> 
					User Type: <input id="type" name="type" type="text" class="form-control form-control-sm"> <br> 
					<!-- elect id="type" name="isTitles" >
						<option value="commercial">commercial</option>
  						<option value="residential">residential</option>
					</select> <br-> <br-->

					Reader ID: <input id="readerID" name="readerID" type="text" class="form-control form-control-sm"> <br> 
					User ID: <input id="userID" name="userID" type="text" class="form-control form-control-sm"> <br> 
					<br> 
					
					<input id="hidItemIDSave" type="hidden" name="hidItemIDSave" value="">
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
					<button id="reset" class="btn btn-secondary">Reset form</button> 
				</form>
				
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>

			</div>
				<div id="divItemsGrid">
				
					<%
					PowerConsumption itemObj = new PowerConsumption();
					out.print(itemObj.readConsumption());
					%>
					
				</div>
		</div>
	</div>
	
	
	
</body>
</html>