<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% //사용자 화면 필요 없어서 스크립트릿만

	//인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
 	//전송 데이터 수신
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	// 회원 여부 확인
	if(pw.equals("1234")){ //문자열비교 equals
		// 회원일 경우 -> 세션 기록
		
		// 자동 로그인 처리(자동로그인 체크박스 체크했으면)
		if(auto != null){ //auto.equals("1")도 가능
			Cookie autoCookie = new Cookie("cid", id); // 자동로그인 체크 안하면 쿠키 안 생김 / 쿠키명이 cid 이고, 값이 id 인 쿠키객체
			autoCookie.setMaxAge(60*3); // 유효기간 3분 설정
			response.addCookie(autoCookie);
		}
		session.setAttribute("sessid", id);
		response.sendRedirect("./loginSuccess.jsp");
	}else{
		// 회원이 아닐 경우	
		response.sendRedirect("./loginForm.jsp");
	}
%>
