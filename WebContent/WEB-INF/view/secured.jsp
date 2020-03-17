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
	
	function onSubmit(input)
	{
		var input;
		if(DateValidation(input))
			{
		if (confirm("Do you want to Insert this Record"))
		{
			return false;
					
			}
			}
		else
		{
			alert ("You Have Cancelled !!!!");
			return false;
			
			}
		
		}
	
	
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
			<li><a href="issue_list">Current Month issues</a></li>
			<li><a href="Logon">Record Complaint</a></li>
			<li><a href="pending_issues">Pending Issues</a></li>
			</ul>
			
				
				<h3>Recent Updates</h3>
				
				<font size="2">
				
         <c:forEach items="${recent_Updates}" var="details" varStatus="status" >
				
				<ul><li>
				<a href="toupdatelist?id=${details.id}">${details.issue_id}</a>
				</li>
				</ul>

</c:forEach>
									
					</font>
				</div>
				
	<c:if test="${details==null && updateList==null && pending_issues==null}">			
			
			
			<div class="side-content fr">
			
				<div class="content-module">
							
					<div class="content-module-heading cf">
					
						<h3 class="fl">Issue Entry Form</h3>
						<span class="fr expand-collapse-text">Click to collapse</span>
						<span class="fr expand-collapse-text initial-expand">Click to expand</span>
					
					</div> <!-- end content-module-heading -->
					
					
					<div class="content-module-main cf">
					
				
						<div class="half-size-column fl">
						
					
						
					<h1><font color="red"><b><c:out value="${msg}"></c:out> <% session.removeAttribute("msg"); %></b>	</font></h1>
						
						
						<form name="Issue_Entry" class="entry-form"  method="post" action="entry.do" >
							
							<table>	
							<tr>
							<td>								
									
									<label for="dropdown-actions1">Complaint_Type</label>
									</td> 

									<td>	<select id="dropdown-actions1" name="issue_type" class="round default-width-input" >
											<option value="">Select Complaint Type</option>
											<option value="HARDWARE">HARDWARE</option>
											<option value="SOFTWARE">SOFTWARE</option>
											<option value="PRINTER">PRINTER</option>
											<option value="XEROX MACHINE">XEROX MACHINE</option>
											<option value="UPS">UPS</option>
											</select> 
											
										<br>
										<form:errors path="formError.issue_type" class="error-box round"></form:errors> </td>
								    </tr>
								    
								 <tr>
								 <td>
								 
									<tr>
									<td>
									<label for="dropdown-actions3">Campus Name</label> </td>
									<td>	<form:select path="campus_name" id="dropdown-actions3"  name="campus_name" class="round default-width-input">
									<form:option value="">Select Campus Name</form:option>
									 <form:options items="${campus_name}" itemValue="campus_code" itemLabel="full_name" />
									 </form:select>
									
									<br>
									<form:errors path="formError.campus_name" class="error-box round"></form:errors></td>
									</tr>	
									
									
									<tr>
									<td>
									<label for="dropdown-actions4">Section Name </label></td>

										<td><select id="dropdown-actions4" name="section_name" class="round default-width-input">
											<option value="">Select Section Name</option>
											<option value="Accounts Section">Accounts Section</option>
											<option value="Computer Section">Computer Section</option>
											<option value="Exam Cell">Exam Cell</option>
											<option value="AGM">AGM</option>
											<option value="Board Section">Board Section</option>
											<option value="Lab">Lab</option>
											<option value="principal">Principal</option>
											<option value="Dean">Dean</option>
											<option value="Mess">Mess</option>
											</select>
											<br>
											<form:errors path="formError.section_name" class="error-box round"></form:errors></td>
									</tr>
									
									
									<tr>
									<td>
									<label for="dropdown-actions5">Source of Complaint</label></td>

										<td><select id="dropdown-actions5" name="complaint_source" class="round default-width-input" >
											<option value="">Select Source of Complaint</option>
											<option value="By Phone">By Phone</option>
											<option value="Mail">Mail</option>
											<option value="Person">Person</option>
										</select>
										<br>
										<form:errors path="formError.complaint_source" class="error-box round"></form:errors></td>
									</tr>
									
									
									<tr>
									<td>
										<label for="simple-input1">Complained_By </label></td>
										<td><input type="text" id="simple-input1" class="round default-width-input" name="complained_by" class="round default-width-input"  /></td>
									
									
									</tr>
									
									<tr></tr>
									<tr>
									<td><label for="dropdown-actions6">Engineer Name</label></td> 
                                    <td> <form:select path="users" items="${users}" name="engineer_name" id="dropdown-actions6" class="round default-width-input"></form:select></td>
									
			                     						
									
									</tr>
									<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>	
									
									<tr>
									<td>
										<label for="simple-input2">Issue Date</label> </td>
										<td>
																			
										<input type="text" name="issue_date_opened"  class="round default-width-input" value=<%=df.format(new java.util.Date()) %> /> 
					                 
					                 <br>
					                  <form:errors path="formError.issue_date_opened" class="error-box round"></form:errors></td>
					                 </tr>
					                 
					                
					                 <tr>
										<td><label for="simple-input3">Issue_Closed_On </label> </td>
										 <td>
										 <input type="text" id="simple-input3" class="round default-width-input" name="issue_date_closed"  value=<%=df.format(new java.util.Date())%> />
									
									<br>
									<form:errors path="formError.issue_date_closed" class="error-box round"></form:errors></td>
									</tr>
									
									
								<tr>
								<td>
									
										<label>Priority</label> </td>
										<td>
										<input type="radio" id="selected-radio" checked="checked" name="priority" value="Low"/>Low 
										<input type="radio" id="unselected-radio" name="priority" value="Moderate" />Moderate
										<input type="radio" id="unselected-radio" name="priority" value="High" /> High
										</td>
									</tr>
									
									 
									<tr>
									<td>
										<label>Status</label></td>
										<td><input type="radio" id="selected-radio" checked="checked" name="status" value="In Process" />In Process
										<input type="radio" id="unselected-radio" name="status"  value="Closed" />Closed
										<input type="radio" id="unselected-radio" name="status" value="Pending"/>Pending
										</td>
										
										
									<tr>
									<td>
										<label for="simple-input4">Contact No. </label> </td>
										<td><input type="text" id="simple-input4" name="contact_no"  class="round default-width-input" />
									<br>
									
									<form:errors path="formError.contact_no" class="error-box round"></form:errors></td>
									</tr>
									
									
									<tr>
									<td>									
										<label for="textarea">Complaint</label> </td>
										<td><textarea id="textarea" class="round default-width-input" name="complaint"></textarea>
									
									
									<br>
									 <form:errors path="formError.complaint" class="error-box round"></form:errors></td>
									
									</tr>
									
									
					
									<tr><td></td><td>
									<input type="submit" value="Insert" class="round blue ic-right-arrow" onclick="return DateValidate(document.Issue_Entry.issue_date_opened.value);"/>
									</td></tr>
									
									
									
									<tr></tr>
									
									</table>
														
								</form>
								
								</div>
								
							</div>
							</div>
							
							
							</div>
							</c:if>	
							
							
							
							
						
							
