package com.gk.model;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Issue_Details {
	@Id
	@GeneratedValue
	public Long id;
	public String issue_id;
	@NotEmpty(message="Select Complaint Type")
	public String issue_type;
	public String city_name;
	
	public String campus_code;
	
	@NotEmpty(message="Select Campus Name")
	public String campus_name;
	@NotEmpty(message="Select Section Name")
	public String section_name;
	@NotEmpty(message="Select Source of Complaint")
	public String complaint_source;
	public String complained_by;
	
	public String engineer_name;
    @NotEmpty(message="Date format DD/MM/YYYY")
	public String issue_date_opened;
	public String issue_date_closed;
	public String priority;
	@NotEmpty(message="Please Note Complaint")
	public String complaint;
	public String status;
	@Digits(integer = 11, fraction = 0)
	@NotEmpty(message="Enter Contact No.")
	public String contact_no;
	public String comment;
	public Date date_time;
	public Date updated_date_time;
	
	public String created_by;
	public String zone_code;
	public String session_value;
	
	public String getSession_value() {
		return session_value;
	}
	public void setSession_value(String session_value) {
		this.session_value = session_value;
	}
	public String getZone_code() {
		return zone_code;
	}
	public void setZone_code(String zone_code) {
		this.zone_code = zone_code;
	}
	public String getComplaint() {
		return complaint;
	}
	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public Long getId() {
		return id;
	}
	public String getIssue_id() {
		return issue_id;
	}
	public String getIssue_type() {
		return issue_type;
	}
	public String getCity_name() {
		return city_name;
	}
	public String getCampus_name() {
		return campus_name;
	}
	public String getSection_name() {
		return section_name;
	}
	public String getComplaint_source() {
		return complaint_source;
	}
	public String getComplained_by() {
		return complained_by;
	}
	public String getEngineer_name() {
		return engineer_name;
	}
	public String getIssue_date_opened() {
		return issue_date_opened;
	}
	public String getIssue_date_closed() {
		return issue_date_closed;
	}
	public String getPriority() {
		return priority;
	}
	public String getStatus() {
		return status;
	}
	public String getContact_no() {
		return contact_no;
	}
	public String getComment() {
		return comment;
	}
	public Date getDate_time() {
		return date_time;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setIssue_id(String issue_id) {
		this.issue_id = issue_id;
	}
	public void setIssue_type(String issue_type) {
		this.issue_type = issue_type;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public void setCampus_name(String campus_name) {
		this.campus_name = campus_name;
	}
	public void setSection_name(String section_name) {
		this.section_name = section_name;
	}
	public void setComplaint_source(String complaint_source) {
		this.complaint_source = complaint_source;
	}
	public void setComplained_by(String complained_by) {
		this.complained_by = complained_by;
	}
	public void setEngineer_name(String engineer_name) {
		this.engineer_name = engineer_name;
	}
	public void setIssue_date_opened(String date) {
		this.issue_date_opened = date;
	}
	public void setIssue_date_closed(String issue_date_closed) {
		this.issue_date_closed = issue_date_closed;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setDate_time(Date date_time) {
		this.date_time = date_time;
	}
	public String getCampus_code() {
		return campus_code;
	}
	public void setCampus_code(String campus_code) {
		this.campus_code = campus_code;
	}
	public Date getUpdated_date_time() {
		return updated_date_time;
	}
	public void setUpdated_date_time(Date updated_date_time) {
		this.updated_date_time = updated_date_time;
	}
	
}
