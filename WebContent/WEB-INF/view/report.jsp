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
	

	function DateValidate(input)
	{
		var alertvalue = confirm("Do u want to record this complaint??");
		if(alertvalue == true)
			{
			var validformat=/^\d{2}\/\d{2}\/\d{4}$/; //Basic check for format validity
				var returnval=false
				if (!validformat.test(input))
					{
					
				alert("Invalid Date Format(DD/MM/YYYY). Please correct and submit again.");
					}
				else{ //Detailed check for valid date ranges
					var dayfield=input.split("/")[0]
					var monthfield=input.split("/")[1]
					var yearfield=input.split("/")[2]
				
					var dayobj = new Date(yearfield, monthfield-1, dayfield)
					if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield))
					{
					
				alert("Invalid Day, Month, or Year range detected. Please correct and submit again.")
					}
				else
					{
				returnval=true;
					}
					}
			return returnval;
				}
				
			
		else
			{
			alert("Complaint rejected!!!");
			
			return false;
			}
		
	
	</script>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>



	<!-- TOP BAR -->
	<div id="top-bar">
		
		<div class="page-full-width cf">

			<ul id="nav" class="fl">
	
				<li class="v-sep"><a href="#" class="round button dark ic-left-arrow image-left">Home</a></li>
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
	
	
	
	<!-- HEADER -->
	<div id="header-with-tabs">
		
		<div class="page-full-width cf">
	
			<ul id="tabs" class="fl">
				<li><a href="Logon" class="active-tab dashboard-tab">Home</a></li>
				<li><a href="Report">Reports</a></li>
			</ul> <!-- end tabs -->
			
			<!-- Change this image to your own company's logo -->
			<!-- The logo will automatically be resized to 30px height. -->
			
		</div> <!-- end full-width -->	

	</div> <!-- end header -->
	
	
	<!-- MAIN CONTENT -->
	<div id="content">
		
		<div class="page-full-width cf">

			<div class="side-menu fl">
			<h3>Quick Links</h3>
			
			<ul>
			<li><a href="Report">Report</a></li>
			<li><a href="#">Performance</a></li>
			<li><a href="#">Campus wise Report</a></li>
			</ul>
		
				</div>
			
			
			<div class="side-content fr">
			
				<div class="content-module">
							
					<div class="content-module-heading cf">
					
						<h3 class="fl">Report</h3>
						<span class="fr expand-collapse-text">Click to collapse</span>
						<span class="fr expand-collapse-text initial-expand">Click to expand</span>
					
					</div> <!-- end content-module-heading -->
					
					
					<div class="content-module-main cf">
					
				
						<div class="half-size-column fl">
						<form name="report" method="post" action="Report">
											
						<table>	
						<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
							<tr>
							<td>Start_Date</td>
							<td><input type="text" name="start_date" value= <%=df.format(new java.util.Date()) %> /></td>
							
						     <td>End_Date</td>
						     <td><input type="text" name="end_date" value= <%=df.format(new java.util.Date()) %> /></td>
						     <td>Engineer_Name</td>
						     <td><form:select path="users" items="${users}" name="engineer_name" id="dropdown-actions6">
						     						     
						     </form:select>						    
						     <td><input type="submit" value="Search" onclick="return DateValidate(document.report.start_date.value);" /></td></tr>
						     </table>
						</form>
					
					<c:if test="${report_list!=null}">	
						<table>
						
							<thead>
						
								<tr>
									
									<th>ID</th>
									<th>City Name</th>
									<th>Campus Name</th>
									<th>section name</th>
									<th>complained by</th>

									<th>Complaint_Description</th>
									<th>Engineer Name</th>
									<th>Issue Date</th>
									<th>Issue Closed</th>
									<th>Status</th>
									<th>Comment</th>
									
								</tr>
							
							</thead>
	
							
							<tbody>
	 <c:forEach items="${report_list}" var="report_list" varStatus="status">
								<tr>
									
									<td><c:out value="${report_list.issue_id}" /></td> 
									<td><c:out value="${report_list.city_name}" /> </td>
									<td><c:out value="${report_list.campus_name}" /> </td>
									<td><c:out value="${report_list.section_name}" /> </td>
									<td><c:out value="${report_list.complained_by}" /> </td>
																
									<td><c:out value="${report_list.complaint}" /></td>
									<td><c:out value="${report_list.engineer_name}" /></td>
									<td><c:out value="${report_list.issue_date_opened}" /> </td>
									<td><c:out value="${report_list.issue_date_closed}" /> </td>
									
									<td><c:out value="${report_list.status}" /></td>
																		
									<td><c:out value="${report_list.comment}" /> </td>
									
								</tr>
	 </c:forEach>						
							</tbody>
							
						</table>
					
					 </c:if>
						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						