<%@page import="kr.farmstory1.dto.OrderDTO"%>
<%@page import="kr.farmstory1.dao.OrderDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String buyer = request.getParameter("buyer");
	String hp = request.getParameter("hp");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String etc = request.getParameter("etc");
	
	OrderDTO dto = new OrderDTO();
	//dto.setOrderProduct(orderProduct);
	//dto.setOrderCount(orderProduct);
	//dto.setOrderDelivery(orderProduct);
	//dto.setOrderPrice(orderProduct);
	//dto.setOrderTotal(orderProduct);
	//dto.setOrderEtc(orderProduct);
	//dto.setOrderUser(buyer);
	
	OrderDAO dao = new OrderDAO();
	dao.insertOrder(dto);
%>