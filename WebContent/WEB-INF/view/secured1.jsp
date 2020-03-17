<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Secured page!</title>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>

	<div style="position: absolute; width: 699px; height: 151px; z-index: 2; left: 4px; top: 498px" id="layer2">

<center>
<form action="issue_list">
<br>
<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<input type="submit" value="View Issues" style="font-family: Aparajita; border-style: outset; border-width: 1px" class="current_page_item"></p>
</center><br>
</form></center>
<form method="post" action="toupdatelist">
    <table>
    <tr>
        <th>SNo.</th>
        <th>Issue ID</th>
        <th>Issue Type</th>
        <th>City Name</th>
        <th>Campus Name</th>
        <th>Section Name</th>
         <th>Source of Complaint</th>
        <th>Complained By</th>
        <th>Engineer Name</th>
         <th>Complaint Date</th>
        <th>Issue_Closed_Date</th>
        <th>Compliant</th>
        <th>Status</th>
        <th>Comment</th>

    </tr>
    <c:forEach items="${details}" var="details" varStatus="status">
        <tr>
            <td align="center">${status.count}</td>
            <td><input name="campus_name" value="${details.issue_id}"/></td>
            <td><input name="campus_name" value="${details.issue_type}"/></td>
            <td><input name="campus_name" value="${details.city_name}"/></td>

            <td><input name="campus_name" value="${details.campus_name}"/></td>

            <td><input name="campus_name" value="${details.section_name}"/></td>

            <td><input name="campus_name" value="${details.complaint_source}"/></td>
            <td><input name="campus_name" value="${details.complained_by}"/></td>

            <td><input name="campus_name" value="${details.engineer_name}"/></td>
            <td><input name="detailss[${status.index}].status" value="${details.issue_date_opened}"/></td>
            <td><input name="detailss[${status.index}].status" value="${details.issue_date_closed}"/></td>

            <td><input name="detailss[${status.index}].status" value="${details.complaint}"/></td>
            <td><input name="detailss[${status.index}].status" value="${details.status}"/></td>
            <td><input name="detailss[${status.index}].status" value="${details.comment}"/></td>


            <td><a href="toupdatelist?id=${details.id}">Edit</a></td>
            
            </tr><td>
    </c:forEach>
</table> 
<br/>
&nbsp;
</form>



</div>

<c:if test="${issueList!=null}">

	<div style="position: absolute; width: 355px; height: 353px; z-index: 3; left: 666px; top: 50px" id="layer3">
	
<form action="update.html">
		<font size="5">&nbsp;Issue Edit Form</font><table border="0" width="100%" cellpadding="0" cellspacing="0">
			
			<tr>
				<td>Issue ID</td>
				<td width="180">
				<input type="text" name="issue_id" size="20" value=<c:out value="${issueList.issue_id}"></c:out>></td>
			
				
			</tr>
			
			<tr>
				<td>Complaint Type</td>
				<td width="180">
				<input type="text" name="issue_type" size="20" value=<c:out value="${issueList.issue_type}"></c:out>></td>
			
				
			</tr>
			<tr>
				<td>City Name</td>
				<td width="180">
				<input type="text" name="city_name" size="20" value=<c:out value="${issueList.city_name}"></c:out>></td>
			</tr>
			<tr>
				<td>Campus Name</td>
				<td width="180">
				<input type="text" name="campus_name" size="20" value=<c:out value="${issueList.campus_name}"></c:out>></td>
			</tr>
			<tr>
				<td>Section Name</td>
				<td width="180">
				<input type="text" name="section_name" size="20" value=<c:out value="${issueList.section_name}"></c:out>></td>
			</tr>
			<tr>
				<td>Source of Compliant</td>
				<td width="180">
				<input type="text" name="complaint_source" size="20" value=<c:out value="${issueList.complaint_source}"></c:out>></td>
			</tr>
			<tr>
				<td>Complained by</td>
				<td width="180">
				<input type="text" name="complained_by" size="20" value=<c:out value="${issueList.complained_by}"></c:out>></td>
			</tr>
			<tr>
				<td>Engineer Name</td>
				<td width="180">
				<input type="text" name="engineer_name" size="20" value=<c:out value="${issueList.engineer_name}"></c:out>></td>
			</tr>
			<tr>
				<td>Issue Opened Date</td>
				<td width="180">
				<input type="text" name="date_opened" size="20" value=<c:out value="${issueList.issue_date_opened}"></c:out>></td>
			</tr>
			<tr>
				<td>Issue Closed Date</td>
				<td width="180">
				<input type="text" name="date_closed0" size="20"value=<c:out value="${issueList.issue_date_closed}"></c:out>></td>
			</tr>
			<tr>
				<td>Status</td>
				<td width="180">
				
					
					<select size="1" name="status">
					<option selected>In Process</option>
					<option>Closed</option>
					<option>Pending</option>
					</select></td>
			</tr>
			<tr>
				<td>Complaint</td>
			<td width="180">
			<input type="text" name="contact_no" size="20" value=<c:out value="${issueList.complaint}"></c:out>></td>
			</tr>
			<tr>
				<td>Comment</td>
				<td width="180">
				
					
					<textarea rows="2" name="comment" cols="20" onselect=""></textarea></td>
			</tr>
			<tr>
				<td>
				

				
				&nbsp;</td>
				<td width="180"><input type="submit" value="Submit" name="B3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="Reset" name="B4"><p>&nbsp;</td>
			</tr>
		</table>
		</form>
		</div>
		