<c:if test="${details!=null}">	
					
							
							
							<div class="side-content fr">
			
				<div class="content-module">
							
					<div class="content-module-heading cf">
					     <h3 class="fl">Current Month Issues</h3>
						<span class="fr expand-collapse-text">Click to collapse</span>
						<span class="fr expand-collapse-text initial-expand">Click to expand</span>
					
					</div>							
					
					<div class="content-module-main">
					<h1><font color="green"><b><c:out value="${updated_msg}"></c:out> <% session.removeAttribute("updated_msg"); %></b>	</font></h1>
						<table>
						
							<thead>
						
								<tr>
									
									<th>ID</th>
									<th>Campus_Name</th>
									<th>Complaint</th>
									<th>Engineer_Name</th>
									<th>Issue_Date</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							
							</thead>
	
							
							<tbody>
	 <c:forEach items="${details}" var="details" varStatus="status">
								<tr>
									
									<td><c:out value="${details.issue_id}" /></td> 
									<td><c:out value="${details.campus_name}" /> </td>
									
									<td><c:out value="${details.complaint}" /></td>
									<td><c:out value="${details.engineer_name}" /></td>
									<td><c:out value="${details.issue_date_opened}" /> </td>
									<td><c:out value="${details.status}" /></td>
																		
									<td>
										<a href="toupdatelist?id=${details.id}" class="table-actions-button ic-table-edit"></a>
										<a href="#" class="table-actions-button ic-table-delete"></a>
									
								</tr>
	 </c:forEach>						
							</tbody>
							
						</table>
					
					</div> <!-- end content-module-main -->
				
				</div> <!-- end content-module -->
						
				</div>
					
						
					
					
					
						
							
							
							
							
							</c:if>
							
							<!--  end of issue list -->
							
							
		<!--  Start of updation form                    -->					
							
							<c:if test="${updateList!=null}">			
			
			
			<div class="side-content fr">
			
				<div class="content-module">
							
					<div class="content-module-heading cf">
					
						<h3 class="fl">Issue Closing Form</h3>
						<span class="fr expand-collapse-text">Click to collapse</span>
						<span class="fr expand-collapse-text initial-expand">Click to expand</span>
					
					</div> <!-- end content-module-heading -->
					
					
					<div class="content-module-main cf">
					
				
						<div class="half-size-column fl">
						
					
						
						<form name="Issue_Updation" class="entry-form"  method="post" action="update.html" >
							
							<table>	
							<tr>
							<td>	
							
							<label for="dropdown-actions10">Complaint_ID</label>
									</td> 

									<td>	<input type="text" name="issue_id"  value="${updateList.issue_id}" class="round default-width-input"  readonly="readonly" />
											
											
										</td>
								    </tr>							
									<tr>
									<td>
									<label for="dropdown-actions1">Complaint_Type</label>
									</td> 

									<td>	<input type="text" name="issue_type"  value="${updateList.issue_type}" class="round default-width-input"  readonly="readonly"/>
											
											
										</td>
								    </tr>
								    
								 <tr>
								 <td>
								 
								 <label for="dropdown-actions2">Zone Name</label>
									</td> 

									<td>	<input type="text" name="zone_code" class="round default-width-input" value="${updateList.zone_code}" readonly="readonly"/>
																						
										 </td>
								    </tr>   
								    
								    
								    
								    
									<tr>
									<td>
									<label for="dropdown-actions3">Campus Name</label> </td>
									<td>	<input type="text" value="${updateList.campus_name}"  name="campus_name" class="round default-width-input" readonly="readonly"/>
									</td>
									</tr>	
									
									
									<tr>
									<td>
									<label for="dropdown-actions4">Section Name </label></td>

										<td><input type="text" name="section_name" value="${updateList.section_name}" class="round default-width-input" readonly="readonly"/>
											
											</td>
									</tr>
									
									
									<tr>
									<td>
									<label for="dropdown-actions5">Source of Complaint</label></td>

										<td><input type="text" name="complaint_source" value="${updateList.complaint_source}"   class="round default-width-input" readonly="readonly"/>
											
										</td>
									</tr>
									
									
									<tr>
									<td>
										<label for="simple-input1">Complained_By </label></td>
										<td><input type="text" value="${updateList.complained_by}" class="round default-width-input" name="complained_by" class="round default-width-input" readonly="readonly"/></td>
									
									
									</tr>
									
									<tr></tr>
									<tr>
									<td><label for="dropdown-actions6">Engineer Name</label></td> 
                                    <td> <input type="text" name="engineer_name" value="${updateList.engineer_name}" class="round default-width-input" readonly="readonly" /></td>
									
			                     						
									
									</tr>
									
									<tr>
									<td>
										<label for="simple-input2">Issue Date</label> </td>
										<td>
																			
										<input type="text" name="issue_date_opened"  class="round default-width-input" value="${updateList.issue_date_opened}"  readonly="readonly"/> 
					                 
					                 </td>
					                 </tr>
					                 <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>	
									
					                
					                 <tr>
										<td><label for="simple-input3">Issue_Closed_On </label> </td>
										 <td>
										 <input type="text" id="simple-input3" class="round default-width-input" name="issue_date_closed"  value=<%=df.format(new java.util.Date())%> required="required"/>
									
									<br>
									<form:errors path="formError.issue_date_closed" class="error-box round"></form:errors></td>
									</tr>
									
															
									 
									<tr>
									<td>
										<label>Status</label></td>
										<td>
										<input type="radio" id="unselected-radio" name="status"  value="Closed" checked="checked" />Closed &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" id="unselected-radio" name="status" value="Pending"/>Pending </td></tr>
										
										
									<tr>
									<td>
										<label for="simple-input4">Contact No. </label> </td>
										<td><input type="text" value="${updateList.contact_no}" name="contact_no"  class="round default-width-input" readonly="readonly"/>
									</td>
									</tr>
									
									
									<tr>
									<td>									
										<label for="textarea">Complaint</label> </td>
										<td><textarea placeholder="${updateList.complaint}" class="round default-width-input" name="complaint"></textarea>
									</td>
									
									</tr>
									
									
									
									<tr>
									<td>									
										<label for="textarea">Remarks</label> </td>
										<td><textarea id="textarea" class="round default-width-input" name="comment"></textarea>
									
									</td>
									
									</tr>
									<tr><td>
					                             <input type="hidden" value="${updateList.id}" name=id />
					                             <input type="hidden" value="${updateList.issue_id}" name=issue_id />
					                            
					                        
					                             </td></tr>
									<tr><td></td><td>
									<input type="submit" value="Update" class="round blue ic-right-arrow" onclick="return DateValidate(document.Issue_Updation.issue_date_closed.value);" />
									</td></tr>
									
									
									
									<tr></tr>
									
									</table>
														
								</form>
								
								</div>
								
							</div>
							</div>
							
							
							</div>
							</c:if>	
				
				<!-- Start of pending issue list -->			
											
