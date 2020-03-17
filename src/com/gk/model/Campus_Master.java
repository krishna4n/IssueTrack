package com.gk.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Campus_Master {
	@Id
	@GeneratedValue
	public int id;
	public String campus_name;
	public String campus_code;
	public String city_name;
	public String zone_code;
	public String zone_name;
	public String full_name;
	
	
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getZone_code() {
		return zone_code;
	}
	public void setZone_code(String zone_code) {
		this.zone_code = zone_code;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCampus_name() {
		return campus_name;
	}
	public void setCampus_name(String campus_name) {
		this.campus_name = campus_name;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getZone_name() {
		return zone_name;
	}
	public void setZone_name(String zone_name) {
		this.zone_name = zone_name;
	}
	public String getCampus_code() {
		return campus_code;
	}
	public void setCampus_code(String campus_code) {
		this.campus_code = campus_code;
	}
}
