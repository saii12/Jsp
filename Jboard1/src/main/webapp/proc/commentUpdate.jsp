<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String comment = request.getParameter("comment"); // 왜 comment로 수신하는 거지??
	String no = request.getParameter("no");
	String parent = request.getParameter("parent");
	
	ArticleDAO dao = new ArticleDAO();
	dao.updateComment(no, comment);
	
	response.sendRedirect("/Jboard1/view.jsp?no="+parent); // "/Jboard1/view.jsp?no="+no 이렇게 하면 댓글 no임
%>
