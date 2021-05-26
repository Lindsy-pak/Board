package com.koreait.board7.cmt;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.board7.MyUtils;

@WebServlet("/board/cmtInsSel")
public class BoardCmtInsSelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    //리스트 : 리액트나 뷰로 하는게 더 편함(지금 하는 방법은 리액트를 수동으로 하는 방법임)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int iboard = MyUtils.getParamInt("iboard" , request);
		System.out.println("iboard : " + iboard); //잘 받아졌는지 test
		BoardCmtEntity param = new BoardCmtEntity();
		param.setIboard(iboard);
		
		List<BoardCmtDomain> list = BoardCmtDAO.selBoardCmtList(iboard);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.setCharacterEncoding("UTF-8");//한글 깨짐 방지 (다이렉트로 연결하기 때문에 설정해주어야한다.)
		response.getWriter()
		.append(json);
	}
	
	
	
	
	//등록
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int iboard = MyUtils.getParamInt("iboard", request);
		String cmt = request.getParameter("cmt");
		int iuser = MyUtils.getLoginUser(request);
		
		BoardCmtEntity param = new BoardCmtEntity();
		param.setIboard(iboard);
		param.setCmt(cmt);						
		param.setIuser(iuser);
		
		int result = BoardCmtDAO.insBoardCmt(param);
		
		response.getWriter()
		.append("{")
		.append("\"result\":")
		.append(String.valueOf(result))
		.append("}")
		.flush();
		
		//{"result":1}
	}

}
