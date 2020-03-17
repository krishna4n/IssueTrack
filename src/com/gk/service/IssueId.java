package com.gk.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.gk.model.Issue_Details;

public class IssueId {
	
	public String getissueid(SessionFactory sessionFactory,String zone_code,String city_name)
	{
	
	String lastTwo = null ;
	int digit=1001;
	String issueid = null;
	Session session1= sessionFactory.openSession();
	session1.beginTransaction();
	Criteria cr = session1.createCriteria(Issue_Details.class);
	cr.setProjection(Projections.max("issue_id"));
	cr.add(Restrictions.eq("zone_code", city_name));
	@SuppressWarnings("rawtypes")
	List temp = cr.list();
	String cl= (String) temp.get(0);
	DateFormat f = new SimpleDateFormat("M");
	DateFormat format = new SimpleDateFormat("M/yyyy");
	if(cl !=null)
	{
	String ccl= cl.substring(10,11);
	
	if (cl.length()>=2 && ccl.equals(f.format(new Date()))){lastTwo=(cl.substring(cl.lastIndexOf('/') + 1));
		  
		  int value =Integer.parseInt(lastTwo);
		   digit=value+1;
		   
		   System.out.println("last two value      :"+lastTwo); 
		}
	
	
	issueid = "vjait/"+zone_code+"/"+format.format(new Date())+"/"+digit;
	
	}


	if(cl ==null)
	{
			  
		   	   
	issueid = "vjait/"+zone_code+"/"+format.format(new Date())+"/"+digit;
	
	}
	return issueid;

}
}

