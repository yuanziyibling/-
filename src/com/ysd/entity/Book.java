package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Book {
	private Integer bid;
	private String bname;
	private String price;
	private String zuozhe;
	private String jianjie;
	private String liyou;
	private BookCategory bookCategory;
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getZuozhe() {
		return zuozhe;
	}
	public void setZuozhe(String zuozhe) {
		this.zuozhe = zuozhe;
	}
	public String getJianjie() {
		return jianjie;
	}
	public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
	}
	public String getLiyou() {
		return liyou;
	}
	public void setLiyou(String liyou) {
		this.liyou = liyou;
	}
	public BookCategory getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(BookCategory bookCategory) {
		this.bookCategory = bookCategory;
	}
	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bname=" + bname + ", price=" + price + ", zuozhe=" + zuozhe + ", jianjie="
				+ jianjie + ", liyou=" + liyou + ", bookCategory=" + bookCategory + "]";
	}
	
}
