package kr.co.jboard2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.dto.UserDTO;

@WebServlet("/list.do") // list.do 앞에 / 쓰는 거 주의!
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 7787169292569437228L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 현재 세션 가져오기
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
		
		if(sessUser != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("list.jsp"); // webapp에 바로 속해있으면 list.jsp 바로 쓸 수 있음 
			dispatcher.forward(req, resp);
		}else {
			resp.sendRedirect("/Jboard2/user/login.do?success=101");
		}
		
		
		
	}
}
