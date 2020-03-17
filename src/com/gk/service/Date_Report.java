package com.gk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.gk.model.Issue_Details;

public class Date_Report {
	public List<Issue_Details> Only_Date(SessionFactory sessionFactory,HttpServletRequest request)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		String hql="select * from issue_details where STR_TO_DATE(issue_date_opened,'%d/%m/%Y') between STR_TO_DATE(:start_date,'%d/%m/%Y') AND STR_TO_DATE(:end_date,'%d/%m/%Y')";
		SQLQuery query= session.createSQLQuery(hql);
		query.addEntity(Issue_Details.class);
		query.setParameter("start_date", request.getParameter("start_date"));
		query.setParameter("end_date", request.getParameter("end_date"));
		@SuppressWarnings("unchecked")
		List<Issue_Details> report_list= query.list();
		session.close();
		return report_list;
		
	}

}
