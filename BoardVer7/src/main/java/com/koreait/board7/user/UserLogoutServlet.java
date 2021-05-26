package com.koreait.board7.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/logout")
public class UserLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*
		 * HttpSession hs = request.getSession(); 
		 * hs.invalidate();
		 * response.sendRedirect("user/login");
		 */
		
		HttpSession hs = request.getSession(); 
		hs.invalidate();
		
		String referer = request.getHeader("referer");
		System.out.println("referer : " + referer);
		
		response.sendRedirect(referer);
		//페이지 유지하면서 로그아웃 되는 기능 (로그아웃 갔다가 다시 리스트로 돌아오는 것임)
		//페이지 유지는 ajax로 하는것 
		
		
	}
}
