package kr.co.jboard2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.jboard2.service.UserService;

@WebServlet("/user/authEmail.do")
public class AuthEmailController extends HttpServlet{
	private static final long serialVersionUID = 9094836002104883300L;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	UserService service = UserService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		
		int status = service.sendCodeByEmail(email);
		
		// json생성
		JsonObject json = new JsonObject();
		json.addProperty("status", status);
		
		// json출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code = req.getParameter("code");
		logger.info("code : " + code);
		
		int result = service.confirmCodeByEmail(code);
		logger.info("result : " + result);
		
		// JSON생성
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		// JSON출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
}
