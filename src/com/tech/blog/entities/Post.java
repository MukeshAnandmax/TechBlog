package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
	
	private int pid;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private Timestamp pdate;
	private int cid;
	private int uId;
	/**
	 * @param pid
	 * @param pTitle
	 * @param pContent
	 * @param pCode
	 * @param pPic
	 * @param pdate
	 * @param cid
	 * @param uId
	 */
	public Post(int pid, String pTitle, String pContent, String pCode, String pPic, Timestamp pdate, int cid, int uId) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pdate = pdate;
		this.cid = cid;
		this.uId = uId;
	}
	/**
	 * @param pTitle
	 * @param pContent
	 * @param pCode
	 * @param pPic
	 * @param pdate
	 * @param cid
	 * @param uId
	 */
	public Post(String pTitle, String pContent, String pCode, String pPic, Timestamp pdate, int cid, int uId) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pdate = pdate;
		this.cid = cid;
		this.uId = uId;
	}
	/**
	 * 
	 */
	public Post() {
		super();
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	/**
	 * @param pTitle
	 * @param pContent
	 * @param pCode
	 * @param pPic
	 * @param cid
	 * @param uId
	 */
	public Post(String pTitle, String pContent, String pCode, String pPic, int cid, int uId) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.cid = cid;
		this.uId = uId;
	}
	
	
	
	

}
