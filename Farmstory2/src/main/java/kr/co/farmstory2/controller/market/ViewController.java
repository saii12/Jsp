package kr.co.farmstory2.controller.market;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.ProductService;

@WebServlet("/market/view.do")
public class ViewController extends HttpServlet{

	private static final long serialVersionUID = -3295565614586754536L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = ProductService.instance;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pNo = req.getParameter("pNo");
		
		ProductDTO product = service.selectProduct(pNo);
		
		req.setAttribute("product", product); // requestDispatcher 문단보다 먼저 나와야함. 뒤에 나오면 view.jsp에서 표현언어 쓸 때 속성이 지정 안되어있기때문
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/market/view.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
	
}