<c:if test="${pending_issues!=null}">	
					
							
							
							<div class="side-content fr">
			
				<div class="content-module">
							
					<div class="content-module-heading cf">
					     <h3 class="fl">Pending Issues</h3>
						<span class="fr expand-collapse-text">Click to collapse</span>
						<span class="fr expand-collapse-text initial-expand">Click to expand</span>
					
					</div>							
					
					<div class="content-module-main">
					
						<table>
						
							<thead>
						
								<tr>
									
									<th>ID</th>
									<th>Campus_Name</th>
									<th>Complaint</th>
									<th>Engineer_Name</th>
									<th>Issue_Date</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							
							</thead>
	
							
							<tbody>
	 <c:forEach items="${pending_issues}" var="issues" varStatus="status">
								<tr>
									
									<td><c:out value="${issues.issue_id}" /></td> 
									<td><c:out value="${issues.campus_name}" /> </td>
									<td><c:out value="${issues.complaint}" /></td>
									<td><c:out value="${issues.engineer_name}" /></td>
									<td><c:out value="${issues.issue_date_opened}" /></td>
									<td><c:out value="${issues.status}" /></td>
																		
									<td>
										<a href="toupdatelist?id=${issues.id}" class="table-actions-button ic-table-edit"></a>
										<a href="#" class="table-actions-button ic-table-delete"></a>
									
								</tr>
	 </c:forEach>						
							</tbody>
							
						</table>
					
					</div> <!-- end content-module-main -->
				
				</div> <!-- end content-module -->
						
				</div>
					
						
					
					
					
						
							
							
							
							
							</c:if>
							<!-- end of pending issue list -->			
							
							
							</div>
							
		</div>					
											
	
	<!-- FOOTER -->
	<div id="footer">

		<p></p>
		<p></p>
	</div> <!-- end footer -->

</body>
</html>