package com.koreait.board7.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.koreait.board7.DBUtils;


public class UserDAO {
	public static int selIdChk(String uid) {
		// 아이디가 있으면 리턴: 1, 아이디가 없으면 리턴: 0
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "SELECT iuser FROM t_user WHERE uid = ?";

		try {
			con = DBUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, uid.trim()); //trim : 양쪽에 빈칸이 있으면 없애준다 

			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(con, ps, rs);
		}
		return result;

	}
	public static UserEntity selUser(UserEntity vo) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserEntity result = null;

		String sql = "SELECT iuser, uid, upw, unm FROM t_user WHERE uid = ?";

		try {
			con = DBUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getUid());

			rs = ps.executeQuery();

			if (rs.next()) {
				int iuser = rs.getInt("iuser");
				String uid = rs.getString("uid");
				String upw = rs.getString("upw");
				String unm = rs.getString("unm");

				result = new UserEntity();

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
	public static int insertUser(UserEntity vo) {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "INSERT INTO t_user "
				+ " (uid, upw, unm, gender) "
				+ " VALUES "
				+ " (?, ?, ?, ?)";
		
		try {
			con = DBUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, "uid");
			ps.setString(2, "upw");
			ps.setString(3, "unm");
			ps.setString(4, "gender");
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(con, ps);
		}
		return 0;
	} 
	public static int loginUser(UserEntity vo) {
		//로그인 성공:1, 아이디없음:2, 비밀번호틀림: 3, 에러: 0
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql  = "SELECT * FROM t_user WHERE uid= ?";
		
		try {
			con = DBUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, "uid");
			rs = ps.executeQuery();
			
			if(rs.next()) { //아이디가 있는경우 비밀번호 체크
				String dbPw = rs.getString("upw");
				if(BCrypt.checkpw(vo.getUpw(), dbPw)) {
					int iuser = rs.getInt("iuser");
					String unm = rs.getString("unm");
					
					vo.setIuser(iuser);
					vo.setUnm(unm);
					
					return 1;
				} else {
					return 3; // 비밀번호 틀림
				}
			} else { //아이디가 없는 경우 
				return 2; 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			DBUtils.close(con, ps, rs);
		}
		
		
		
	}

}
