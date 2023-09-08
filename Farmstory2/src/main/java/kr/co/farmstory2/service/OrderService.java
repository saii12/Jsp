package kr.co.farmstory2.service;

import java.util.List;

import kr.co.farmstory2.dao.OrderDAO;
import kr.co.farmstory2.db.SQL;
import kr.co.farmstory2.dto.OrderDTO;

public enum OrderService {

	instance;
	
	private OrderDAO dao = new OrderDAO();
	
	public void insertOrder(OrderDTO dto) {
		dao.insertOrder(dto);
	}
	public OrderDTO selectOrder(int orderNo) {
		return dao.selectOrder(orderNo);
	}
	public List<OrderDTO> selectOrders(int start) {
		return dao.selectOrders(start);
	}
	public void updateOrder(OrderDTO dto) {
		dao.updateOrder(dto);
	}
	public void deleteOrder(int orderNo) {
		dao.deleteOrder(orderNo);
	}
	// 추가
	public int selectCountOrders() {
		return dao.selectCountOrders();
	}
}
