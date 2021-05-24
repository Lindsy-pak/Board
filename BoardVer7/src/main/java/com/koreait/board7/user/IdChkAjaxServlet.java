package com.koreait.board7.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/idChk")
public class IdChkAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		
		System.out.println("uid : " + uid);
		int result = UserDAO.selIdChk(uid);
		
		/*PrintWriter pw = response.getWriter();
		pw.append("");
		pw.append("");
		pw.append("");*/
		
		
		//체인 기법
		response.getWriter() //Writer : jsp 응답하는 기능
		.append("{\"result\" : ") //append : 문자열 합치기 기능 
		.append(String.valueOf(result))
		.append("}") //메모리가 절약 된다. + 로 문자열 붙이는 것보다
		// for문에서는 Stringbuilder를 사용해야한다 (컴파일러가 자동으로 안해줌)
		.close(); //자동으로 닫아주긴함 
		
//		{"result" : 1} 둘 중 하나가 응답함 
//		{"result" : 0}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
