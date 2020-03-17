package com.gk.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.gk.auth.Login_Information;
import com.gk.auth.User;

public class LoginService {
	
	
	
	public String check(String user_name,String pass_word,SessionFactory sessionFactory,HttpServletRequest request)
	{
		String returnValue="login";
		if(user_name!=null && user_name.trim()!="")
		{
			if(pass_word!=null && pass_word.trim()!="")
			{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		String sql ="select * from User where user_name=:user_name and pass_word= :pass_word";
		SQLQuery query=session.createSQLQuery(sql);
		query.addEntity(User.class);
		query.setParameter("user_name", user_name);
		query.setParameter("pass_word", pass_word);
		@SuppressWarnings("unchecked")
		List<User> user_details =  query.list();
		session.getTransaction().commit();
		session.close();
		
		
		
		
		System.out.println("in login service");
		String os_name=request.getParameter("os_name");
		String public_ip=request.getParameter("public_ip");
		Session session1= sessionFactory.openSession();
		session1.beginTransaction();
		HttpSession httpsession= request.getSession();
		Login_Information loginformation = new Login_Information();
		loginformation.setUser_name(user_name);
		loginformation.setOs_name(os_name);
		loginformation.setPublic_ip(public_ip);
		loginformation.setLogged_time(new Date());
		loginformation.setLogout_time(new Date());
		loginformation.setSession_value(httpsession.getId());
		loginformation.setSession_start(httpsession.getCreationTime());
		loginformation.setSession_end(httpsession.getLastAccessedTime());
		session1.save(loginformation);
		session1.getTransaction().commit();
		session1.close();
		
		
		
		
		
		for(User details: user_details)
		{
			
		
		if(!details.path.equals(null))
		{
			
			httpsession.setAttribute("$@auth$",user_name);
			httpsession.setAttribute("zone_code", details.zone_code);
			httpsession.setAttribute("role_id", details.role_id);
			returnValue =details.path;
		}
		
		}
		}
		}
		return returnValue;
	}
	
}
