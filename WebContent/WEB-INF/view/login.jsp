       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Login</title>
	
	<!-- Stylesheets -->
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
</head>
<body>

	<!-- TOP BAR -->
	<div id="top-bar">
		
		<div class="page-full-width">
		
			<a href="#" class="round button dark ic-left-arrow image-left ">Login page</a>

		</div> <!-- end full-width -->	
	
	</div> <!-- end top-bar -->
	
	
	
	<!-- HEADER -->
	<div id="header">
		
		<div class="page-full-width cf">
	
			<div id="login-intro" class="fl">
			
				<h1>Login Form</h1>
				<h5>Enter your credentials below</h5>
			
			</div> <!-- login-intro -->
			
			<!-- Change this image to your own company's logo -->
			<!-- The logo will automatically be resized to 39px height. -->
			
		</div> <!-- end full-width -->	

	</div> <!-- end header -->
	
	
	
	<!-- MAIN CONTENT -->
	<div id="content">
	<center><h1><font color="red">${loginerror} </font></h1></center>
		<form action="Logon" method="POST" id="login-form">
		
			<fieldset>

				<p>
					<label for="login-username">username</label>
					<input type="text" id="username" name="username" class="round full-width-input" autofocus />
				</p>

				<p>
					<label for="login-password">password</label>
					<input type="password" id="password"  name="password" class="round full-width-input" />
				</p>
				
					<input type="hidden" name="public_ip" value=<%=request.getRemoteAddr()%>>
		            <input type="hidden" name="public_ip" value=<%=request.getHeader("User-Agent")%>>			
				<input type="submit" value="Log in" class="button round blue image-right ic-right-arrow">

			</fieldset>
		</form>
		
	</div> <!-- end content -->
	
	
	
	<!-- FOOTER -->
	<div id="footer">

		<p></p>
		<p></p>
	
	</div> <!-- end footer -->

</body>
</html>