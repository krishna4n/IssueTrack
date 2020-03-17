package com.gk.service;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.gk.model.Campus_Master;



public class Campus_List {

	public List<Campus_Master> campus_name(SessionFactory sessionFactory)
	{
		
		Session session = sessionFactory.openSession();
		String hql = "select * from Campus_Master order by campus_name asc";
		session.beginTransaction();
		SQLQuery query = session.createSQLQuery(hql);
		query.addEntity(Campus_Master.class);
		@SuppressWarnings("unchecked")
		List<Campus_Master> names = (List<Campus_Master>)query.list();
		session.getTransaction().commit();
		session.close();
		
		return names;
		
	}

}
