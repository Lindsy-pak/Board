package com.koreait.board7.cmt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.board7.MyUtils;

@WebServlet("/BoardCmtDelUpdServlet")
public class BoardCmtDelUpdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int icmt = MyUtils.getParamInt("icmt", request);
		int iuser = MyUtils.getLoginUser(request);
		
		BoardCmtEntity param = new BoardCmtEntity();
		param.setIcmt(icmt);
		param.setIuser(iuser);
		
		int result = BoardCmtDAO.delBoardCmt(param);
		
		response.getWriter()
		.append("{")
		.append("\"resullt\":")
		.append(String.valueOf(result))
		.append("}")
		.flush();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
