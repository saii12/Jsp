<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String parent = request.getParameter("parent");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	
	ArticleDAO dao = new ArticleDAO();
	dao.deleteComment(no);
	
	dao.updateArticleForCommentMinus(parent);
	
	response.sendRedirect("/Farmstory1/board/view.jsp?no="+no+"&parent="+parent+"&group="+group+"&cate="+cate); // 파라미터 이거 맞냐??? ㅇㅇ 맞음, view로 다시 전송해야하니까
	
%>