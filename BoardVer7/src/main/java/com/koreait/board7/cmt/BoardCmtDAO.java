package com.koreait.board7.cmt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.koreait.board7.DBUtils;

public class BoardCmtDAO {
	public static List<BoardCmtDomain> selBoardCmtList(BoardCmtEntity param) {
		List<BoardCmtDomain> list = new ArrayList();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT A.icmt, A.cmt, A.regdate, "
				+ " B.iuser, B.unm AS writerNm "
				+ " FROM t_board_cmt A "
				+ " INNER JOIN t_user B "
				+ " ON A.iuser = B.iuser "
				+ " WHERE A.iboard = ? "
				+ " ORDER BY A.icmt ASC "; //댓글은 보통 최신댓글이 가장 밑에 달린다.
		
		try {
			con = DBUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getIboard());
			rs = ps.executeQuery();
			
			
			while(rs.next()) { // 여러개 댓글을 불러온다. record가 있었는지 없었는지 확인을 하려면 if를 써야함
				BoardCmtDomain vo = new BoardCmtDomain();
				list.add(vo);
				
				vo.setIcmt(rs.getInt("icmt"));
				vo.setCmt(rs.getString("cmt")); //"cmt"는 데이터 베이스의 컬럼명이기 때문에 대소문자 안가린다.
				vo.setRegdate(rs.getString("regdate"));
				vo.setIuser(rs.getInt("iuser"));
				vo.setWriterNm(rs.getString("writerNm"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(con, ps, rs);
		}
		return list;
	}
	public static int delBoardCmt(BoardCmtEntity param) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "DELETE FROM t_board_cmt WHERE ?";
		
		
		
		
		
		
	}
}
