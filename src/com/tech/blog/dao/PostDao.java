package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.helper.ConnectionProvider;

public class PostDao {
	
	Connection con;

	/**
	 * @param con
	 */
	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	//Get all the post
	public ArrayList<Post>  getAllPost(){
		
		ArrayList<Post> list = new ArrayList<Post>();
		
		try {
			
			PreparedStatement p = con.prepareStatement("select * from post order by pid desc");
			ResultSet rs = p.executeQuery();
			
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pPic = rs.getString("ppic");
				Timestamp pdate = rs.getTimestamp("pdate");
				int cid = rs.getInt("catid");
				int uId = rs.getInt("uId");
				
				
				Post post = new Post(pid,pTitle,pContent,pCode,pPic,pdate,cid,uId);
				
				list.add(post);
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
public ArrayList<Post>  getAllPostbyCatId( int catId){
		
		ArrayList<Post> list = new ArrayList<Post>();
		
		try {
			PreparedStatement p = con.prepareStatement("select * from post where catid=?");
			p.setInt(1, catId);
			ResultSet rs = p.executeQuery();
			
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pPic = rs.getString("ppic");
				Timestamp pdate = rs.getTimestamp("pdate");
			
				int uId = rs.getInt("uId");
				
				Post post = new Post(pid,pTitle,pContent,pCode,pPic,pdate,catId,uId);
				
				list.add(post);
			
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
 public ArrayList<Category> getAllCategory(){
		
		ArrayList<Category> list = new ArrayList<Category>();
		
		
		try {
			String q = "Select * from  categroies";
			//con = ConnectionProvider.getConnection();
			
			Statement st = this.con.createStatement();
			ResultSet rs = st.executeQuery(q);
			
			while(rs.next()) {
				
				int cid = rs.getInt("cid");
				String name =	rs.getString("cname");
				String description =	rs.getString("cdecription");
				
				Category c =  new Category(cid,name,description);
				
				list.add(c);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return list;
		
	}
	
	public boolean savePost(Post p) {
		boolean f = false;
		
		try {
			String q = "insert into post(ptitle,pcontent,pcode,ppic,catid,uId) values(?,?,?,?,?,?)";
			PreparedStatement ps  = con.prepareStatement(q);
			ps.setString(1, p.getpTitle());
			ps.setString(2, p.getpContent());
			ps.setString(3, p.getpCode());
			ps.setString(4 ,p.getpPic());
			ps.setInt(5, p.getCid());
			ps.setInt(6, p.getuId());
			
			ps.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
		
	}
	
	
	
	
	
	
public Post  getAllPostbyPostId( int postId){
		
	Post post =null;
		
		try {
			PreparedStatement p = con.prepareStatement("select * from post where pid=?");
			p.setInt(1, postId);
			ResultSet rs = p.executeQuery();
			
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pPic = rs.getString("ppic");
				Timestamp pdate = rs.getTimestamp("pdate");
				int catId = rs.getInt("catid");
				int uId = rs.getInt("uId");
				
			 post = new Post(pid,pTitle,pContent,pCode,pPic,pdate,catId,uId);
				
			
			
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
	
	
	
	
	
	
	

}
