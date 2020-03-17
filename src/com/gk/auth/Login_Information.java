package com.gk.auth;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Login_Information {
    @Id
    @GeneratedValue
	public Long id;
	public String public_ip;
	public String os_name;
	public String user_name;
	public Date logged_time;
	public Date logout_time;
	public String session_value;
	public long session_start;
	public long session_end;
	
	
	public String getSession_value() {
		return session_value;
	}
	public void setSession_value(String session_value) {
		this.session_value = session_value;
	}
	public long getSession_start() {
		return session_start;
	}
	public void setSession_start(long session_start) {
		this.session_start = session_start;
	}
	public long getSession_end() {
		return session_end;
	}
	public void setSession_end(long l) {
		this.session_end = l;
	}
	public String getOs_name() {
		return os_name;
	}
	public void setOs_name(String os_name) {
		this.os_name = os_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Date getLogged_time() {
		return logged_time;
	}
	public void setLogged_time(Date date) {
		this.logged_time = date;
	}
	public Date getLogout_time() {
		return logout_time;
	}
	public void setLogout_time(Date date) {
		this.logout_time = date;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPublic_ip() {
		return public_ip;
	}
	public void setPublic_ip(String public_ip) {
		this.public_ip = public_ip;
	}
	 
}
