package com.gk.service;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;

import com.gk.model.Issue_Details;

public class PendingIssue_Service {
	public List<Issue_Details> Issue_List(SessionFactory sessionFactory)
	{
		Session session= sessionFactory.openSession();
		session.beginTransaction();
		String hql = "select * from Issue_Details where status<>'closed'";
		SQLQuery query = session.createSQLQuery(hql);
		query.addEntity(Issue_Details.class);
		@SuppressWarnings("unchecked")
		List<Issue_Details> list = query.list();
		session.close();
		return list;
	}

}