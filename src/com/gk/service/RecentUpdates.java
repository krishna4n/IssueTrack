package com.gk.service;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Order;

import com.gk.model.Issue_Details;

public class RecentUpdates {

	
	public List<Issue_Details> issueid_list(SessionFactory sessionFactory)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Criteria cr = session.createCriteria(Issue_Details.class);
		cr.addOrder(Order.desc("id")).setMaxResults(14);
		@SuppressWarnings("unchecked")
		List<Issue_Details> id= (List<Issue_Details>)cr.list();
		session.close();
		
		return id;
	}
}
