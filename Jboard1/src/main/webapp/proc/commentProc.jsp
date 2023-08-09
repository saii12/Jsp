<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); // 폼에서 데이터 전송할 때 부호화 한 걸 한글로 다시 수신
	String parent = request.getParameter("parent");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String regip = request.getRemoteAddr();
	
	
	ArticleDTO dto = new ArticleDTO();
	dto.setParent(parent);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setRegip(regip);
	
	
	ArticleDAO dao = new ArticleDAO();
	
	// 댓글 입력
	dao.insertComment(dto);
	
	// 댓글 카운트 수정
	dao.updateArticleForCommentPlus(parent);

	response.sendRedirect("/Jboard1/view.jsp?no="+parent);
%>