package controller;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import service.MemberService;

@WebServlet("/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = -1059275453772015863L;
	
	// enum을 활용한 싱글톤 객체
	private MemberService service = MemberService.INSTANCE;
		
	// JAVA 기본로거
	private Logger logger = Logger.getGlobal();
		

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<MemberDTO> members = service.selectMembers();
		
		// View에서 members 참조하기 위해 request Scope 저장
		req.setAttribute("members", members);
		
		// 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
