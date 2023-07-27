<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션해제
	session.invalidate(); // loginForm에서 sessid 있으면 다시 loginSuccess로 가기 때문에 해제해줘야함

	// 쿠키해제
	Cookie cookie = new Cookie("cid", null); //왜 새로 만듦???
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	// 리다이렉트
	response.sendRedirect("./loginForm.jsp");

%>