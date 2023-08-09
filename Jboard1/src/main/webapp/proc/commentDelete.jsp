<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");	
	String parent = request.getParameter("parent");

	ArticleDAO dao = new ArticleDAO();
	
	// 댓글 삭제
	dao.deleteComment(no); // deleteComment 가 매개변수 int no일때는 어떻게 해야한다구???
			
	// 댓글 카운트 수정
	dao.updateArticleForCommentMinus(parent); // 왜 parent로 받는거지??

			
	response.sendRedirect("/Jboard1/view.jsp?no="+parent);
%>