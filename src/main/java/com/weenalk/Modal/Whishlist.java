package com.weenalk.Modal;

public class Whishlist extends Product{
	private String status;
	
	public Whishlist() {
		
	}

	public Whishlist(String status) {
		super();
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
}