</c:if>



		
	<c:if test="${issueList==null}">	
	<div style="position: absolute; width: 326px; height: 356px; z-index: 4; left: 321px; top: 54px" id="layer4">
	<font size="5">&nbsp;Issue Log Form</font>
			 <form name="Issue Entry" class="entry-form" action="entry.do" method="post">

		
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td>Complaint Type</td>
				<td width="180">
				<select size="1" name="issue_type">
					<option selected>HARDWARE</option>
					<option>SOFTWARE</option>
					<option>PRINTER</option>
					<option>XEROX MACHINE</option>
					<option>UPS</option>
					</select>
				
				</td>
			</tr>
			<tr>
				<td>City Name</td>
				<td width="180">
				<input type="text" name="city_name" size="20"></td>
			</tr>
			<tr>
				<td>Campus Name</td>
				<td width="180">
				<input type="text" name="campus_name" size="20"></td>
			</tr>
			<tr>
				<td>Section Name</td>
				<td width="180">
				<input type="text" name="section_name" size="20"></td>
			</tr>
			<tr>
				<td>Source of Compliant</td>
				<td width="180">
				<input type="text" name="complaint_source" size="20"></td>
			</tr>
			<tr>
				<td>Complained by</td>
				<td width="180">
				<input type="text" name="complained_by" size="20"></td>
			</tr>
			<tr>
				<td>Engineer Name</td>
				<td width="180">
				<input type="text" name="engineer_name" size="20"></td>
			</tr>
			<tr>
				<td>Issue Opened Date</td>
				<td width="180">
				<input type="text" name="date_opened" size="20" value="dd/mm/yyyy"></td>
			</tr>
			<tr>
				<td>Issue Closed Date</td>
				<td width="180">
				<input type="text" name="date_closed" size="20" value="dd/mm/yyyy"></td>
			</tr>
			<tr>
				<td>Priority</td>
				<td width="180">
				

					<p><select size="1" name="priority">
					<option selected>Low</option>
					<option>Moderate</option>
					<option>High</option>
					</select></p>
				
				</td>
			</tr>
			<tr>
				<td>Status</td>
				<td width="180">
				
					
					<p><select size="1" name="status">
					<option selected>In Process</option>
					<option>Closed</option>
					<option>Pending</option>
					</select></p>
				
				</td>
			</tr>
			<tr>
				<td>Mobile No.</td>
			<td width="180">
			<input type="text" name="contact_no" size="20"></td>
			</tr>
			<tr>
				<td>Compliant</td>
				<td width="180">
				
					
					<p><textarea rows="2" name="complaint" cols="20"></textarea></p>
				
				</td>
			</tr>
			<tr>
				<td>
							
				<p>&nbsp;</td>
				<td width="180"><input type="submit" value="Submit" name="B1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="Reset" name="B2"></td>
			</tr>
		</table>
		</form>
	</div>
	</c:if>
	
	
	
	<table border="0" cellpadding="0" cellspacing="0" width="1139" height="534">
		
		<tr>
			<td valign="top" height="534" width="1139">
						<div style="position: absolute; width: 100px; height: 42px; z-index: 5; left: 1288px; top: 9px" id="layer5">
							<font face="Garamond"><a href="logout">
							<font color="#000000" size="4"><strong><blink><u>
							Logout</u></blink></strong></font></a></font></div>
&nbsp;</td>
		</tr>
	</table>

</body>
</html>