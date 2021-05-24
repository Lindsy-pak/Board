package com.koreait.board7.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.board7.MyUtils;

@WebServlet("/user/join")
public class UserJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		request.setAttribute("title", "회원가입");
		request.setAttribute("jsp", "user/userJoin");	
		
		String jsp = "/WEB-INF/view/template.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
		*/
		//위에 일들을 다 하도록 만든 메서드 openJSP();
		
		MyUtils.openJSP("회원가입", "user/userJoin", request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		int gender = MyUtils.getParamInt("gender", request);
		String unm = request.getParameter("unm");
		
		System.out.println("uid : " + uid);
		System.out.println("upw : " + upw);
		System.out.println("gender : " + gender);
		System.out.println("unm : " + unm);
		
		response.sendRedirect("login");
	}

}
