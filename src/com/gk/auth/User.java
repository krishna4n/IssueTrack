package com.gk.auth;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue
	public Long id;
	public int role_id;
	public String role_name;
	public String user_name;
	public String pass_word;
	public String zone_name;
	public String zone_code;
	public String path;
	public String name;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPass_word() {
		return pass_word;
	}
	public void setPass_word(String pass_word) {
		this.pass_word = pass_word;
	}
	public String getZone_name() {
		return zone_name;
	}
	public void setZone_name(String zone_name) {
		this.zone_name = zone_name;
	}
	public String getZone_code() {
		return zone_code;
	}
	public void setZone_code(String zone_code) {
		this.zone_code = zone_code;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
