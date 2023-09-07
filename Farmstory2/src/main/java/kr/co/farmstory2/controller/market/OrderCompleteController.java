package kr.co.farmstory2.controller.market;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.OrderDTO;
import kr.co.farmstory2.service.OrderService;

@WebServlet("/market/orderComplete.do") 
public class OrderCompleteController extends HttpServlet{

	private static final long serialVersionUID = -5379432086154831804L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private OrderService service = OrderService.instance;
	
	@Override //order.jsp에서 a태그 이용하여 스크립트를 통해 form post전송함 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String orderProduct = req.getParameter("orderProduct");
		String orderCount = req.getParameter("orderCount");
		String orderDelivery = req.getParameter("orderDelivery");
		String orderPrice = req.getParameter("orderPrice");
		String orderTotal = req.getParameter("orderTotal");
		String receiver = req.getParameter("receiver");
		String hp = req.getParameter("hp");
		String zip = req.getParameter("zip");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String orderEtc = req.getParameter("orderEtc");
		String orderUser = req.getParameter("orderUser");
		
		OrderDTO dto = new OrderDTO(); 
		dto.setOrderProduct(orderProduct); // dto 메서드에 매개 변수로 들어갈 때, 모든 속성 할 필요없고 필요한 속성만 지정해준다
		dto.setOrderCount(orderCount);
		dto.setOrderDelivery(orderDelivery);
		dto.setOrderPrice(orderPrice);
		dto.setOrderTotal(orderTotal);
		dto.setReceiver(receiver);
		dto.setHp(hp);
		dto.setZip(zip);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		dto.setOrderEtc(orderEtc);
		dto.setOrderUser(orderUser);
		
		// 로거 잊지 마세요.
		logger.debug(dto.toString());
		
		service.insertOrder(dto);
		
		// success 코드값으로 적절하게 사용자 메시지 띄워주세요.예) "상품 주문이 완료되었습니다."
		resp.sendRedirect("/Farmstory2/market/list.do?success=200");
	}

}
