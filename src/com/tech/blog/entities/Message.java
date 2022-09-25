package com.tech.blog.entities;

public class Message {
	
	private String Content;
	private String type;
	private String cssClass;
	
	
	/**
	 * @param content
	 * @param type
	 * @param cssClass
	 */
	public Message(String content, String type, String cssClass) {
		super();
		Content = content;
		this.type = type;
		this.cssClass = cssClass;
	}
	
	
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	
	
	

}
