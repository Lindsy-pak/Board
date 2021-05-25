package com.koreait.board7.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.board7.MyUtils;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardDTO param = new BoardDTO();
		
		//페이징
		final int recordCnt = 5; 
		int cPage = MyUtils.getParamInt("cPage", request); // current page = cPage
		if(cPage == 0) { // 0이 되는 경우 쿼리스트링이 없으면 null을 보낸다??(0이 넘어왓다는 경우는 오류가 터졋거나 쿼리스트링이 없을 경우)
			cPage = 1; // 1페이지라도 보내주겠다. 오류를 잡아주는 기능 
		}
		int startIdx = (cPage - 1) * recordCnt;
		param.setStartIdx(startIdx);
		param.setRecordCnt(recordCnt);
		
		//검색
		int searchType = MyUtils.getParamInt("searchType", request);
		String searchText = request.getParameter("searchText");
		
		if(searchType != 0 && searchText != null && !searchText.equals("")) { //검색을 했을 때만 실행 되도록 
			param.setSearchType(searchType);
			param.setSearchText(searchText);
		}
		
		request.setAttribute("pagingCnt", BoardDAO.selPagingCnt(param));
		request.setAttribute("list", BoardDAO.selBoardList(param));
		
		MyUtils.openJSP("리스트", "board/boardList", request, response);
	}

}
