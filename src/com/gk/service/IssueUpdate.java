package com.gk.service;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.text.SimpleDateFormat;
import java.util.Date;







import com.gk.model.Issue_Details;

public class IssueUpdate {

	public String update(SessionFactory sessionFactory,Long id,String status,String comment,String issue_date_closed)
	{
		
		Session session = sessionFactory.openSession();
				
		String hql="update Issue_Details set status=:status , issue_date_closed=:issue_date_closed, comment=:comment, updated_date_time=:updated_date_time where id=:id";
		SimpleDateFormat format= new SimpleDateFormat("hh:mm aa");
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setParameter("status",status);
		query.setParameter("issue_date_closed",issue_date_closed+" "+format.format(new Date()));
		query.setParameter("comment", comment);
		query.setParameter("updated_date_time", new Date());
		session.beginTransaction();
		query.executeUpdate();
		
		session.getTransaction().commit();
		session.close();
		return "secured";
	}
	
	public Issue_Details toupdate_details(SessionFactory sessionFactory,long id)
	{
		Long value= id;
	
	Session session = sessionFactory.openSession();
	session.beginTransaction();
	Issue_Details idlist= (Issue_Details) session.get(Issue_Details.class, value);
	session.getTransaction().commit();
	session.close();
		return idlist;
		
	}
}
