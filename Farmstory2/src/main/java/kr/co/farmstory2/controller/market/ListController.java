package kr.co.farmstory2.controller.market;

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

import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.ProductService;

@WebServlet("/market/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 8543347364327031519L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.instance;
	private ProductService pService = ProductService.instance;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		String pg   = req.getParameter("pg");
		
		// 로그는 꼭 출력해서 확인하는 습관을 가지세요.
		logger.debug("type : " + type);
		logger.debug("pg : " + pg);
		
		if(type == null){ // 그냥 장보기 버튼 눌렀을 때 type 값 null 이니까 전체상품 조회된다
			type = "0";
		}

		// 현재 페이지 번호
		int currentPage = aService.getCurrentPage(pg);
		
		// 전체 상품 갯수 
		int total = pService.selectCountProductsTotal(type);
		
		// 마지막 페이지 번호
		int lastPageNum = aService.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] result = aService.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작번호
		int pageStartNum = aService.getPageStartNum(total, currentPage);
		
		// 시작 인덱스
		int start = aService.getStartNum(currentPage);
		
		// 상품 조회
		List<ProductDTO> products = pService.selectProducts(type, start); //type 값에 따라 ProductDAO에서 다른 SQL 실행
		
		// ProductDTO - toString 재정의 아시죠?
		logger.debug(products.toString());

		// VIEW 참조 공유
		req.setAttribute("type", type);
		req.setAttribute("total", total);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		req.setAttribute("products", products);		
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/market/list.jsp");
		dispatcher.forward(req, resp);
	}

}
