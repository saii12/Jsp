package controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.MemberService;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1670048826130368737L;

	
	// enum을 활용한 싱글톤 객체
	private MemberService service = MemberService.INSTANCE;
		
	// JAVA 기본로거
	private Logger logger = Logger.getGlobal();
	
	@Override
	public void init() throws ServletException {
	}
	 
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String uid = req.getParameter("uid"); // doGet 메서드에서 작성해야함
		 service.deleteMember(uid);
		 
		 resp.sendRedirect("/Ch11/list.do");
	}
	 
	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
	}
	 
}
