<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >
</head>
<body>
<center>
<div id="wrapper">

	<form name="login-form" class="login-form" action="Logon" method="post">
	
		<div class="header">
		  <h1> Login Form</h1>
  </div>
	
		<div class="content">
		<p>User Name       
		  <input name="username" type="text" class="input username" placeholder="Username" /></p>
		<div class="user-icon"></div>
		</div>Password                                       
		<input name="password" type="password" class="input password" placeholder="Password" />
		<div class="pass-icon"></div>		
		</div>

		<div class="footer">
		           <input type="submit" name="submit" value="Login" class="button" />
		</div>
		<input type="hidden" name="public_ip" value=<%=request.getRemoteAddr()%>>
		<input type="hidden" name="public_ip" value=<%=request.getHeader("User-Agent")%>>
		
	</form>
	</div>
    </center>
</body>
</html>