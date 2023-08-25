package controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import service.MemberService;

@WebServlet("/modify.do")
public class ModifyController extends HttpServlet {
	
	private static final long serialVersionUID = 869132539560143035L;

	
	// enum을 활용한 싱글톤 객체
	private MemberService service = MemberService.INSTANCE;
		
	// JAVA 기본로거
	private Logger logger = Logger.getGlobal();
		
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		MemberDTO member = service.selectMember(uid);
		
		req.setAttribute("member", member); // 이렇게 함으로써 modify.jsp에서 member객체를 조회할 수 있음
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/modify.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid"); // modify.jsp 에서 수정을 딱 누를때 폼 전송되는데, 그 때 데이터 수신하는 것 / 폼전송을 post전송으로 했고, 그래서 doPost에서 작성 
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String pos = req.getParameter("pos");
		String dep = req.getParameter("dep");
		
		MemberDTO dto = new MemberDTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setPos(pos);
		dto.setDep(dep);
				
		service.updateMember(dto);
		
		resp.sendRedirect("/Ch11/list.do");
	}
	
}
