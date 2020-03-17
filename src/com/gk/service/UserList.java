package com.gk.service;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;

import com.gk.auth.User;

public class UserList {
	
	public List<User> list(SessionFactory sessionFactory)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		String hql="select name from User where role_id=2 order by name asc";
		SQLQuery query = session.createSQLQuery(hql);
		@SuppressWarnings("unchecked")
		List<User> list = query.list();
		session.close();
		return list;
	}

}
