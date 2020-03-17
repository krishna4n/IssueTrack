package com.gk.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.gk.auth.Login_Information;

public class LogOut {
	
	public LogOut(SessionFactory sessionFactory,HttpServletRequest request)
	{
		HttpSession httpsession = request.getSession();
		Session session= sessionFactory.openSession();
		session.beginTransaction();
		Login_Information information = new Login_Information();
		information.setLogout_time(new Date());
		String hql="update Login_Information set logout_time=:logout_time where session_value=:session_value";
		SQLQuery query = session.createSQLQuery(hql);
		query.setParameter("session_value", httpsession.getId());
		query.setParameter("logout_time", new Date());
		query.addEntity(Login_Information.class);
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
	}

}
