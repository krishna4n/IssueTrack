package com.gk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
public class InterceptorAspect {
	@Around("AllModels()")
	public Object Authenticate(ProceedingJoinPoint joinPoint)
	{
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session=request.getSession();
		Object returnValue ="login";
		try {
			System.out.println("In Aspect Try block Session value is"+session.getAttribute("$@auth$"));
			if((session.getAttribute("$@auth$")!=null) && ((session.getAttribute("$@auth$"))!=""))
			{
			returnValue = joinPoint.proceed();
			}
		} 
		catch (Throwable e) {
			System.out.println("In Aspect Catch Block  "+e);
			e.printStackTrace();
		}
		
		return returnValue;
	}

	
	@Pointcut("execution(* issue_list(..)) || execution(* entry(..)) || execution(* edit(..)) || execution(* Pending_Issue(..)) || execution(* IssueUpdateList(..))")
	public void AllModels(){}
		
}
