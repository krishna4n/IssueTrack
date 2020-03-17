package com.gk.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.ui.Model;

import com.gk.model.Campus_Master;
import com.gk.model.Issue_Details;

public class Issue_Entry {

	

	public String Entry(HttpServletRequest request,SessionFactory sessionFactory,Model model)
	{
		String zone_code= null;
		String city_name= null;
		String campus_code=null;
		String campus_name=null;
	
		Session session2= sessionFactory.openSession();
		session2.beginTransaction();
		String h="select * from Campus_Master where campus_code=:campus_name";
		SQLQuery query1= session2.createSQLQuery(h);
		query1.addEntity(Campus_Master.class);
		query1.setParameter("campus_name", request.getParameter("campus_name"));
			@SuppressWarnings("unchecked")
			List<Campus_Master> name= (List<Campus_Master>)query1.list();
		
		   for(Campus_Master zone : name)
		   {
			   campus_name=zone.campus_name;
			   campus_code=zone.campus_code;
	        zone_code= zone.zone_code;
	        city_name= zone.city_name;
		   }
		session2.close();
		
		SimpleDateFormat format= new SimpleDateFormat("hh:mm aa");
		
		HttpSession httpsession = request.getSession();
		Issue_Details issue_details = new Issue_Details();
		IssueId issueid= new IssueId();
		issue_details.setIssue_id(issueid.getissueid(sessionFactory,zone_code,city_name));
		issue_details.setIssue_type(request.getParameter("issue_type"));
		issue_details.setCity_name(city_name);
		issue_details.setCampus_name(campus_name);
		issue_details.setCampus_code(campus_code);
		issue_details.setSection_name(request.getParameter("section_name"));
		issue_details.setComplaint_source(request.getParameter("complaint_source"));
		issue_details.setComplained_by(request.getParameter("complained_by"));
		issue_details.setEngineer_name(request.getParameter("engineer_name"));
		issue_details.setUpdated_date_time(new Date());
		
			issue_details.setIssue_date_opened(request.getParameter("issue_date_opened")+" "+format.format(new Date()));
		
		issue_details.setIssue_date_closed(request.getParameter("issue_date_closed"));
		issue_details.setPriority(request.getParameter("priority"));
		issue_details.setStatus(request.getParameter("status"));
		issue_details.setContact_no(request.getParameter("contact_no"));
		issue_details.setComment(request.getParameter("comment"));
		issue_details.setDate_time(new Date());
		issue_details.setCreated_by(((String)httpsession.getAttribute("$@auth$")));
		issue_details.setComplaint(request.getParameter("complaint"));
		
		issue_details.setZone_code(city_name);
		issue_details.setSession_value(httpsession.getId());
			
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(issue_details);
		session.getTransaction().commit();
		session.close();
		
		Session session1 = sessionFactory.openSession();
		session1.beginTransaction();
		String hql= "from Issue_Details order by id desc ";
		Query query=session1.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Issue_Details> details= (List<Issue_Details>) query.list();
		
	    	model.addAttribute("details",details);
	    	System.out.println("Issue details query result"+details);
	    
	    	session1.getTransaction().commit();
		session1.close();
		return "success";
		
	}
	
	
}
