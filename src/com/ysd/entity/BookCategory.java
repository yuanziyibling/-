package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class BookCategory {
	private Integer cid;
	private String cname;
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "BookCategory [cid=" + cid + ", cname=" + cname + "]";
	}
	
}
