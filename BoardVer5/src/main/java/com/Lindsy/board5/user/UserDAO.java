package com.Lindsy.board5.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Lindsy.board5.DBUtils;

public class UserDAO {
	public static UserVO selUser(UserVO param) { //user의 정보를 가져옴 
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		UserVO result = null;
		String sql = "SELECT iuser, uid, upw, unm FROM t_user WHERE uid = ?";
		
		try {
			con = DBUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, param.getUid());
			rs = ps.executeQuery();
			
			if(rs.next()) {
				int iuser = rs.getInt("iuser");
				String uid = rs.getString("uid");
				String upw = rs.getString("upw");
				String unm = rs.getString("unm");
				
				result = new UserVO();
				
				result.setIuser(iuser);
				result.setUid(uid);
				result.setUpw(upw);
				result.setUnm(unm);
			}
			return result;
			  
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		} finally {
			DBUtils.close(con, ps, rs);
		}
		
		
		
		
		
		
	}
}