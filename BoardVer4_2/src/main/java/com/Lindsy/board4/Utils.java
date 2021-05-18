package com.Lindsy.board4;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Utils {
	public static void moveToJsp(String jsp, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("/WEB_INF/jsp/" + jsp + ".jsp").forward(request, response);
	}
	

}
