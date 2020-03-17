package com.gk.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;
import com.gk.auth.User;
import com.gk.model.Campus_Master;
import com.gk.model.Issue_Details;
import com.gk.service.Campus_List;
import com.gk.service.Date_Report;
import com.gk.service.IssueUpdate;
import com.gk.service.Issue_Entry;
import com.gk.service.LogOut;
import com.gk.service.LoginService;
import com.gk.service.PendingIssue_Service;
import com.gk.service.RecentUpdates;
import com.gk.service.UserList;


@Controller
public class ActionController {
	
	@Autowired
	public SessionFactory sessionFactory;
		
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@RequestMapping("/")
	public String home()
	{
		return "login";
	}
		
	@RequestMapping(value="/Logon")
	public String Login(HttpServletRequest request,HttpServletResponse reponse,Model model)
	{
		System.out.println("Hibernate Session Instance is"+getSessionFactory());
		String returnValue="login";
		String loginerror="Invalid Username / Password.  <br> Please Try Again";
		HttpSession httpsession = request.getSession(true);
		String user_name= request.getParameter("username");
		String pass_word= request.getParameter("password");
		if(httpsession.getAttribute("$@auth$")!=null)
		{
			returnValue="secured";
		}
		
		if(user_name!=null && pass_word!=null)
		{
			LoginService loginservice= new LoginService();
					
			returnValue = loginservice.check(user_name, pass_word,getSessionFactory(),request);
			
	    }
		
		model.addAttribute("loginerror", loginerror);
		System.out.println("Session value in Action class      "+httpsession.getAttribute("$@auth$"));
		return returnValue;

	}
      
    @RequestMapping(value="/entry.do")
	public String entry(@ModelAttribute("formError") @Valid Issue_Details detailsValidation,BindingResult result,HttpServletRequest request,Model model,RedirectView view) throws IOException, ParseException
	{
    	String returnValue="error";
    	 	System.out.println("error value"+detailsValidation.campus_name);
    	if(result.hasErrors()) {
    	    		
            return "secured";
        }
    	  	
       
		
		Issue_Entry issue_entry = new Issue_Entry();
		if(issue_entry.Entry(request,getSessionFactory(),model).equals("success"))
		{
			
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("msg", "Record Inserted Successfully");
			returnValue="redirect:/Logon";
			
		}
		
	
		return returnValue;
		
	}
    
    @RequestMapping(value="/toupdatelist*")
    public String IssueUpdateList(Model model,HttpServletRequest request)
    {
    	
        
    	IssueUpdate toupdate = new IssueUpdate();
    	Issue_Details updateList=toupdate.toupdate_details(getSessionFactory(),Long.parseLong(request.getParameter("id")));
    	model.addAttribute("updateList", updateList);
		return "secured";
    	
    }
    
    
    @RequestMapping(value="/update.html*")
    public String edit(HttpServletRequest request)
    {
    	String returnValue="issue_list";
    	
    	IssueUpdate update = new IssueUpdate();
    	System.out.println("issue id in update.html action"+request.getParameter("id"));
    	update.update(getSessionFactory(),Long.parseLong(request.getParameter("id")),request.getParameter("status"),request.getParameter("comment"),request.getParameter("issue_date_closed"));
    	HttpSession httpsession= request.getSession();
    	httpsession.setAttribute("updated_msg",request.getParameter("issue_id")+" Issue is "+ request.getParameter("status"));
    	return "redirect:"+returnValue;
    }
    
    @RequestMapping(value="issue_list")
    public String issue_list(Model model)
    {

		Session session1 = sessionFactory.openSession();
		session1.beginTransaction();
		String hql= "select * from Issue_Details where date_time >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) order by id desc ";
		SQLQuery query=session1.createSQLQuery(hql);
		query.addEntity(Issue_Details.class);
		@SuppressWarnings("unchecked")
		List<String> details= (List<String>) query.list();
		
	    	model.addAttribute("details",details);
	    		    
	    	session1.getTransaction().commit();
		session1.close();
    	return "secured";
    }
    @RequestMapping(value="logout")
    public String logout(HttpServletRequest request)
    {
    	HttpSession session = request.getSession();
    	session.setAttribute("$@auth$", null);
    	
    	new LogOut(getSessionFactory(), request);
    	
		return "login";
		}
    
    @ModelAttribute("campus_name")
    
    	public List<Campus_Master> campuslist(Model model)
    	{
    	Campus_List list= new Campus_List();
    		return list.campus_name(getSessionFactory());
    	}
    	
    	@ModelAttribute("users")
    	public List<User> userlist()
    	{
    		UserList user = new UserList();
    		return user.list(getSessionFactory());
    		
    	}
    	
    	@ModelAttribute("recent_Updates")
    	public List<Issue_Details> Issuelist(Model model)
    	{
    		RecentUpdates updates = new RecentUpdates();
    		return updates.issueid_list(getSessionFactory());
    	}
    	

    	@RequestMapping("pending_issues")
      public String Pending_Issue(Model model)
    	{
    		PendingIssue_Service service = new PendingIssue_Service();
    		model.addAttribute("pending_issues", service.Issue_List(getSessionFactory()));
    		
    		return "secured";
    	}
    	
    	@RequestMapping(value="Report")
    	public String Reports(Model model,HttpServletRequest request)
    	{
    		Date_Report date_report=new Date_Report();
    		model.addAttribute("report_list", date_report.Only_Date(getSessionFactory(), request));
    		return "report";
    	}
    	
    	@RequestMapping(value="change_password")
    	public String Change_Password()
    	{
    		return"changepassword";
    	}
    
}
