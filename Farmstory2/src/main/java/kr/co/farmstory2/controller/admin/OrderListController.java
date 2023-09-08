package kr.co.farmstory2.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.OrderDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.OrderService;

@WebServlet("/admin/orderList.do")
public class OrderListController extends HttpServlet {

	private static final long serialVersionUID = 3598256116361939488L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private OrderService oService = OrderService.instance;
	private ArticleService aService = ArticleService.instance;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pg = req.getParameter("pg");
		
		
		// 현재 페이지 번호
		int currentPage = aService.getCurrentPage(pg);
		
		// 전체 주문 갯수 
		int total = oService.selectCountOrders();
		
		// 마지막 페이지 번호
		int lastPageNum = aService.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] result = aService.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작번호
		int pageStartNum = aService.getPageStartNum(total, currentPage);
		
		// 시작 인덱스
		int start = aService.getStartNum(currentPage);
		
		// 주문 조회
		List<OrderDTO> orders = oService.selectOrders(start);
		
		// ProductDTO - toString 재정의 아시죠?
		logger.debug(orders.toString());
		

		logger.debug("pg : " + pg);
		// VIEW 참조 공유
		req.setAttribute("total", total);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		req.setAttribute("orders", orders);	
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/orderList.jsp");
		dispatcher.forward(req, resp);
		
	}

}
