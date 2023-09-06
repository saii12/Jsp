package kr.co.farmstory2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//시작페이지 index.jsp가 없기 때문에 기본주소("")에 대한 맵핑 추가
@WebServlet(value = {"", "/index.do"})  // 코드는 치다가 완성못하고 남겨두면 전체페이지가 안된다 => 주석처리할 것
public class IndexController extends HttpServlet{

	private static final long serialVersionUID = -5141473195026626452L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
	}
}
