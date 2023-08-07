<%@page import="kr.co.jboard1.vo.ArticleVO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file"); 
	String writer = request.getParameter("writer"); // 이렇게 수신될 수 있도록 write.jsp form에 name="writer"를 작성해준다. or 세션객체생성: UserVO sessUser = (UserVO) session.getAttribute("sessUser"); 이 방법도 가능한데 writer롤 데이터 수신하는 방식이 더 간편하고 쉬움 
	String regip = request.getRemoteAddr();
	
	ArticleVO vo = new ArticleVO();
	vo.setTitle(title);
	vo.setContent(content);
	vo.setWriter(writer);
	vo.setRegip(regip);
		
	
	// 데이터베이스 처리
	ArticleDAO dao = new ArticleDAO(); // 싱글톤 아닐 땐 이렇게
	dao.insertArticle(vo);

	// 리다이렉트
	response.sendRedirect("/Jboard1/list.jsp");
%>
