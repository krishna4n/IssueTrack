<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
     
<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Issues - Dashboard</title>
	
	<!-- Stylesheets -->
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!-- jQuery & JS files -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>  
	
	<script type="text/javascript">
	
	</script>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>



	<!-- TOP BAR -->
	<div id="top-bar">
		
		<div class="page-full-width cf">

			<ul id="nav" class="fl">
	
				<li class="v-sep"><a href="Logon" class="round button dark ic-left-arrow image-left">Home</a></li>
				<li class="v-sep"><a href="#" class="round button dark menu-user image-left">Logged in as <strong><%=session.getAttribute("$@auth$") %></strong></a>
					<ul>
						<li><a href="#">My Profile</a></li>
						<li><a href="#">User Settings</a></li>
						<li><a href="change_password">Change Password</a></li>
						<li><a href="logout">Log out</a></li>
					</ul> 
				</li>
			
				<li><a href="logout" class="round button dark menu-logoff image-left">Log out</a></li>
				
			</ul> <!-- end nav -->

					
		</div> <!-- end full-width -->	
	
	</div> <!-- end top-bar -->
	
	
	<center>

<form:form action="change_password">
<div>User Name</div>
<input type="text" name="user_name" value=<%=session.getAttribute("$@auth$")%> readonly="readonly" /> 
<div>Password</div>
<div></div>
<div>Confirm Password</div>
<div></div>
<div></div>
</form:form>

</center>
</body>
</html>