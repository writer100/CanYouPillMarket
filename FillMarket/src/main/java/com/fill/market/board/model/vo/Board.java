package com.fill.market.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board implements Serializable {
	
	private static final long serialVersionUID = 79337L;
	
	private int qaNo;
	private String qauserId;
	private String qaTitle;
	private String qaContent;
	private Date qauploadDate;
	private String status;
	public Board() {
		super();
	}
	public Board(int qaNo, String qaTitle, String qauserId, String qaContent, Date qauploadDate, String status) {
		super();
		this.qaNo = qaNo;
		this.qaTitle = qaTitle;
		this.qauserId = qauserId;
		this.qaContent = qaContent;
		this.qauploadDate = qauploadDate;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Board [qaNo=" + qaNo + ", qaTitle=" + qaTitle + ", qauserId=" + qauserId + ", qaContent=" + qaContent
				+ ", qauploadDate=" + qauploadDate + ", status=" + status + "]";
	}
	public int getQaNo() {
		return qaNo;
	}
	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}
	public String getQaTitle() {
		return qaTitle;
	}
	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public String getQauserId() {
		return qauserId;
	}
	public void setQauserId(String qauserId) {
		this.qauserId = qauserId;
	}
	public String getQaContent() {
		return qaContent;
	}
	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}
	public Date getQauploadDate() {
		return qauploadDate;
	}
	public void setQauploadDate(Date qauploadDate) {
		this.qauploadDate = qauploadDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
