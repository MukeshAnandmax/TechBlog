package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

	Connection con;

	/**
	 * @param con
	 */
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean f = false;
		try {
			String q = "insert into likes(postid,userid) values(?,?)";
			PreparedStatement ps = this.con.prepareStatement(q);
			ps.setInt(1, pid);
			ps.setInt(2, uid);

			ps.executeUpdate();
			f = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	public int countLikeOnPost(int pid) {
		int count = 0;

		try {

			String q = "select count(*) from likes where postid =?";
			PreparedStatement ps = this.con.prepareStatement(q);
			ps.setInt(1, pid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return count;

	}

	public boolean isLikedbyUser(int pid, int uid) {
		boolean f = false;

		try {
			String q = "select * from likes where postid=? and  userid=?";
			PreparedStatement ps = this.con.prepareStatement(q);
			ps.setInt(1, pid);
			ps.setInt(2, uid);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				f = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return f;

	}

	public boolean deleteLike(int pid, int uid) {

		boolean f = false;

		try {
			String q = "delete from likes where postid=? and  userid=?";
			PreparedStatement ps = this.con.prepareStatement(q);
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			
			ps.executeUpdate();
			
				f = true;
			

		} catch (Exception e) {

			e.printStackTrace();
		}

		return f;
	}
}
